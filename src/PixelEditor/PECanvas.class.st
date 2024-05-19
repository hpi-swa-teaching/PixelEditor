Class {
	#name : #PECanvas,
	#superclass : #TransformMorph,
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
