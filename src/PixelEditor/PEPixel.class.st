Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'brushSelectedColor'
	],
	#classInstVars : [
		'pixelSize'
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
	#'squeak_changestamp' : 'GLE 6/3/2024 23:16'
}
PEPixel class >> defaultPixelSize [

	^ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/3/2024 23:16'
}
PEPixel class >> pixelSize [

	pixelSize 
		ifNil: [^ self defaultPixelSize]
		ifNotNil: [^ pixelSize]

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 22:32'
}
PEPixel class >> pixelSize: aSize [

	pixelSize := aSize

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
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/3/2024 23:34'
}
PEPixel >> changeColor [

	self color: self brushSelectedColor
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
	#'squeak_changestamp' : 'GLE 6/3/2024 23:34'
}
PEPixel >> mouseDown: anEvent [

	self changeColor
  
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/1/2024 20:08'
}
PEPixel >> positionPixel: aPosition [ 
	| x y |
	x := aPosition x - ( self width / 2).
	y := aPosition y - ( self height / 2).
	self position: x@y
]
