Class {
	#name : #PELayer,
	#superclass : #Morph,
	#instVars : [
		'pixelDictionary'
	],
	#category : #PixelEditor
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
	#'squeak_changestamp' : 'GLE 6/17/2024 18:42'
}
PELayer >> colorPixels: anEvent [

	| pixelPoint |
	
	pixelPoint := self standardizedPoint: (self pointInSelf: anEvent position).
	(self pixelDictionary at: pixelPoint ifAbsent: [^ nil]) changeColor 
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:42'
}
PELayer >> correctPoint: aMousePoint regarding: aPixelPoint [

	| pixelSize |
	
	pixelSize := PECanvas pixelSize.
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
	#category : #resizing,
	#'squeak_changestamp' : 'GLE 6/7/2024 20:57'
}
PELayer >> fitSubmorphs [
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
	#'squeak_changestamp' : 'GLE 6/18/2024 11:28'
}
PELayer >> initialize [

	super initialize.
	self color: Color white;
		borderColor: Color black;
		pixelDictionary: Dictionary new.
	
	
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
	#'squeak_changestamp' : 'GLE 6/4/2024 00:06'
}
PELayer >> pixelDictionary: anObject [

	pixelDictionary := anObject
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:50'
}
PELayer >> pointInSelf: aPoint [

	^ aPoint - self position
]

{
	#category : #miscellaneous,
	#'squeak_changestamp' : 'GLE 6/6/2024 19:05'
}
PELayer >> rectangle [

	^ Rectangle origin: self position corner: self bottomRight
]

{
	#category : #'input handling',
	#'squeak_changestamp' : 'GLE 6/20/2024 17:42'
}
PELayer >> standardizedPoint: aPoint [

	| pixelSize xCoordinate yCoordinate |
	
	pixelSize := PECanvas pixelSize.
	(aPoint x \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [xCoordinate := pixelSize * (aPoint x // pixelSize)]
		ifTrue: [xCoordinate := pixelSize * ((aPoint x // pixelSize) +1)].
	(aPoint y \\ pixelSize) >= (pixelSize / 2)
		ifFalse: [yCoordinate := pixelSize * (aPoint y // pixelSize)]
		ifTrue: [yCoordinate := pixelSize * ((aPoint y // pixelSize) + 1)].
	^ self correctPoint: aPoint regarding: (xCoordinate @ yCoordinate)
	
]
