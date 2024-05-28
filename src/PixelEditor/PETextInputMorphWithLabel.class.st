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
	#'squeak_changestamp' : 'LW 5/27/2024 11:22'
}
PETextInputMorphWithLabel class >> inputFieldPosition [

	^ 0 @ 30
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:21'
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
	#'squeak_changestamp' : 'LW 5/27/2024 11:27'
}
PETextInputMorphWithLabel >> setLabel: aLabel [

	self label: (self initializeStringMorph: aLabel).
	self inputField position: PETextInputMorphWithLabel inputFieldPosition.
	self label addMorph: self inputField.
	self inputField: self label
]
