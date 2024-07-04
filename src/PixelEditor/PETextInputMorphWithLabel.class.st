Class {
	#name : #PETextInputMorphWithLabel,
	#superclass : #Morph,
	#instVars : [
		'label',
		'inputField'
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
	#'squeak_changestamp' : 'LW 6/11/2024 11:43'
}
PETextInputMorphWithLabel >> getContent [

	^ self inputField text
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:36'
}
PETextInputMorphWithLabel >> initialize [

	super initialize.
	self 
		inputField: self initializeInputField;
		setLabel: '';
		getContent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 14:01'
}
PETextInputMorphWithLabel >> initializeInputField [

	^ PEPluggableTextMorphPlus new 
		extent: self inputFieldSize; 
		color: Color veryLightGray; 
		setText: '';
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 7/4/2024 11:24'
}
PETextInputMorphWithLabel >> initializeStringMorph: aLabel [

	^ StringMorph new 
		contents: aLabel; 
		yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:22'
}
PETextInputMorphWithLabel >> inputField [

	^ inputField
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PETextInputMorphWithLabel >> inputField: aMorph [

	inputField := aMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:18'
}
PETextInputMorphWithLabel >> inputFieldPosition [

	^ 0 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:20'
}
PETextInputMorphWithLabel >> inputFieldSize [

	^ 200 @ 50
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
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel >> position [

	^ self label position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 09:19'
}
PETextInputMorphWithLabel >> position: aPosition [

	self label position: aPosition.
	self inputField position: (self label position + self inputFieldPosition)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:36'
}
PETextInputMorphWithLabel >> setLabel: aLabel [
	
	self label: (self initializeStringMorph: aLabel).
	self position: 0 @ 0
]
