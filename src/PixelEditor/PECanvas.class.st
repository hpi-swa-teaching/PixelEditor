Class {
	#name : #PECanvas,
	#superclass : #Morph,
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
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> initialize [

	super initialize.
	self layoutFrame: (LayoutFrame fractions: (0@0 rect: 1@1)).
	self setUpBackground.
	self beSticky
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
