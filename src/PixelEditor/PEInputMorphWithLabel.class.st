Class {
	#name : #PEInputMorphWithLabel,
	#superclass : #PEInputMorph,
	#instVars : [
		'label'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 19:12'
}
PEInputMorphWithLabel >> initialize [

	super initialize.
	self setLabel: ''.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PEInputMorphWithLabel >> label [

	^ label
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:36'
}
PEInputMorphWithLabel >> label: aLabel [

	label := aLabel
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 19:33'
}
PEInputMorphWithLabel >> setLabel: aLabel [

	self label: (StringMorph new contents: aLabel; yourself).
	self inputField position: 0 @ 30.
	self label addMorph: self inputField.
	self inputField: self label.
]
