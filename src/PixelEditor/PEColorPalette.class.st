"
A PEColorPalette is changing the color of the color button.
Instance Variables
	colorButton:		type: PEColorButton new
	hsvMorph:			type: HSVMorph new

colorButton
	- We save the colorButton so we can change its color when the accept button is clicked.

hsvMorph
	- We save the HSVMorph so we can access its color to then change the color buttons color.

"
Class {
	#name : #PEColorPalette,
	#superclass : #PEUI,
	#instVars : [
		'colorButton',
		'hsvMorph'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 12:01'
}

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEColorPalette >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [ self addMorph: aMorph ] 
		ifFalse: [ self addMorphBack: (aMorph position: 0 @ (self submorphs last bounds corner y)) ] 
]

{
	#category : #submorphs,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:19'
}
PEColorPalette >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [ self addMorph: aMorph ] 
		ifFalse: [ self addMorphBack: (aMorph position: (self submorphs last bounds corner x) @ 0) ] 
]

{
	#category : #'change color',
	#'squeak_changestamp' : 'GLE 6/22/2024 14:05'
}
PEColorPalette >> adjustColor [

	self colorButton 
		color: self hsvMorph selectedColor;
		doActionLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 17:01'
}
PEColorPalette >> colorButton [

	^ colorButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:20'
}
PEColorPalette >> colorButton: aColorButton [
	
	colorButton := aColorButton.
	self hsvMorph selectedColor: (self colorButton color)

	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 22:36'
}
PEColorPalette >> hsvMorph [

	^ hsvMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/18/2024 11:05'
}
PEColorPalette >> hsvMorph: anHSVMorph [

	hsvMorph := anHSVMorph
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/20/2024 18:55'
}
PEColorPalette >> initialize [

	super initialize.
	self beTransparent
]
