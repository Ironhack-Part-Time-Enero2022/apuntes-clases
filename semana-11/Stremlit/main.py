from locale import D_FMT
from multiprocessing.reduction import DupFd
import streamlit as st
from PIL import Image
import src.support as sp
import src.algas as al

# para escribir un título en nuestra página de streamlit 
st.write ("""
# Biodiversidad de especies de algas
""")

st.text("""En esta página encontraréis información básica sobre la distribución y 
características de las especies de algas más importantes""")


# Insertar imágenes en streamlit usando dos columnas
col1, col2 = st.columns(2)
with col1:
    imagen = Image.open("Images/portada1.jpg")
    st.image(imagen, use_column_width=True)
with col2:
    imagen = Image.open("Images/portada2.jpg")
    st.image(imagen, use_column_width=True)


# Podemos hacerlo interactivo y preguntar al usuario
st.write(""" 
### Lista de familias que te puedes encontrar en esta página""")

familias = sp.family_list()
familias.insert(0, "Todas")


col3, col4 = st.columns(2)
with col3:
    select = st.radio("Estas son las familias que tenemos",familias, key = 1)
with col4:
    if select == "Todas":
        st.plotly_chart(sp.pie_chart_family())
    else: 
        st.plotly_chart(sp.pie_chart_genus(select))



# Ahora vamos a devolver la informacion de las especies que quiera el usuario

st.write("### Sobre que especie quieres información?")

especies = sp.lista_especies()
x_axis = st.selectbox("Elige una especie",  ["Elige una opción"] + especies )

if  x_axis == "Elige una opción":    
        st.write("Necesitamos que nos pases una especie")
else:
    #load coordinates info
    data = sp.load_data()
    df = data[data["species"] == f'{x_axis}']
    st.dataframe(df)

    #load species info
    z = sp.load_info()

    z.reset_index(inplace = True)
    t = z[z["species"]== f"{x_axis}"]
    t.drop(["species"], axis = 1, inplace = True)
    st.table(t)

    # create a map with the species presences
   
    #get some conclusions of the data
    st.plotly_chart(sp.plots_year(data, x_axis))
    st.plotly_chart(sp.plots_month(data, x_axis))

   
    st.text("Mapa de la distribución global")
    sp.maps(df)

    st.text("Map of the distribution in a country")
    sp.kepler(df, al.config)

