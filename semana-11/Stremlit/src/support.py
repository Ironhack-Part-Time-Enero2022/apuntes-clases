import pandas as pd
import plotly_express as px
import folium
from folium import Choropleth, Circle, Marker, Icon, map
from streamlit_folium import folium_static
from keplergl import KeplerGl
from streamlit_keplergl import keplergl_static
import streamlit as st
def load_data():
    df = pd.read_csv("data/macroalgae_final.csv", index_col=0)
    df = df.drop(["kingdom", "class", "genus",  "new"], axis = 1)
    df.dropna(inplace=True)
    return df.drop_duplicates(["lon", "lat"])

def family_list():
    data = load_data()
    return list(data["family"].unique())

def lista_especies():
    data = load_data()
    return list(data["species"].unique())


def pie_chart_family():
    df = load_data()
    df2 = df.groupby("family")["family"].agg(["count"]).reset_index()
    fig = px.pie(df2, values = "count", names = "family", title = "number of families on the dataframe")
    fig.update_traces(textposition='inside') # para poner los % dentro del quesito

    fig.update_layout(uniformtext_minsize=15, uniformtext_mode='hide')

    return fig


def pie_chart_genus(familia):
    df = load_data()
    df = df[df["family"]== f'{familia}']
    df2 = df.groupby("country")["country"].agg(["count"]).reset_index()

    fig = px.pie(df2, values = "count", names = "country", title = "number of genus on the dataframe")
    
    fig.update_traces(textposition='inside') # para poner los % dentro del quesito

    fig.update_layout(uniformtext_minsize=15, uniformtext_mode='hide')

    return fig


def plots_year (df, x_axis):
    """
    Function to create a plot to represent the evolution of data through the years
    Args: 
        df: dataframe
        x_axis: target species that you are interested in 
    Returns:
        A plotly line plot
    """
    df = df.groupby(['species', 'year'])['year'].agg(['count']).reset_index()
    df = df[df["species"]== f"{x_axis}"]
    return px.line(df, x='year', y = "count", title = "Number of species per year")

def plots_month(df, x_axis):
    """
    Function to create a plot to represent the evolution of data through the months
    Args: 
        df: dataframe
        x_axis: target species that you are interested in 
    Returns:
        A plotly bar plot
    """
    df = df.groupby(['species', 'month'])['month'].agg(['count']).reset_index()
    df = df[df["species"]== f"{x_axis}"]
    return px.bar(df, x='month', y = "count", title='Number of presences epr month')


def load_info():
    return pd.read_csv("data/species_info.csv", index_col=0)


def maps(df):
    map_sby = folium.Map(tiles="OpenStreetMap", location=[40.4146, -3.7004], zoom_start=2)

    for i,row in df.iterrows():
                
        icon = Icon(color = "green",
                    prefix = "fa",
                    icon = "fa-map-marker",
                    icon_color = "black"
        )

        location_ = {"location" : [row["lat"],row["lon"]],
                     "tooltip" : row["locality"]}
                

        marker_2 = Marker(**location_, icon = icon).add_to(map_sby)

    return folium_static(map_sby)

def kepler (df, con):
    df = pd.DataFrame(df.groupby(['fecha', 'species', 'lat', 'lon'])['number_ind'].sum()).reset_index()
    st.dataframe(df)
    map_3 = KeplerGl(height=600, width=800, config = con)
    map_3.add_data(data = df, name='algae' )

    return keplergl_static(map_3)