Class {
	#name : #PETextInputMorph2,
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
PETextInputMorph2 class >> borderSize [

	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:19'
}
PETextInputMorph2 class >> inputFieldSize [

	^ 200 @ 50
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:43'
}
PETextInputMorph2 >> getContent [

	^ self inputField text
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/10/2024 21:18'
}
PETextInputMorph2 >> initialize [

	self inputField: self initializeInputField.
	self getContent
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 11:43'
}
PETextInputMorph2 >> initializeInputField [

	|a|
	
	a := PEPluggableTextMorphPlus new.
	
	a extent: PETextInputMorph inputFieldSize; 
		color: Color veryLightGray; 
		setText: ''.
		
	^ a
	"Hier besser ein PluggableTextMorph"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:22'
}
PETextInputMorph2 >> inputField [

	^ inputField
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:21'
}
PETextInputMorph2 >> inputField: aMorph [

	inputField := aMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/23/2024 18:29'
}
PETextInputMorph2 >> openInWorld [

	self inputField openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PETextInputMorph2 >> position [

	^ self inputField position
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:37'
}
PETextInputMorph2 >> position: aPosition [

	self inputField position: aPosition
]
