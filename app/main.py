from flask import Flask
app = Flask(__name__)

#Normal nginx app display
#test123 pipeline
@app.route("/")
def hello():
    return "Hello, How about a nice game of chess?"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
