#!/usr/bin/python

import codecs
import re

def display_unicode(data):
    return "".join(["\\u%s" % hex(ord(l))[2:].zfill(4) for l in data])

filename = "Bundle_ua.properties"
#filename = "test"

def propreader(filename):
    #filename = "Bundle_fr.properties"
    vocab = {}
    order = []
    try:
        with codecs.open(filename,'r',encoding='utf8') as f:
            text = f.read()
    except:
        with codecs.open(filename,'r') as f:
            text = f.read()

    if text:
        for uni in text.split('\n'):
	    data = uni.split("=",1)
	
	    try:
#	        print "%s=%s" % (data[0], display_unicode(data[1]))
		vocab[data[0]] = display_unicode(data[1])
		order.append(data[0])
	    except:
#	        print "%s" % #display_unicode(uni)
		vocab[data[0]] = display_unicode(uni)
		order.append(data[0])

    return (order, vocab)

def mainreader(filename, vocab):
    try:
        with codecs.open(filename,'r',encoding='utf8') as f:
            text = f.read()
    except:
        with codecs.open(filename,'r') as f:
            text = f.read()

    if text:
        for uni in text.split('\n'):
	    if uni:
	        try:
                    data = uni.split("=",1)
		    if data[0] in vocab:
                        print "%s=%s" % (data[0], vocab[data[0]])
		    else:
		        print uni
                except:
                    #print "%s" % uni
		    skip = 1

    return ('', '')

vocfile = "Bundle_fr.properties"
vocfile = "Bundle_es_ES.properties"
(o1, p1) = propreader(vocfile)
(o2, p2) = mainreader('Bundle_de.properties', p1)


print p1['requiredField']
