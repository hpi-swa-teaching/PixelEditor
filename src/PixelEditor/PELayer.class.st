"
A PELayer holds every pixel and handles mouseDown events on the canvas in order to paint. 
When the mouseDown: or handlesMouseStillDown: event is triggered we get the position of the mouse through the event. We then standardize the point and correct it to the nearest pixel coordinate. The corrected point is then used to access the pixel through the dictionary and sends the changeColor method to the pixel.

Instance Variables
	pixelDictionary:		type: Dictionary new

pixelDictionary
	- We save every pixel in this Dictionary. The pixel's coordinates relative to the position of the layer is the key to access the pixel.

"
Class {
	#name : #PELayer,
	#superclass : #Morph,
	#instVars : [
		'pixelDictionary'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:35'
}

{
	#category : #miscellaneous,
	#'squeak_changestamp' : 'GLE 5/16/2024 10:41'
}
PELayer >> basicType [
	
	^#PELayer
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:08'
}
PELayer >> colorPixels: anEvent [

	| pixelPoint |
	
	pixelPoint := self standardizedPoint: (self pointInSelf: anEvent position).
	(self pixelDictionary at: pixelPoint ifAbsent: [^ nil ]) changeColor 
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:10'
}
PELayer >> correctPoint: aMousePoint regarding: aPixelPoint [

	| pixelSize |
	
	pixelSize := PECanvas pixelSize.
	aMousePoint x < aPixelPoint x "mouse is to the left of pixel on the x axis"
		ifTrue: [
			aMousePoint y < aPixelPoint y "mouse is above the pixel on the y axis"
				ifTrue: [ ^ (aPixelPoint x - pixelSize) @ (aPixelPoint y - pixelSize) ]
				ifFalse: [ ^ (aPixelPoint x - pixelSize) @ aPixelPoint y ]]
		ifFalse: [ 
			aMousePoint y < aPixelPoint y 
				ifTrue: [ ^ (aPixelPoint x) @ (aPixelPoint y - pixelSize) ]].
	^ aPixelPoint
]

{
	#category : #resizing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:11'
}
PELayer >> fitSubmorphs [

	"TODO"
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:37'
}
PELayer >> handlesMouseDown: anEvent [

	^ true
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:54'
}
PELayer >> handlesMouseStillDown: anEvent [

	self colorPixels: anEvent.
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:11'
}
PELayer >> initialize [

	super initialize.
	self 
		color: Color white;
		borderColor: Color black;
		pixelDictionary: Dictionary new
	
	
]

{
	#category : #'input handling',
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
	#'squeak_changestamp' : 'GLE 7/7/2024 18:11'
}
PELayer >> pixelDictionary: aDictionary [

	pixelDictionary := aDictionary
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:50'
}
PELayer >> pointInSelf: aPoint [

	^ aPoint - self position
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 7/7/2024 18:12'
}
PELayer >> standardizedPoint: aPoint [

	| pixelSize xCoordinate yCoordinate |
	
	pixelSize := PECanvas pixelSize.
	(aPoint x \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [ xCoordinate := pixelSize * (aPoint x // pixelSize) ]
		ifTrue: [ xCoordinate := pixelSize * ((aPoint x // pixelSize) +1) ].
	(aPoint y \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [ yCoordinate := pixelSize * (aPoint y // pixelSize) ]
		ifTrue: [ yCoordinate := pixelSize * ((aPoint y // pixelSize) + 1) ].
	^ self correctPoint: aPoint regarding: (xCoordinate @ yCoordinate)
	
]
