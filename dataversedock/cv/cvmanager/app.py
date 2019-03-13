from flask import Flask, request, Response
import requests
import json

app = Flask(__name__)

@app.route("/v1")
def cv():
    apiurl = "http://35.233.91.53/cvmanager/v1/Vocabulary"
    return Response(requests.get(apiurl), mimetype='application/json')

@app.route("/v2")
def v2():
    apiurl = "http://35.233.91.53/cvmanager/v1/Vocabulary"
    data = json.loads(requests.get(apiurl).text)
    items = []
    for voc in data['DDI']:
        items.append(voc)
    return Response(json.dumps(items), mimetype='application/json')

@app.route("/overview", methods=['GET', 'POST'])
def cvoverview():
    voc = ["ELSST", "TimeMethod", "SamplingProcedure", "ModeOfCollection", "TypeOfInstrument"]
    return Response(json.dumps(voc), mimetype='application/json')

@app.route("/", methods=['GET', 'POST'])
def cvmanager():
    keyword = request.args.get("q")
    vocabulary = 'AnalysisUnit'
    lang = 'en'
    if request.args.get("lang"):
        lang = request.args.get("lang")
    if request.args.get("voc"):
        vocabulary = request.args.get("voc")

    apiurl = "http://35.233.91.53/cvmanager/v1/suggest/Vocabulary/%s/version/1.0/language/%s/limit/10/query/%s" % (vocabulary, lang, keyword)
    return Response(requests.get(apiurl), mimetype='application/json')

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0')
