print("Bonjour")

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# Pour un style plus joli
sns.set(style="whitegrid")

# Génération aléatoire (pour reproductibilité)
np.random.seed(42)

# Paramètres
mois = pd.date_range(start="2023-01-01", periods=12, freq='M')
categories = ['Électronique', 'Vêtements', 'Alimentation']

# Création du DataFrame
data = {
    'Mois': np.tile(mois, len(categories)),
    'Catégorie': np.repeat(categories, len(mois)),
    'Ventes': np.random.randint(1000, 5000, size=len(mois) * len(categories))
}
df = pd.DataFrame(data)

# Affichage d'un aperçu
print(df.head())

# Graphique en lignes
plt.figure(figsize=(12, 6))
sns.lineplot(data=df, x='Mois', y='Ventes', hue='Catégorie', marker='o')

plt.title("Évolution mensuelle des ventes par catégorie")
plt.xlabel("Mois")
plt.ylabel("Ventes (€)")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
