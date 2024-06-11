Class {
	#name : #PETextInputMorphWithLabel2,
	#superclass : #PETextInputMorph2,
	#instVars : [
		'label'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:51'
}
PETextInputMorphWithLabel2 class >> inputFieldPosition [

	^ 0 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:32'
}
PETextInputMorphWithLabel2 >> initialize [

	super initialize.
	self setLabel: ''
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:24'
}
PETextInputMorphWithLabel2 >> initializeStringMorph: aLabel [

	^ StringMorph new contents: aLabel; yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PETextInputMorphWithLabel2 >> label [

	^ label
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PETextInputMorphWithLabel2 >> label: aLabel [

	label := aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:23'
}
PETextInputMorphWithLabel2 >> openInWorld [

	self inputField openInWorld.
	self label openInWorld
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel2 >> position [

	^ self label position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:51'
}
PETextInputMorphWithLabel2 >> position: aPosition [

	self label position: aPosition.
	self inputField position: (self label position + PETextInputMorphWithLabel2 inputFieldPosition)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel2 >> setLabel: aLabel [
	
	self label: (self initializeStringMorph: aLabel).
	self position: 0 @ 0
]
