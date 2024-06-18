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
	#'squeak_changestamp' : 'GLE 6/7/2024 18:10'
}
PEPixel class >> borderColor [
	
	borderColor 
		ifNil: [^ Color lightGray]
		ifNotNil: [^ borderColor]
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/7/2024 18:20'
}
PEPixel class >> borderColor: aColor [
	
	borderColor := aColor.
	self allInstancesDo: [:each | each borderColor: aColor]
		
]

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
	#'squeak_changestamp' : 'GLE 6/7/2024 18:23'
}
PEPixel class >> toggleBorderColor [
	
	borderColor = Color transparent
		ifTrue: [self borderColor: Color lightGray]
		ifFalse: [self borderColor: Color transparent]
		
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
	#'squeak_changestamp' : 'GLE 6/17/2024 21:19'
}
PEPixel >> changeColor [

	self color: PEPixel selectedColor
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
