#!/usr/bin/python

import codecs
import re

def display_unicode(data):
    return "".join(["\\u%s" % hex(ord(l))[2:].zfill(4) for l in data])

filename = "Bundle_ua.properties"
filename = "Bundle_de_au.properties"
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
#	    print "%s" % display_unicode(uni)
	    data = uni.split("=",1)
	
	    #try:
#	    print "%s" % len(data)
	    if len(data) > 1:
		no_decode = 1 
		if data[0] == 'file.edit.error.file_exceeds_limit':
		    no_decode = 0
		if data[0] == 'file.versionDifferences.fileGroupTitle':
		    no_decode = 0
		if data[0] == 'file.selectToAdd.dragdropMsg':
		    no_decode = 0
		if data[0] == 'login.builtin.credential.password':
		    no_decode = 0
		if data[0] == 'dataverse.results.count.toofresults':
		    no_decode = 0
		if data[0] == 'metrics.downloads':
		    no_decode = 0

		if no_decode:
		    vocab[data[0]] = display_unicode(data[1])
		    order.append(data[0])
		else:
		    vocab[data[0]] = data[1]
		    order.append(data[0])
	    #except:
	    else:
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

    lineid = 0
    if text:
        for uni in text.split('\n'):
	    lineid = lineid + 1
	    # 730
	    first = ''
	    try:
	        first = uni[0]
	    except:
	        first = ''

	    if first=='#':
		print uni
	    else:
	        if lineid < 3630:
	            try:
                        data = uni.split("=",1)
		        if data[0] in vocab:
			    mkey = data[0]
			    mkey = mkey.replace(' ', '')
			    if mkey:
                                print "%s=%s" % (mkey, vocab[data[0]])
			    else:
			        print ""
		        else:
		            print uni
                    except:
                        print "%s" % uni
		        skip = 1
	        else:
		    print uni

    return ('', '')

vocfile = "Bundle_fr.properties"
vocfile = "Bundle_es_ES.properties"
vocfile = "Bundle_de_au.properties"
vocfile = "/tmp/Bundle_ua.properties"
vocfile = "Bundle_sl.properties"
(o1, p1) = propreader(vocfile)
#p1 = {}
(o2, p2) = mainreader('Bundle.properties', p1)


#print p1['requiredField']
