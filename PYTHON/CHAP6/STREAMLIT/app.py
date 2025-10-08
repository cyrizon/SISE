# Import packages
import streamlit as st
import pandas as pd

# Incorporate data
df = pd.read_csv('https://raw.githubusercontent.com/plotly/datasets/master/gapminder2007.csv')

# Initialize the app
st.title('My First App with Data')

# Display the data in a table
st.dataframe(df)