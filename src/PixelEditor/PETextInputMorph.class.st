Class {
	#name : #PETextInputMorph,
	#superclass : #PEUI,
	#instVars : [
		'inputField'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:20'
}
PETextInputMorph class >> borderSize [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:19'
}
PETextInputMorph class >> inputFieldSize [

	^ 200 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:43'
}
PETextInputMorph >> getContent [

	^ self inputField text
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/10/2024 21:18'
}
PETextInputMorph >> initialize [

	self inputField: self initializeInputField.
	self getContent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 13:48'
}
PETextInputMorph >> initializeInputField [

	^ PEPluggableTextMorphPlus new extent: PETextInputMorph inputFieldSize; 
		color: Color veryLightGray; 
		setText: '';
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:22'
}
PETextInputMorph >> inputField [

	^ inputField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PETextInputMorph >> inputField: aMorph [

	inputField := aMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:29'
}
PETextInputMorph >> openInWorld [

	self inputField openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PETextInputMorph >> position [

	^ self inputField position
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PETextInputMorph >> position: aPosition [

	self inputField position: aPosition
]
