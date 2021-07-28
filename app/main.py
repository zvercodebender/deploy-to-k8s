from flask import Flask
app = Flask(__name__)

#Normal nginx app display
#test123 pipeline
@app.route("/")
def hello():
    return "Hello it's XLR/XLD/K8 deployment with deploy_to_k8 source code version 5.0.0 to test new workflow"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
