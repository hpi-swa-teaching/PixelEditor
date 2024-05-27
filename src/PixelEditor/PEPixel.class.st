Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'selectedColor'
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

	#'squeak_changestamp' : 'LW 5/24/2024 22:33'
}
PEPixel class >> pixelSize [
	
	^ pixelSize
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
	#'squeak_changestamp' : 'GLE 5/13/2024 19:29'
}
PEPixel >> mouseDown: anEvent [

	self color: self selectedColor
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
