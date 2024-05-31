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
	#'squeak_changestamp' : 'GLE 5/31/2024 19:06'
}
PELayer >> colorFromString: aString [

	| json formattedString |
	
	formattedString := '{', (aString copyReplaceAll: '#' with: '"'), '}'.
	json := Json readFromString: formattedString.
	(json at: 'r') = '-1' ifTrue: [^ Color transparent].
	^ Color r: (json at: 'r') asNumber g: (json at: 'g') asNumber b: (json at: 'b') asNumber range: 1023.

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
	#'squeak_changestamp' : 'GLE 5/31/2024 18:53'
}
PELayer >> createPixelsFromJson: aJson [

	| pixelSize width height pixelID |

	PECanvas pixelGridWidth: (aJson at: 'width') asNumber andHeight: (aJson at: 'height') asNumber.
	PEPixel pixelSize: (aJson at: 'pixelSize') asNumber.
	width := PECanvas pixelGridWidth.
	height := PECanvas pixelGridHeight.
	pixelSize := PEPixel pixelSize.
	pixelID := aJson size - 3.
	self extent: (width * pixelSize) @ (height * pixelSize).
	0 to: (height * pixelSize)-pixelSize by: pixelSize do: [:eachHeight | 
		0 to: (width * pixelSize) - pixelSize by: pixelSize do: [:eachWidth | 
			self insertPixelAt: eachWidth @ eachHeight 
			withColor: (self colorFromString: (aJson at: (pixelID stringForReadout))).
			pixelID := pixelID - 1]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 14:15'
}
PELayer >> initialize [

	super initialize.
	self position: 500 @ 300;
		openInWorld;
		color: Color white;
		borderWidth: 5;
		borderColor: Color black.
	submorphs := OrderedCollection new
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 13:57'
}
PELayer >> insertPixelAt: aPoint [

	self addMorphFront: (PEPixel new position: self positionInWorld + aPoint; yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 14:08'
}
PELayer >> insertPixelAt: aPoint withColor: aColor [

	self addMorphFront: (PEPixel new color: aColor; 
		position: self positionInWorld + aPoint; 
		yourself)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/31/2024 14:28'
}
PELayer >> jsonFromString: aString [

	^ Json readFromString: aString
]
