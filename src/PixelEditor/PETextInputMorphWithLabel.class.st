Class {
	#name : #PETextInputMorphWithLabel,
	#superclass : #PETextInputMorph,
	#instVars : [
		'label'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:51'
}
PETextInputMorphWithLabel class >> inputFieldPosition [

	^ 0 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:32'
}
PETextInputMorphWithLabel >> initialize [

	super initialize.
	self setLabel: ''
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:24'
}
PETextInputMorphWithLabel >> initializeStringMorph: aLabel [

	^ StringMorph new contents: aLabel; yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PETextInputMorphWithLabel >> label [

	^ label
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PETextInputMorphWithLabel >> label: aLabel [

	label := aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:23'
}
PETextInputMorphWithLabel >> openInWorld [

	self inputField openInWorld.
	self label openInWorld
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel >> position [

	^ self label position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 13:38'
}
PETextInputMorphWithLabel >> position: aPosition [

	self label position: aPosition.
	self inputField position: (self label position + PETextInputMorphWithLabel inputFieldPosition)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel >> setLabel: aLabel [
	
	self label: (self initializeStringMorph: aLabel).
	self position: 0 @ 0
]
