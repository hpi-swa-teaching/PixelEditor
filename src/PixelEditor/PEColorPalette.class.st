Class {
	#name : #PEColorPalette,
	#superclass : #PEUI,
	#instVars : [
		'colorButton',
		'hsvMorph'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 16:10'
}
PEColorPalette class >> colorPaletteExtent [

	^ 150 @ 150
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 16:08'
}
PEColorPalette class >> sizeButtonRow [

	^ 80 @ 150
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 10:27'
}
PEColorPalette class >> textBoxSize [

	^ 96 @ 50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/23/2024 11:55'
}
PEColorPalette >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: 0 @ (self submorphs last bounds corner y))] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/23/2024 18:07'
}
PEColorPalette >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: (self submorphs last bounds corner x) @ 0)] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 22:31'
}
PEColorPalette >> adjustColor [

	self colorButton color: self hsvMorph selectedColor;
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
	#'squeak_changestamp' : 'GLE 6/18/2024 11:12'
}
PEColorPalette >> colorButton: anObject [
	
	colorButton := anObject.
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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 18:55'
}
PEColorPalette >> initialize [

	super initialize.
	self beTransparent
]
