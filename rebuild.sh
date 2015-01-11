#!/bin/bash
# Simple Script to rebuild the fonts in this package.

# Parameters
fontname="SourceSansPro"
vend="adobe"

# Remove capitals from font
font=${fontname,,}

# Backup the hand-written package
mv tex/latex/$font/$font.sty tex/latex/$font/$font.sty.tmp

# Font features (Version 2.010)
# aalt	Access All Alternates
# c2sc	Small Capitals From Capitals
# case	Case-Sensitive Forms
# ccmp	Glyph Composition/Decomposition
# dnom	Denominators
# frac	Fractions
# kern	Kerning
# liga	Standard Ligatures
# mark	Mark Positioning
# mkmk	Mark to Mark Positioning
# numr	Numerators
# onum	Oldstyle Figures
# ordn	Ordinals
# pnum	Proportional Figures
# salt	Stylistic Alternates
# sinf	Scientific Inferiors
# size	Optical Size
# smcp	Small Capitals
# ss01	Stylistic Set 1
# ss02	Stylistic Set 2
# ss03	Stylistic Set 3
# ss04	Stylistic Set 4
# ss05	Stylistic Set 5
# subs	Subscript
# sups	Superscript
# zero	Slashed Zero

autoinst fonts/opentype/$vend/$font/*	\
	-sanserif							\
	-target=.							\
	-vendor="$vend"						\
	-typeface="$font"					\
	-encoding=OT1,T1,LY1,TS1			\
	-ts1								\
	-smallcaps							\
	-superiors							\
	-inferiors							\
	-fractions							\
	-noswash							\
	-notitling							\
	-noornaments						\
	-noupdmap

# Move the generated file and the hand-written one back
mv tex/latex/$font/$fontname.sty tex/latex/$font/$font-type1-autoinst.sty
mv tex/latex/$font/$font.sty.tmp tex/latex/$font/$font.sty

# Remove empty directories
find . -type d -empty -delete
