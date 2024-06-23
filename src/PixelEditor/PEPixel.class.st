Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:41'
}
PEPixel class >> defaultPixelSize [

 	^ 100 @ 100
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/4/2024 10:55'
}
PEPixel >> initialize [
	super initialize.
	self extent: 30 @ 30;
	sticky: true.
]
