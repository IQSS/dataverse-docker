from flask import Flask, request, Response
import requests
import os
import json

app = Flask(__name__)

@app.route("/v1")
def cv():
    apiurl = "%s/%s" % (os.environ["APIHOST"], "v1/Vocabulary")
    return Response(requests.get(apiurl), mimetype='application/json')

@app.route("/cvlist")
def cvlist():
    apiurl = "%s/%s" % (os.environ["APIHOST"], v1/Vocabulary")
    data = json.loads(requests.get(apiurl).text)
    items = []
    for voc in data['DDI']:
        items.append(voc)
    return Response(json.dumps(items), mimetype='application/json')

@app.route("/", methods=['GET', 'POST'])
def cvmanager():
    keyword = request.args.get("q")
    vocabulary = ''
    if request.args.get("voc"):
        vocabulary = request.args.get("voc")
    else:
        vocabulary = "AnalysisUnit"

    apienvurl = "v1/suggest/Vocabulary/%s/version/1.0/language/en/limit/10/query/%s" % (vocabulary, keyword)
    apiurl = "%s/%s" % (os.environ["APIHOST"], apienvurl)
    return Response(requests.get(apiurl), mimetype='application/json')

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0')
