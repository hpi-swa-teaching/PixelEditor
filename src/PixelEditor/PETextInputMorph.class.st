Class {
	#name : #PETextInputMorph,
	#superclass : #PEUI,
	#instVars : [
		'textInput',
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
	#'squeak_changestamp' : 'LW 5/27/2024 11:30'
}
PETextInputMorph >> initialize [

	self inputField: self initializeInputField;
		textInput: self initializeTextInput.
	self inputField addMorph: self textInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:19'
}
PETextInputMorph >> initializeInputField [

	^ Morph new extent: PETextInputMorph inputFieldSize; 
		color: Color veryLightGray; 
		yourself
	"Hier besser ein PluggableTextMorph"
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:20'
}
PETextInputMorph >> initializeTextInput [

	^ TextMorph new borderWidth: PETextInputMorph borderSize; 
		borderColor: Color black; 
		contents: ' '; 
		extent: self inputField extent; 
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

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PETextInputMorph >> textInput [

	^ textInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PETextInputMorph >> textInput: aText [

	textInput := aText
]
