Class {
	#name : #PEInputMorph,
	#superclass : #Morph,
	#instVars : [
		'textInput',
		'inputField'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:35'
}
PEInputMorph >> initialize [

	self inputField: (Morph new extent: 200@50; color: Color veryLightGray).
	self textInput: (TextMorph new borderWidth: 1; borderColor: Color black; contents: ' '; extent: self inputField extent).
	self inputField addMorph: self textInput.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:22'
}
PEInputMorph >> inputField [

	^ inputField
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PEInputMorph >> inputField: aMorph [

	inputField := aMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:29'
}
PEInputMorph >> openInWorld [

	self inputField openInWorld
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PEInputMorph >> position [

	^ self inputField position
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PEInputMorph >> position: aPosition [

	self inputField position: aPosition
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PEInputMorph >> textInput [

	^ textInput
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PEInputMorph >> textInput: aText [

	textInput := aText
]
