#!/bin/bash

speech=$1
context=$2

convert -background transparent -fill black -gravity center -font font.ttf -size 170x100 caption:"$speech" speech.png
composite -geometry +20+30 speech.png  timmy.png  output.png

convert -border 5 -bordercolor black output.png output1.png
convert -border 15 -bordercolor white output1.png output.png

rm output1.png
rm speech.png

if [ -z $context ]
then
    exit
else
    convert -gravity center -border 1 -bordercolor black -background "#fcfd85" -fill black -font font-thin.ttf -size 180x35 caption:"$context" context.png
    composite -geometry +20+533 context.png  output.png  output-context.png
    rm context.png
    rm output.png
fi
