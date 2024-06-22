Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
	#classInstVars : [
		'pixelGridWidth',
		'pixelGridHeight',
		'pixelSize'
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
	#'squeak_changestamp' : 'GLE 6/20/2024 17:39'
}
PECanvas class >> pixelSize [

	^ pixelSize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:39'
}
PECanvas class >> pixelSize: aPixelSize [

	pixelSize := aPixelSize
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
	#'squeak_changestamp' : 'GLE 6/22/2024 13:42'
}
PECanvas >> initialize [

	super initialize.
	self 
		beSticky;
		layoutFrame: (LayoutFrame fractions: (0 @ 0 rect: 1 @ 1));
		borderWidth: 0;
		beTransparent
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
	#'squeak_changestamp' : 'GLE 6/17/2024 15:49'
}
PECanvas >> rectangle [

	^ Rectangle origin: self position corner: self bottomRight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:58'
}
PECanvas >> update [

	"TODO"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
  
]
