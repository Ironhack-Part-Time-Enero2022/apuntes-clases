# 7. MongoDB

```bash
brew tap mongodb/brew
brew install mongodb-community@4.4 #Install
brew services start mongodb-community@4.4 #Start
brew install mongodb/brew/mongodb-database-tools
````

Now, for the GUI (graphic user interface):
```bash
brew install --cask mongodb-compass
```


#### 7.1. Hands-on MongoDB Compass

##### 7.1.1. First, we'll download a dataset
- Open your terminal
- Go to Downloads (`cd Downloads`, if you're in root)

```bash
curl https://atlas-education.s3.amazonaws.com/sampledata.archive -o sampledata.archive
```

##### 7.1.2. Load the dataset
```bash
mongorestore --archive=sampledata.archive
````

##### 7.1.3. Open MongoDB compass
You'll now have various databases to your left. Go to `sample_airbnb` database and then to the collection `listingsAndReviews`. You'll notice you have 5555 documents. 

Hierarchy in mongo is as follows:

`database > collection > document`

##### 7.1.4. Query:
Go to the filter field and write:
```mongo
{property_type:"Apartment"}
````
and then hit Find. The number went down to 3626. 

Your first query to a database! 👏