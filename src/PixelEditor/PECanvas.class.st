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
	#'squeak_changestamp' : 'Corvin 6/3/2024 09:09'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint.
	self positionPixel: self extent.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/2/2024 16:36'
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
		 setUpBackground.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/2/2024 17:19'
}
PECanvas >> positionPixel: aPosition [
	| pixel |
	pixel := PEPixel new.
	pixel position: aPosition.
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
