Class {
	#name : #PixelMatrix,
	#superclass : #Object,
	#instVars : [
		'matrix'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 12:20'
}
PixelMatrix class >> defaultSize [

	^ 3@3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 12:28'
}
PixelMatrix >> add: aCoordinate value: aValue [

	(self matrix at: aCoordinate x) at: aCoordinate y put: aValue.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 12:24'
}
PixelMatrix >> initialize [
	super initialize.
	self
		matrix: (OrderedCollection new: self class defaultSize x).
		
	1 to: self class defaultSize x do: [:i | self matrix add: (OrderedCollection new: self class defaultSize y).]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 12:19'
}
PixelMatrix >> matrix [

	^matrix
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 6/4/2024 12:19'
}
PixelMatrix >> matrix: aMatrix [
	matrix := aMatrix
]
