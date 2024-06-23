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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:07'
}
PEPixel class >> defaultPixelColor [
	^Color white
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:20'
}
PEPixel class >> defaultPixelCoordinate [
	^ 0 @ 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:41'
}
PEPixel class >> defaultPixelSize [

 	^ 100 @ 100
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:22'
}
PEPixel >> coordinate [
	^ coordinate
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:21'
}
PEPixel >> coordinate: aCoordinate [ 
	coordinate := aCoordinate
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:51'
}
PEPixel >> handlesMouseDown: aEvent [ 
	^ true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/23/2024 18:50'
}
PEPixel >> handlesMouseStillDown: aEvTrue [
	self color: Color blue.
	^true
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:07'
}
PEPixel >> initialize [
	super initialize.
	self extent: self class defaultPixelSize;
		 sticky: true;
		color: self class defaultPixelColor.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:12'
}
PEPixel >> originPixel [
^ originPixel
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/23/2024 20:11'
}
PEPixel >> originPixel: aPixel [
originPixel := aPixel
]
