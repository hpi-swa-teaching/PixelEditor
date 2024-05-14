Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'selectedColor'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 18:29'
}
PEPixel class >> pixelSize [
	
	^ 100
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:28'
}
PEPixel >> handlesMouseDown: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:35'
}
PEPixel >> handlesMouseOver: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:40'
}
PEPixel >> handlesMouseOverDragging: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:29'
}
PEPixel >> initialize [
	super initialize.
	self color: Color transparent;
		extent: PEPixel pixelSize @ PEPixel pixelSize.
	World addMorphFront: self
	
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:29'
}
PEPixel >> mouseDown: anEvent [

	self color: self selectedColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:36'
}
PEPixel >> mouseEnter: anEvent [

	Transcript showln: anEvent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 19:41'
}
PEPixel >> mouseEnterDragging: anEvent [

	"self color: self selectedColor"
	Transcript showln: 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 18:53'
}
PEPixel >> selectedColor [

	^selectedColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/13/2024 18:53'
}
PEPixel >> selectedColor: aColor [

	selectedColor:= aColor
]
