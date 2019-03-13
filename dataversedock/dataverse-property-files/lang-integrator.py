#!/usr/bin/python

import codecs
import re
import sys
import glob

def display_unicode(data):
    return "".join(["\\u%s" % hex(ord(l))[2:].zfill(4) for l in data])

def property_reader(filename):
    vocab = {}
    order = []
    try:
        with codecs.open(filename,'r',encoding='utf8') as f:
            text = f.read()
    except:
        with codecs.open(filename,'r') as f:
            text = f.read()

    for uni in text.split('\n'):
        data = uni.split("=",1)
	try:
	    data[1] = re.sub(r'\s', ' ', data[1])
	    newtext = "%s=%s" % (data[0], display_unicode(data[1]))
            order.append("%s" % newtext)
	except:
	    order.append("%s" % uni)

    return order

try:
    langfolder = sys.argv[1]
    bundle = []
    for filename in glob.glob("%s/*.properties" % langfolder):
        for line in property_reader(filename):
            bundle.append(line)
    for line in bundle:
        print(line)
except:
    print("Usage: lang-integrator.py dataverse-property-folder/language")
