Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
	#instVars : [
		'originPixel',
		'matrix'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 15:14'
}
PECanvas class >> defaultPixelColor [
	^ [Color
		r: 0.1
		g: 0.1
		b: 0.1
		alpha: 1.0]
]

{
	#category : #pixels,
	#'squeak_changestamp' : 'Corvin 6/4/2024 15:23'
}
PECanvas >> addPixel: aCoordinate [ 
	self matrix at: aCoordinate put: PEPixel new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> clear [
	self removeAllMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/3/2024 17:19'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint. self positionCenterPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/4/2024 14:19'
}
PECanvas >> getPixel: aCoordinate [ 
	^ self matrix at: aCoordinate ifAbsent: [self addPixel: aCoordinate]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/4/2024 14:07'
}
PECanvas >> initialize [
	super initialize.
	originPixel := PEPixel new.
	originPixel color: Color orange.
	matrix := Dictionary new.
	"TODO: Set clipSubMorphs to true"
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: false;
		 addMorph: originPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/4/2024 14:09'
}
PECanvas >> matrix [
^matrix
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/4/2024 14:09'
}
PECanvas >> matrix: aMatrix [
matrix := aMatrix
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:22'
}
PECanvas >> positionCenterPixel [
	| canvasCenter pixelCenter newPosition centerOffset |
	canvasCenter := self bounds center.
	pixelCenter := originPixel bounds center.
	centerOffset := originPixel extent // 2 negated.
	newPosition := canvasCenter + centerOffset.
	originPixel position: newPosition.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> setUpBackground [
	| theme |
	
	theme := Smalltalk at: #SqueakTheme ifAbsent: nil.
	theme
		ifNil: [self color: Preferences defaultWorldColor  ] 
		ifNotNil: [ self setAsBackground: theme linenblue ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:44'
}
PECanvas >> translateCoordinates: aCoordinate [ 
	^ originPixel position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
]
