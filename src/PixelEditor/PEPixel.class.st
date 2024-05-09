Class {
	#name : #PEPixel,
	#superclass : #Morph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/9/2024 16:33'
}
PEPixel class >> pixelSize [
	
	^ 10.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/9/2024 16:41'
}
PEPixel >> initialize [

	self color: Color transparent;
		extent: self pixelSize @ self pixelSize
		
]
