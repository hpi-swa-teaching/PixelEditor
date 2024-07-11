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
	#category : #grid,
	#'squeak_changestamp' : 'GLE 7/7/2024 15:47'
}
PEPixel class >> borderSize [
	
	borderSize 
		ifNil: [ ^ self defaultBorderSize ]
		ifNotNil: [ ^ borderSize ]
	
]

{
	#category : #grid,
	#'squeak_changestamp' : 'GLE 7/7/2024 15:46'
}
PEPixel class >> borderSize: aSize [
	
	borderSize := aSize.
	self allInstancesDo: [:each | each borderWidth: aSize ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/7/2024 20:39'
}
PEPixel class >> defaultBorderSize [

	^ 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 21:18'
}
PEPixel class >> selectedColor [

	^ selectedColor

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 21:18'
}
PEPixel class >> selectedColor: aColor [

	selectedColor := aColor

	
]

{
	#category : #grid,
	#'squeak_changestamp' : 'GLE 6/7/2024 20:41'
}
PEPixel class >> toggleBorderSize [
	
	borderSize = 0
		ifTrue: [self borderSize: self defaultBorderSize]
		ifFalse: [self borderSize: 0]
		
]

{
	#category : #drawing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:35'
}
PEPixel >> changeColor [

	self color: self class selectedColor
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:40'
}
PEPixel >> initialize [

	super initialize.
	self 
		color: Color transparent;
		borderWidth: self class borderSize;
		borderColor: Color lightGray
		
	
		
		
]
