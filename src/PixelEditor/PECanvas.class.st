Class {
	#name : #PECanvas,
	#superclass : #PasteUpMorph,
	#instVars : [
		'originPixel',
		'pixelCollection'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:06'
}
PECanvas >> addPixelAt: aCoordinate [ 
	| pixel |
	(self pixelCollection keys includes: aCoordinate) ifTrue: [ ^ nil ].

	pixel := PEPixel new.
	pixel coordinate: aCoordinate;
		 originPixel: self originPixel.
	self addMorph: pixel.
	self pixelCollection at: aCoordinate put: pixel.
	pixel calculatePosition
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> clear [
	self removeAllMorphs
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:49'
}
PECanvas >> extent: aPoint [ 
	super extent: aPoint. self positionOriginPixel
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
	#'squeak_changestamp' : 'Corvin 6/24/2024 16:45'
}
PECanvas >> handlesMouseStillDown: anEvent [
^true
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:01'
}
PECanvas >> initialize [
	super initialize.
	originPixel := PEPixel new.
	originPixel color: Color orange.
	pixelCollection := Dictionary new.
	pixelCollection at: 0@0 put: originPixel.
	self
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: false;
		 addMorph: originPixel
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
	#'squeak_changestamp' : 'Corvin 6/25/2024 09:48'
}
PECanvas >> mouseDown: anEvent [ 
	anEvent hand newMouseFocus: self.
	self addPixelAt: (self mapPositionToCoordinate: anEvent position).
]

{
	#category : #'events-processing',
	#'squeak_changestamp' : 'Corvin 6/25/2024 10:00'
}
PECanvas >> mouseStillDown: anEvent [ 
	| pixel |
	pixel := self pixelCollection
				at: (self mapPositionToCoordinate: anEvent position).
	pixel ifNotNil: [
		pixel color: Color black
		]
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
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> setUpBackground [
	| theme |
	
	theme := Smalltalk at: #SqueakTheme ifAbsent: nil.
	theme
		ifNil: [self color: Preferences defaultWorldColor  ] 
		ifNotNil: [ self setAsBackground: theme linenblue ]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:12'
}
PECanvas >> wantsDroppedMorph: aMorph event: evt [

	^ false
]
