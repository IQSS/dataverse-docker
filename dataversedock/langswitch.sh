#!/bin/bash

if [ $LANGSWITCH ]; then
    echo "header.languages.multi=true"
    echo "header.languages.current=$LANG"
    echo "header.languages.dropdown=$LANGSWITCH"
fi
