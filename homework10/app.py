# import necessary libraries
from flask import Flask, render_template
from flask_pymongo import PyMongo
import pymongo
import scrape_mars

# create instance of Flask app
app = Flask(__name__)

# create mongo connection
conn = 'mongodb://localhost:27017'

# Pass connection to the pymongo
client = pymongo.MongoClient(conn)

# Connect to database
db = client["mars_data"]

# define collection
collection = db.mars_data_entries


@app.route("/")
def home():
    mars_data = list(db.collection.find())
    print(mars_data)
    return  render_template("index.html", mars_data=mars_data)

@app.route("/scrape_mars")
def web_scrape():
    db.collection.remove({})
    mars_data = scrape_mars.scrape()
    db.collection.insert_one(mars_data)
    return  render_template('scrape.html')

if __name__ == "__main__":
    app.run(debug=True)