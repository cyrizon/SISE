from shiny import App, render, ui
import pandas as pd
from shinywidgets import output_widget, render_widget
import plotly.express as px

# Load data
df = pd.read_csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv')

# App UI
app_ui = ui.page_fluid(
    ui.h2("My First App with Data"),
    ui.output_table("data_table")  # Output placeholder for the table
)

# Server logic
def server(input, output, session):
    # Render table with pagination
    @output
    @render.table
    def data_table():
        return df.head(10)  # Render first 10 rows as in Dash's page_size=10

# Create the app object
app = App(app_ui, server)

if __name__ == "__main__":
    app.run()
