Class {
	#name : #PECanvasBuilder,
	#superclass : #PEBuilder,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:51'
}
PECanvasBuilder >> buildBrushIn: aLayer [

	^ PEBrush new pixelCollection: aLayer submorphs;
		changeSelectedColor: Color black.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:51'
}
PECanvasBuilder >> buildCanvas [

	| layer brush canvas |
	
	canvas := PECanvas new.
	layer := self buildLayer.
	brush := self buildBrushIn: layer.
	^ canvas addMorph: layer; 
		addMorphBack: brush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:53'
}
PECanvasBuilder >> buildCanvasFromJson: aJson [

	| layer brush canvas |
	
	canvas := PECanvas new.
	layer := self buildLayerWithJson: aJson.
	brush := self buildBrushIn: layer.
	^ canvas addMorph: layer; 
		addMorphBack: brush
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:39'
}
PECanvasBuilder >> buildLayer [

	^ self createPixelsIn: PELayer new
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:49'
}
PECanvasBuilder >> buildLayerWithJson: aJson [

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
	#'squeak_changestamp' : 'GLE 6/18/2024 12:16'
}
PECanvasBuilder >> createPixelsFromJson: aJson in: aLayer [

	| pixelSize width height pixelID |

	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PEPixel pixelSize.
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
	#'squeak_changestamp' : 'GLE 6/18/2024 11:39'
}
PECanvasBuilder >> createPixelsIn: aLayer [

	| pixelSize width height |
	
	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PEPixel pixelSize.
	aLayer extent: ( width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize) - pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight in: aLayer]].
	^ aLayer
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/18/2024 11:47'
}
PECanvasBuilder >> getDimensionsFromJson: aJson [

	PECanvas pixelGridWidth: (aJson at: 'width') asNumber andHeight: (aJson at: 'height') asNumber.
	PEPixel pixelSize: (aJson at: 'pixelSize') asNumber
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
	#'squeak_changestamp' : 'GLE 6/18/2024 11:28'
}
PECanvasBuilder >> insertPixelAt: aPoint withColor: aColor in: aLayer [

	| pixel |
	pixel := PEPixel new color: aColor; 
		position: aLayer positionInWorld + aPoint; 
		yourself.
	aLayer pixelDictionary at: (pixel position) put: pixel.
	aLayer addMorphFront: pixel
]
