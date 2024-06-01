Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 20:09'
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
		 setUpBackground;
		 placePixel: width // 2 @ height // 2;
		 placePixel: 100 @ 0
	
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
