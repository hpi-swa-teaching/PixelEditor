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
	#'squeak_changestamp' : 'Corvin 6/3/2024 17:19'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint. self positionCenterPixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/3/2024 17:14'
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
		 clipSubmorphs: false;
		 addMorph: PEPixel new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/3/2024 18:10'
}
PECanvas >> positionCenterPixel [
	| canvasCenter pixelCenter |
	canvasCenter := self bounds center.
	pixelCenter := self submorphs first bounds center.
	self submorphs first position: canvasCenter // 2 - pixelCenter
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
