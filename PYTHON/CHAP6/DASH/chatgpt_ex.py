import dash
from dash import dcc, html, Input, Output, State
import dash_bootstrap_components as dbc
import pandas as pd
import plotly.express as px
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, classification_report
from sklearn.datasets import load_iris

# Charger le dataset Iris
iris = load_iris()

# Préparer le DataFrame Iris
df = pd.DataFrame(iris.data, columns=iris.feature_names)
df['target'] = iris.target
df['target_name'] = df['target'].map({i: iris.target_names[i] for i in range(3)})

# Application Dash
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Layout principal avec une barre latérale pour la navigation
app.layout = dbc.Container([
    dbc.Row([
        dbc.Col([
            html.H2("Iris Dashboard", className="display-4"),
            html.Hr(),
            dbc.Nav(
                [
                    dbc.NavLink("Visualisation des données", href="/", active="exact"),
                    dbc.NavLink("Graphiques", href="/graphs", active="exact"),
                    dbc.NavLink("Modèles de classification", href="/models", active="exact"),
                ],
                vertical=True,
                pills=True,
            ),
        ], width=2),
        dbc.Col([
            dcc.Location(id='url'),
            html.Div(id='page-content')
        ], width=10)
    ])
], fluid=True)

# Page 1 : Visualisation des données
def render_data_table():
    return html.Div([
        html.H3('Visualisation des données Iris'),
        dcc.Dropdown(
            id='filter-species',
            options=[{'label': name, 'value': name} for name in iris.target_names],
            multi=True,
            placeholder="Filtrer par espèce..."
        ),
        html.Br(),
        html.Div(id='data-table', children=[]),
    ])

@app.callback(
    Output('data-table', 'children'),
    [Input('filter-species', 'value')]
)
def update_table(selected_species):
    if selected_species:
        filtered_df = df[df['target_name'].isin(selected_species)]
    else:
        filtered_df = df
    return dbc.Table.from_dataframe(filtered_df, striped=True, bordered=True, hover=True)

# Page 2 : Graphiques
def render_graphs_page():
    return html.Div([
        html.H3('Graphiques interactifs'),
        dcc.Dropdown(
            id='x-axis',
            options=[{'label': col, 'value': col} for col in iris.feature_names],
            value=iris.feature_names[0],
            placeholder="Choisir l'axe des X"
        ),
        dcc.Dropdown(
            id='y-axis',
            options=[{'label': col, 'value': col} for col in iris.feature_names],
            value=iris.feature_names[1],
            placeholder="Choisir l'axe des Y"
        ),
        dcc.Graph(id='scatter-plot')
    ])

@app.callback(
    Output('scatter-plot', 'figure'),
    [Input('x-axis', 'value'), Input('y-axis', 'value')]
)
def update_scatter_plot(x_col, y_col):
    fig = px.scatter(df, x=x_col, y=y_col, color='target_name',
                     title=f"Scatter Plot ({x_col} vs {y_col})")
    return fig

# Page 3 : Modèles de classification avec Arbre de décision
def render_model_page():
    return html.Div([
        html.H3('Modèles de classification - Arbre de décision'),

        # Layout pour contrôler les paramètres
        html.Label("Profondeur maximale de l'arbre"),
        dcc.Slider(id='max-depth', min=1, max=10, step=1, value=3,
                   marks={i: str(i) for i in range(1, 11)}),

        html.Br(),

        html.Label("Nombre minimum d'échantillons par feuille"),
        dcc.Slider(id='min-samples-leaf', min=1, max=10, step=1, value=1,
                   marks={i: str(i) for i in range(1, 11)}),

        html.Br(),

        html.Label("Nombre minimum d'échantillons pour diviser un noeud"),
        dcc.Slider(id='min-samples-split', min=2, max=10, step=1, value=2,
                   marks={i: str(i) for i in range(2, 11)}),

        html.Br(),
        
        html.Button('Lancer le modèle', id='run-model', n_clicks=0),
        html.Div(id='model-output', children=[])
    ])

@app.callback(
    Output('model-output', 'children'),
    [Input('run-model', 'n_clicks')],
    [State('max-depth', 'value'), State('min-samples-leaf', 'value'), State('min-samples-split', 'value')]
)
def run_classification_model(n_clicks, max_depth, min_samples_leaf, min_samples_split):
    if n_clicks > 0:
        # Préparer les données
        X = df[iris.feature_names]
        y = df['target']

        # Train/Test Split
        X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

        # Modèle d'arbre de décision avec les paramètres sélectionnés
        model = DecisionTreeClassifier(max_depth=max_depth, min_samples_leaf=min_samples_leaf, min_samples_split=min_samples_split)
        model.fit(X_train, y_train)
        y_pred = model.predict(X_test)

        # Calcul des métriques
        accuracy = accuracy_score(y_test, y_pred)
        report = classification_report(y_test, y_pred, target_names=iris.target_names)

        # Retourner les résultats du modèle
        return html.Div([
            html.H5(f"Accuracy : {accuracy:.2f}"),
            html.Pre(report)
        ])
    return ""

# Router pour naviguer entre les pages
@app.callback(
    Output('page-content', 'children'),
    [Input('url', 'pathname')]
)
def display_page(pathname):
    if pathname == "/graphs":
        return render_graphs_page()
    elif pathname == "/models":
        return render_model_page()
    else:
        return render_data_table()

# Lancer le serveur
if __name__ == '__main__':
    app.run(debug=True)