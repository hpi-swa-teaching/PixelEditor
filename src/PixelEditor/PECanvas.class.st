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
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:49'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint. self positionOriginPixel
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:22'
}
PECanvas >> initialize [
	super initialize.
	originPixel := PEPixel new.
	originPixel color: Color orange.
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: false;
		 addMorph: originPixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/24/2024 09:45'
}
PECanvas >> mouseDown: anEvent [
anEvent hand newMouseFocus: self.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/24/2024 00:11'
}
PECanvas >> originPixel [
^ originPixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:48'
}
PECanvas >> positionOriginPixel [
	| canvasCenter pixelCenter newPosition centerOffset |
	canvasCenter := self bounds center.
	pixelCenter := originPixel bounds center.
	centerOffset := originPixel extent // 2 negated.
	newPosition := canvasCenter + centerOffset.
	originPixel position: newPosition
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
