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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 21:06'
}
PECanvas class >> pixelGridHeight [

	^ pixelGridHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 21:06'
}
PECanvas class >> pixelGridWidth [

	^ pixelGridWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/17/2024 21:07'
}
PECanvas class >> pixelGridWidth: aWidth andHeight: aHeight [

	pixelGridWidth := aWidth.
	pixelGridHeight := aHeight 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 17:39'
}
PECanvas class >> pixelSize [

	^ pixelSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 17:39'
}
PECanvas class >> pixelSize: aPixelSize [

	pixelSize := aPixelSize
]

{
	#category : #'update cycle',
	#'squeak_changestamp' : 'GLE 7/11/2024 11:23'
}
PECanvas >> fitSubmorphs [

	self layer do: [:each | each fitSubmorphs ]
]

{
	#category : #initialize,
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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:06'
}
PECanvas >> layer [

	| collection |
	
	collection := OrderedCollection new.
	self submorphs do: [:each | each basicType = #PELayer ifTrue: [ collection add: each ]].
	^ collection
]

{
	#category : #bounds,
	#'squeak_changestamp' : 'GLE 6/17/2024 15:49'
}
PECanvas >> rectangle [

	^ Rectangle origin: self position corner: self bottomRight
]

{
	#category : #'update cycle',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:58'
}
PECanvas >> update [

	"TODO"
]
