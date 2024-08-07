"
A PECanvasBuilder is building the PELayer, PECanvas and all the pixels and adds them as submorphs to the layer.
Instance Variables

"
Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#classInstVars : [
		'canvasBuilder'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:01'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:13'
}
PECanvasBuilder class >> canvasBuilder [

	^ canvasBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:13'
}
PECanvasBuilder class >> canvasBuilder: aCanvasBuilder [

	^ canvasBuilder := aCanvasBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:14'
}
PECanvasBuilder class >> default [

	self canvasBuilder 
		ifNil: [ self canvasBuilder: self new ].
	^ self canvasBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:13'
}
PECanvasBuilder class >> reset [

	self canvasBuilder: self new
]

{
	#category : #'building canvas, layer',
	#'squeak_changestamp' : 'GLE 6/19/2024 22:55'
}
PECanvasBuilder >> buildCanvas [
	
	^ PECanvas new addMorph: self buildLayer
]

{
	#category : #'building canvas, layer',
	#'squeak_changestamp' : 'GLE 6/19/2024 22:55'
}
PECanvasBuilder >> buildCanvasFromJson: aJson [

	^ PECanvas new addMorph: (self buildLayerWithJson: aJson)
]

{
	#category : #'building canvas, layer',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:35'
}
PECanvasBuilder >> buildLayer [

	PEPixel selectedColor: Color black.
	^ self createPixelsIn: PELayer new
]

{
	#category : #'building canvas, layer',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:35'
}
PECanvasBuilder >> buildLayerWithJson: aJson [

	PEPixel selectedColor: Color black.
	self getDimensionsFromJson: aJson.
	^ self createPixelsFromJson: aJson in: PELayer new
]

{
	#category : #'json input',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:18'
}
PECanvasBuilder >> colorFromString: aString [

	| json formattedString |
	
	formattedString := '{', (aString copyReplaceAll: '#' with: '"'), '}'.
	json := Json readFromString: formattedString.
	"-1 is the symbol for transparent Color"
	(json at: 'r') = '-1' ifTrue: [^ Color transparent]. 
	^ Color r: (json at: 'r') asNumber g: (json at: 'g') asNumber b: (json at: 'b') asNumber range: 1023

]

{
	#category : #'creating/inserting pixel',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:20'
}
PECanvasBuilder >> createPixelsFromJson: aJson in: aLayer [

	| pixelSize width height pixelID |

	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PECanvas pixelSize.
	pixelID := aJson size - 3. "Json saves x number of pixels + 3 elements (width, pixelSize, height)"
	aLayer extent: (width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize) - pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight 
			withColor: (self colorFromString: (aJson at: (pixelID stringForReadout))) in: aLayer.
			pixelID := pixelID - 1 ]].
	^ aLayer
]

{
	#category : #'creating/inserting pixel',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:22'
}
PECanvasBuilder >> createPixelsIn: aLayer [

	| pixelSize width height |
	
	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PECanvas pixelSize.
	aLayer extent: ( width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize) - pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight in: aLayer ]].
	^ aLayer
	
]

{
	#category : #'json input',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:45'
}
PECanvasBuilder >> getDimensionsFromJson: aJson [

	PECanvas pixelGridWidth: (aJson at: 'width') asNumber andHeight: (aJson at: 'height') asNumber.
	PECanvas pixelSize: (aJson at: 'pixelSize') asNumber
]

{
	#category : #'creating/inserting pixel',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:28'
}
PECanvasBuilder >> insertPixelAt: aPoint in: aLayer [

	self insertPixelAt: aPoint withColor: Color transparent in: aLayer
]

{
	#category : #'creating/inserting pixel',
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
