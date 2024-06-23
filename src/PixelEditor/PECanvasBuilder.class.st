Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'canvasBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:16'
}
PECanvasBuilder class >> default [

	canvasBuilder 
		ifNil: [ canvasBuilder := PECanvasBuilder new ].
	^ canvasBuilder
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 22:55'
}
PECanvasBuilder >> buildCanvas [
	
	^ PECanvas new addMorph: self buildLayer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/19/2024 22:55'
}
PECanvasBuilder >> buildCanvasFromJson: aJson [

	^ PECanvas new addMorph: (self buildLayerWithJson: aJson)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:35'
}
PECanvasBuilder >> buildLayer [

	PEPixel selectedColor: Color black.
	^ self createPixelsIn: PELayer new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:35'
}
PECanvasBuilder >> buildLayerWithJson: aJson [

	PEPixel selectedColor: Color black.
	self getDimensionsFromJson: aJson.
	^ self createPixelsFromJson: aJson in: PELayer new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:41'
}
PECanvasBuilder >> colorFromString: aString [

	| json formattedString |
	
	formattedString := '{', (aString copyReplaceAll: '#' with: '"'), '}'.
	json := Json readFromString: formattedString.
	"-1 is the symbol for transparent Color"
	(json at: 'r') = '-1' ifTrue: [^ Color transparent]. 
	^ Color r: (json at: 'r') asNumber g: (json at: 'g') asNumber b: (json at: 'b') asNumber range: 1023.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:42'
}
PECanvasBuilder >> createPixelsFromJson: aJson in: aLayer [

	| pixelSize width height pixelID |

	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PECanvas pixelSize.
	pixelID := aJson size - 3.
	aLayer extent: (width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize)-pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight 
			withColor: (self colorFromString: (aJson at: (pixelID stringForReadout)))
			in: aLayer.
			pixelID := pixelID - 1]].
	^ aLayer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:41'
}
PECanvasBuilder >> createPixelsIn: aLayer [

	| pixelSize width height |
	
	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PECanvas pixelSize.
	aLayer extent: ( width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize) - pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight in: aLayer]].
	^ aLayer
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:45'
}
PECanvasBuilder >> getDimensionsFromJson: aJson [

	PECanvas pixelGridWidth: (aJson at: 'width') asNumber andHeight: (aJson at: 'height') asNumber.
	PECanvas pixelSize: (aJson at: 'pixelSize') asNumber
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:28'
}
PECanvasBuilder >> insertPixelAt: aPoint in: aLayer [

	self insertPixelAt: aPoint withColor: Color transparent in: aLayer
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:45'
}
PECanvasBuilder >> insertPixelAt: aPoint withColor: aColor in: aLayer [

	| pixel |
	pixel := PEPixel new 
		color: aColor; 
		position: aLayer positionInWorld + aPoint;
		extent: PECanvas pixelSize @ PECanvas pixelSize;
		yourself.
	aLayer pixelDictionary at: (pixel position) put: pixel.
	aLayer addMorphFront: pixel
]
