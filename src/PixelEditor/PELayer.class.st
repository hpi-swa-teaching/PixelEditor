Class {
	#name : #PELayer,
	#superclass : #Morph,
	#instVars : [
		'pixelDictionary'
	],
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
	#'squeak_changestamp' : 'GLE 6/4/2024 00:19'
}
PELayer >> colorPixels: anEvent [

	| pixelPoint |
	
	pixelPoint := self standardizedPoint: (self pointInSelf: anEvent position).
	(self pixelDictionary at: pixelPoint ifAbsent: [^nil]) changeColor 
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:35'
}
PELayer >> correctPoint: aMousePoint regarding: aPixelPoint [

	| pixelSize |
	
	pixelSize := PEPixel pixelSize.
	aMousePoint x < aPixelPoint x "mouse is to the left of pixel on the x axis"
		ifTrue: [
			aMousePoint y < aPixelPoint y "mouse is above the pixel on the y axis"
				ifTrue: [ ^ (aPixelPoint x - pixelSize) @ (aPixelPoint y - pixelSize)].
			^ (aPixelPoint x - pixelSize) @ aPixelPoint y]
		ifFalse: [ 
			aMousePoint y < aPixelPoint y 
				ifTrue: [^ (aPixelPoint x) @ (aPixelPoint y - pixelSize)] ].
	^ aPixelPoint
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
	#'squeak_changestamp' : 'GLE 6/3/2024 23:37'
}
PELayer >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:54'
}
PELayer >> handlesMouseStillDown: anEvent [

	self colorPixels: anEvent.
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:31'
}
PELayer >> initialize [

	super initialize.
	self color: Color white;
		borderWidth: 5;
		borderColor: Color black;
		pixelDictionary: Dictionary new.
	submorphs := OrderedCollection new
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:16'
}
PELayer >> insertPixelAt: aPoint [

	self insertPixelAt: aPoint withColor: Color transparent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:40'
}
PELayer >> insertPixelAt: aPoint withColor: aColor [

	| pixel |
	pixel := PEPixel new color: aColor; 
		position: self positionInWorld + aPoint; 
		yourself.
	self pixelDictionary at: (pixel position) put: pixel.
	self addMorphFront: pixel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:54'
}
PELayer >> mouseDown: anEvent [

	self colorPixels: anEvent
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:06'
}
PELayer >> pixelDictionary [

	^ pixelDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:06'
}
PELayer >> pixelDictionary: anObject [

	pixelDictionary := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:50'
}
PELayer >> pointInSelf: aPoint [

	^ aPoint - self position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/6/2024 19:05'
}
PELayer >> rectangle [

	^ Rectangle origin: self position corner: self bottomRight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/4/2024 00:30'
}
PELayer >> standardizedPoint: aPoint [

	| pixelSize xCoordinate yCoordinate |
	
	pixelSize := PEPixel pixelSize.
	(aPoint x \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [xCoordinate := pixelSize * (aPoint x // pixelSize)]
		ifTrue: [xCoordinate := pixelSize * ((aPoint x // pixelSize) +1)].
	(aPoint y \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [yCoordinate := pixelSize * (aPoint y // pixelSize)]
		ifTrue: [yCoordinate := pixelSize * ((aPoint y // pixelSize) + 1)].
	^ self correctPoint: aPoint regarding: (xCoordinate @ yCoordinate)
	
]
