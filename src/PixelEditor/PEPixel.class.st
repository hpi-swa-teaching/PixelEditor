Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'brushSelectedColor'
	],
	#classInstVars : [
		'pixelSize',
		'borderColor',
		'borderSize',
		'selectedColor'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 18:11'
}
PEPixel class >> borderSize [
	
	borderSize 
		ifNil: [ ^ 1]
		ifNotNil: [ ^ borderSize]
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 18:11'
}
PEPixel class >> borderSize: aSize [
	
	borderSize := aSize.
	self allInstancesDo: [:each | each borderWidth: aSize]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:39'
}
PEPixel class >> defaultBorderSize [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:18'
}
PEPixel class >> selectedColor [

	^ selectedColor

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 21:18'
}
PEPixel class >> selectedColor: aColor [

	selectedColor := aColor

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 20:41'
}
PEPixel class >> toggleBorderSize [
	
	borderSize = 0
		ifTrue: [self borderSize: self defaultBorderSize]
		ifFalse: [self borderSize: 0]
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:35'
}
PEPixel >> changeColor [

	self color: self class selectedColor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:40'
}
PEPixel >> initialize [

	super initialize.
	self 
		color: Color transparent;
		borderWidth: self class borderSize;
		borderColor: Color lightGray
		
	
		
		
]
