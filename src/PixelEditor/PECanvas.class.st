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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:58'
}
PECanvas >> addPixelAt: aCoordinate [ 
	| pixel |
	pixel := PEPixel new.
	pixel coordinate: aCoordinate;
	originPixel: self originPixel.
	self addMorph: pixel.
	pixel calculatePosition
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
	#'squeak_changestamp' : 'Corvin 6/7/2024 16:14'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint. self positionOriginPixel
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
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:57'
}
PECanvas >> originPixel [
 ^originPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:57'
}
PECanvas >> originPixel: aPixel [ 
	originPixel := aPixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/7/2024 16:14'
}
PECanvas >> positionOriginPixel [
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
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
]
