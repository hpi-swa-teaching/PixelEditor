Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#instVars : [
		'coordinate',
		'originPixel'
	],
	#category : #PixelEditor
}

{
	#category : #positioning,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:39'
}
PEPixel >> calculatePosition [
	| x y |
	x := self originPixel position x + (self coordinate x * originPixel extent x).
	y := self originPixel position y - (self coordinate y * originPixel extent y).
	self position: x @ y.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:32'
}
PEPixel >> coordinate [

	^ coordinate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:33'
}
PEPixel >> coordinate: aCoordinate [
	coordinate := aCoordinate
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/7/2024 22:29'
}
PEPixel >> initialize [
	super initialize.
	self extent: 30 @ 30;
		 sticky: true;
		borderColor: Color white;
		borderWidth: 1
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:34'
}
PEPixel >> originPixel [
 ^ originPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/7/2024 19:34'
}
PEPixel >> originPixel: aPixel [

	originPixel := aPixel
]
