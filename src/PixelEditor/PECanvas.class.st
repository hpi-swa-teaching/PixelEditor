Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
	#classInstVars : [
		'pixelGridWidth',
		'pixelGridHeight'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 21:06'
}
PECanvas class >> pixelGridHeight [

	^ pixelGridHeight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 21:06'
}
PECanvas class >> pixelGridWidth [

	^ pixelGridWidth
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 21:07'
}
PECanvas class >> pixelGridWidth: aWidth andHeight: aHeight [

	pixelGridWidth := aWidth.
	pixelGridHeight := aHeight 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> clear [
	self removeAllMorphs
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 10:18'
}
PECanvas >> initialize [
	| width height |
	super initialize.
	width := self bounds width.
	height := self bounds height.
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
			beSticky;
		 setUpBackground";
		 placePixel: width // 2 @ height // 2;
		 placePixel: 100 @ 0"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:03'
}
PECanvas >> layer [

	self submorphs do: [:each | each basicType = #PELayer ifTrue: [^ each]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 19:46'
}
PECanvas >> placePixel: aCoordinate [ 
	| pixel |
	pixel := PEPixel new.
	 pixel position: aCoordinate.
	self addMorph: pixel
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
