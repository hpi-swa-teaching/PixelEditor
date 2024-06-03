Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/1/2024 20:09'
}
PEPixel >> initialize [
	super initialize.
	self extent: 30 @ 30;
		 sticky: true
]
