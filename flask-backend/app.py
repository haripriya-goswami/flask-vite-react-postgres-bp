from flask import Flask, jsonify, request
from flask_cors import CORS
import psycopg2
from datetime import date

DATABASE_URL = "postgresql://journal_user:journal_pass@db:5432/journal_db"

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello from Flask!"