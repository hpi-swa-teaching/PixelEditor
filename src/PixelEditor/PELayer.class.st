Class {
	#name : #PELayer,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/16/2024 10:41'
}
PELayer >> basicType [
	
	^#PELayer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 21:12'
}
PELayer >> createPixels [

	| pixelSize width height |
	
	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PEPixel pixelSize.
	self extent: ( width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize)-pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 14:16'
}
PELayer >> initialize [

	super initialize.
	self position: 500 @ 300;
		openInWorld;
		color: Color white;
		borderWidth: 5;
		borderColor: Color black
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 13:57'
}
PELayer >> insertPixelAt: aPoint [

	self addMorphFront: (PEPixel new position: self positionInWorld + aPoint; yourself)
]
