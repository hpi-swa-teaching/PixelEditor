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
	#'squeak_changestamp' : 'GLE 6/7/2024 20:43'
}
PECanvas >> brush [

	self submorphsDo: [:each | each className = #PEBrush ifTrue:[^ each]]
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
	#'squeak_changestamp' : 'GLE 6/7/2024 20:54'
}
PECanvas >> fitSubmorphs [

	self layer do: [:each | each fitSubmorphs]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:49'
}
PECanvas >> initialize [

	super initialize.
	self beSticky;
		layoutFrame: (LayoutFrame fractions: (0 @ 0 rect: 1 @ 1));
		setUpBackground
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:55'
}
PECanvas >> layer [

	| collection |
	
	collection := OrderedCollection new.
	self submorphs do: [:each | each basicType = #PELayer ifTrue: [collection add: each]].
	^ collection
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
	#'squeak_changestamp' : 'GLE 6/10/2024 16:48'
}
PECanvas >> update [

	"NotYetImplemented"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
  
]
