# Kepler maps

![portada](https://1fykyq3mdn5r21tpna3wkdyi-wpengine.netdna-ssl.com/wp-content/uploads/2019/05/image1.gif)

`Kepler.gl` is an open-source solution for geospatial data visualization and exploration. Kepler was developed by Uber to make it easier for users of all levels to design meaningful maps that also look good. The tool can handle large amounts of data and has a friendly, intuitive interface that allows users to build effective maps in an instant.

# Install Kepler in Jupyter Notebook

To install `kepler` in jupyter notebook visit the [oficial page](https://docs.kepler.gl/docs/keplergl-jupyter)

**Prerequisites**  
- Python >= 2  
- ipywidgets >= 7.0.0


# Main parameters
## Add_data `add_data()`
Inputs: 

- `data` required CSV, GeoJSON or DataFrame. 
- `name` required data entry.
`name` of the dataset dataId property of each `layer`, `filter` and interaction
    ```python
    # DataFrame
    df = pd.read_csv('hex-data.csv')
    map_1.add_data(data=df, name='data_1')

    # CSV
    with open('csv-data.csv', 'r') as f:
        csvData = f.read()
    map_1.add_data(data=csvData, name='data_2')

    # GeoJSON as string
    with open('sf_zip_geo.json', 'r') as f:
        geojson = f.read()

    map_1.add_data(data=geojson, name='geojson')
    ```

## Save and load config `.config`

- Map configuration
    ```python
    map_1.config
    ## {u'config': {u'mapState': {u'bearing': 2.6192893401015205,
    #  u'dragRotate': True,
    #   u'isSplit': False,
    #   u'latitude': 37.76209132041332,
    #   u'longitude': -122.42590232651203,
    ```

- Config the map
    ```python
    config = {
        'version': 'v1',
        'config': {
            'mapState': {
                'latitude': 37.76209132041332,
                'longitude': -122.42590232651203,
                'zoom': 12.32053899007826
            }
            ...
        }
    },
    map_1.add_data(data=df, name='data_1')
    map_1.config = config
    ```
- Map config
    ```python
    map_1 = KeplerGl(height=400, data={'data_1': my_df}, config=config)
    ```
- Config %run
    ```python
    # Save map_1 config to a file
    with open('hex_config.py', 'w') as f:
    f.write('config = {}'.format(map_1.config))

    # load the config
    %run hex_config.py
    ```


## Save the map `.save_to_html()`

Input
- `data`: optional A data dictionary {"name": data}, if not provided, will use current map data
- `config`: optional map config dictionary, if not provided, will use current map config
- `file_name`: optional the html file name, default is keplergl_map.html
- `read_only`: optional if read_only is True, hide side panel to disable map customization
You can export your current map as an interactive html file.
    ```python
    # this will save current map
    map_1.save_to_html(file_name='first_map.html')

    # this will save map with provided data and config
    map_1.save_to_html(data={'data_1': df}, config=config, file_name='first_map.html')

    # this will save map with the interaction panel disabled
    map_1.save_to_html(file_name='first_map.html' read_only=True)
    ```

# Data used in this repo

**1 -NYC Taxi Trips**

The yellow and green taxi trip records include fields capturing pick-up and drop-off dates/times, pick-up and drop-off locations, trip distances, itemized fares, rate types, payment types, and driver-reported passenger counts. Data is downloaded from NYC Taxi and Limousine Commission (TLC) website. Data source: [TLC](https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page)

**2- San Francisco street tree map**

This dataset contains a list of dpw maintained street trees including planting date, species and location. Data source: [DataSF](https://data.sfgov.org/City-Infrastructure/Street-Tree-List/tkzw-k3nq/data).

**3- Block and block number Vancouver** 

**Block** outlines are one dataset among many that provide information about property. Other related datasets can be found by filtering on the Property keyword. This data in City systems is updated frequently in the normal course of business, however priorities and resources determine how fast a change in reality is reflected in the database.  The extract on this website is updated weekly.  

**Graffiti** This data set provides information on the location of sites with graffiti as identified by City staff. This data in City systems is updated in the normal course of business, however priorities and resources determine how fast a change in reality is reflected in the database. The extract on this web site is updated weekly.

Data source: [opendatavancouver](https://opendata.vancouver.ca/)


**4- NYPD shoots**

**5- Earthquake** 

The Significant Earthquake Database is a global listing of over 5,700 earthquakes from 2150 BC to the present. A significant earthquake is classified as one that meets at least one of the following criteria: caused deaths, caused moderate damage (approximately $1 million or more), magnitude 7.5 or greater, Modified Mercalli Intensity (MMI) X or greater, or the earthquake generated a tsunami. The database provides information on the date and time of occurrence, latitude and longitude, focal depth, magnitude, maximum MMI intensity, and socio-economic data such as the total number of casualties, injuries, houses destroyed, and houses damaged, and $ dollage damage estimates. [More info](https://catalog.data.gov/dataset/global-significant-earthquake-database-2150-bc-to-present) 

Data from kaggle: [earthquake](https://www.kaggle.com/mohitkr05/global-significant-earthquake-database-from-2150bc)  

**6- UK moves**
This dataset shows location of residence and place of work, based on 2011 Census of residence of England and Wales. The data classifies people currently resident in each middle layer super output area, or higher area and shows the movement between their area of residence and workplace. 

Data source: [Nomis](https://www.nomisweb.co.uk/census/2011/wu03uk/chart)

**7- San Francisco countour**

This dataset contains a list of dpw maintained street trees including planting date, species and location.  

Data source: [DataSF](https://data.sfgov.org/City-Infrastructure/Street-Tree-List/tkzw-k3nq/data)






## Further Materials

https://kepler.gl/  
https://leadr-msu.github.io/kepler-gl/   
https://github.com/uber-web/kepler.gl-data   
https://github.com/heshan0131/kepler.gl  
https://towardsdatascience.com4d-data-visualization-with-kepler-gl-b6bd6dd90451
https://towardsdatascience.com/kepler-gl-jupyter-notebooks-geospatial-data-visualization-with-ubers-opensource-kepler-gl-b1c2423d066f 

### Libraries documentation

- [kepler](https://kepler.gl/)  
- [pandas](https://pandas.pydata.org/docs/)
- [geopandas](https://geopandas.org/)
