Class {
	#name : #PECanvas,
	#superclass : #PEWidgetToMorphAdapter,
	#instVars : [
		'originPixel',
		'pixelCollection',
		'activeTool'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:26'
}
PECanvas class >> defaultPixelGrid [
	^ 10 @ 10
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:16'
}
PECanvas >> activeTool [
^ activeTool
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:18'
}
PECanvas >> activeTool: aBoolean [ 
	
	activeTool := aBoolean
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:59'
}
PECanvas >> addPixelAt: aCoordinate [ 
	| pixel |
	(self pixelCollection keys includes: aCoordinate)
		ifTrue: [^ nil].
	pixel := PEPixel new.
	pixel coordinate: aCoordinate;
		 originPixel: self originPixel.
	self addMorph: pixel.
	self pixelCollection at: aCoordinate put: pixel.
	pixel calculatePosition
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:47'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint.
	self positionOriginPixel.
	self pixelCollection
		do: [:each | each calculatePosition]
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/24/2024 23:42'
}
PECanvas >> handlesMouseDown: anEvent [ 
	^ true
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:09'
}
PECanvas >> handlesMouseMove: anEvent [ 
	^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:22'
}
PECanvas >> hidePixelBorders [
	self pixelCollection
		do: [:each | each hidePixelBorder]
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:25'
}
PECanvas >> initialize [
	super initialize.
	self originPixel: PEPixel new.
	self originPixel color: Color orange;
		 originPixel: self originPixel;
		 coordinate: 0 @ 0.
	pixelCollection := Dictionary new.
	pixelCollection at: 0 @ 0 put: originPixel.
	activeTool := false.
	self
		 addMorph: originPixel;
		 initializeDefaultGrid
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:11'
}
PECanvas >> initializeDefaultGrid [
	| height width |
	width := self class defaultPixelGrid x.
	height := self class defaultPixelGrid y.
	0
		to: width
		do: [:x | 0
				to: height
				do: [:y | self addPixelAt: (x - (width // 2)) @ (y - (height // 2))]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 09:51'
}
PECanvas >> mapPositionToCoordinate: aPosition [ 
	| pixelSize originPosition coordinateX coordinateY |
	originPosition := self originPixel position.
	pixelSize := self originPixel extent x.
	coordinateX := aPosition x - originPosition x // pixelSize.
	coordinateY := aPosition y - originPosition y // pixelSize.
	^ coordinateX @ (coordinateY negated)
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:14'
}
PECanvas >> mouseDown: anEvent [ 
	anEvent hand newMouseFocus: self.
	self activeTool: true
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:19'
}
PECanvas >> mouseMove: anEvent [ 
	| pixel coordinate |
	self activeTool
		ifFalse: [^ nil].
	coordinate := self mapPositionToCoordinate: anEvent position.
	(self pixelCollection keys includes: coordinate)
		ifFalse: [^ nil].
	pixel := self pixelCollection at: coordinate.
	pixel color: Color black
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:18'
}
PECanvas >> mouseUp: anEvent [ 
	self activeTool: false
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/24/2024 00:11'
}
PECanvas >> originPixel [
^ originPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:34'
}
PECanvas >> originPixel: aPixel [
originPixel := aPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 09:56'
}
PECanvas >> pixelCollection [
^pixelCollection
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:48'
}
PECanvas >> positionOriginPixel [
	| canvasCenter pixelCenter newPosition centerOffset |
	canvasCenter := self bounds center.
	pixelCenter := originPixel bounds center.
	centerOffset := originPixel extent // 2 negated.
	newPosition := canvasCenter + centerOffset.
	originPixel position: newPosition
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:21'
}
PECanvas >> showPixelBorders [
	self pixelCollection do: [:each | each showPixelBorder]
]
