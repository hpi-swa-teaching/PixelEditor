Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'brushSelectedColor'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 13:56'
}
PEPixel class >> borderColor [
	
	^ Color lightGray
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 13:59'
}
PEPixel class >> borderSize [
	
	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 14:19'
}
PEPixel class >> pixelSize [
	
	^ 100
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 17:13'
}
PEPixel >> brushSelectedColor [
	^ brushSelectedColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 17:13'
}
PEPixel >> brushSelectedColor: anObject [
	brushSelectedColor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 14:08'
}
PEPixel >> handlesMouseDown: anEvent [

	^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/14/2024 14:08'
}
PEPixel >> initialize [
	super initialize.
	self color: Color transparent;
		extent: PEPixel pixelSize @ PEPixel pixelSize;
		borderWidth: PEPixel borderSize;
		borderColor: PEPixel borderColor
		
	
		
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/25/2024 17:12'
}
PEPixel >> mouseDown: anEvent [

	self color: self brushSelectedColor
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
	#'squeak_changestamp' : 'GT 5/25/2024 17:13'
}
PEPixel >> mouseEnterDragging: anEvent [

	self color: self brushSelectedColor
	
]
