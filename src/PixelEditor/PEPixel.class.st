Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'coordinate'
	],
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:39'
}
PEPixel >> coordinate [
	^ coordinate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:39'
}
PEPixel >> coordinate: aCoordinate [
	coordinate:= aCoordinate
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/4/2024 11:39'
}
PEPixel >> initialize [
	super initialize.
	self extent: 30 @ 30;
		 sticky: true
]
