#!/usr/bin/env bash

SIZE=30

inkscape -w $SIZE -h $SIZE ./idle/sprite-0-symbolic.svg -o idle.png
inkscape -w $SIZE -h $SIZE ./active/sprite-0-symbolic.svg -o ./sprite-0.png
inkscape -w $SIZE -h $SIZE ./active/sprite-1-symbolic.svg -o ./sprite-1.png
inkscape -w $SIZE -h $SIZE ./active/sprite-2-symbolic.svg -o ./sprite-2.png
inkscape -w $SIZE -h $SIZE ./active/sprite-3-symbolic.svg -o ./sprite-3.png
inkscape -w $SIZE -h $SIZE ./active/sprite-4-symbolic.svg -o ./sprite-4.png
