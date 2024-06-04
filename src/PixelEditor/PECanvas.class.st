Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
	#instVars : [
		'originPixel'
	],
	#category : #PixelEditor
}

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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:38'
}
PECanvas >> initialize [
	| pixel |
	pixel := PEPixel new.
	super initialize.
	originPixel := PEPixel new.
	originPixel color: Color orange.
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: false;
		 addMorph: originPixel;
		addMorph: pixel.
	pixel
		position: (self translateCoordinates: 0 @ 1)
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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:26'
}
PECanvas >> setupPixelGrid [
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
