#!/usr/bin/python3
import sys
import codecs
import re

def display_unicode(data):
    return "".join(["\\u%s" % hex(ord(l))[2:].zfill(4) for l in data])

with codecs.open(sys.argv[1],'r',encoding='utf8') as f:
    text = f.read()

if text:
    for uni in text.split('\n'):
        data = uni.split("=",1)

        try:
            print("%s=%s" % (data[0], display_unicode(data[1])))
        except:
            print("%s" % uni) #display_unicode(uni))
