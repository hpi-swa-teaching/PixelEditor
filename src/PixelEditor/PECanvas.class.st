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
	#'squeak_changestamp' : 'Corvin 6/7/2024 21:44'
}
PECanvas >> addPixelAt: aCoordinate [ 
	| pixel |
	pixel := PEPixel new.
	pixel coordinate: aCoordinate;
		 originPixel: self originPixel.
	self addMorph: pixel.
	self matrix at: pixel coordinate put: pixel.
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
	#'squeak_changestamp' : 'Corvin 6/7/2024 21:46'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint.
	self positionOriginPixel.
	self matrix valuesDo: [ :pixel | pixel calculatePosition ].
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/7/2024 22:55'
}
PECanvas >> initialize [
	super initialize.
	originPixel := PEPixel new.
	originPixel color: Color orange.
	matrix := Dictionary new.
	"TODO: Set
	clipSubMorphs to true"
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: false;
		 addMorph: originPixel
		" setupInitialGrid"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/7/2024 22:39'
}
PECanvas >> longerCanvasEdge [
	"TODO find better name"
	| width |
	self bounds width > self bounds height
		ifTrue: [width := self bounds width // originPixel extent x]
		ifFalse: [width := self bounds height // originPixel extent x].
	^width
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
	#'squeak_changestamp' : 'Corvin 6/7/2024 23:02'
}
PECanvas >> setupInitialGrid [
	| width |
	width := 2.
	width negated
		to: width
		do: [:y | width negated
				to: width
				do: [:x | 
					self halt.
					(x = 0
							and: [y = 0])
						ifFalse: [self addPixelAt: x @ y]]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
]
