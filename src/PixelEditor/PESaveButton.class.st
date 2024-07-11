Class {
	#name : #PESaveButton,
	#superclass : #PESettingsButton,
	#category : #PixelEditor
}

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:15'
}
PESaveButton >> addToJson [
	
	self 
		jsonString: (self jsonString, '"width" : "', PECanvas pixelGridWidth, ' ", ');
		jsonString: (self jsonString, '"height" : "', PECanvas pixelGridHeight, ' ", ');
		jsonString: (self jsonString, '"pixelSize" : "', PECanvas pixelSize, ' " ').
	(self target containerDictionary at: #canvas) submorphs do: [:each | each basicType = #PELayer 
		ifTrue: [ self addToJsonString: each submorphs ]]
]

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:15'
}
PESaveButton >> addToJsonString: aCollection [

	| pixelID |
	
	pixelID := 1.
	aCollection do: [:each | 
		self jsonString: (self jsonString, ', "', pixelID, '" : ', (self colorForJson: each color)).
		pixelID := pixelID + 1 ]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:50'
}
PESaveButton >> basicType [

	^ #PESaveButton
]

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:41'
}
PESaveButton >> colorForJson: aColor [

	| stringRed stringGreen stringBlue |
	aColor = Color transparent ifTrue: [^ '"#r# : #-1#"'].
	stringRed := '"#r# : #', aColor privateRed, '#'.
	stringGreen :=  ', #g# : #', aColor privateGreen, '#'. 
	stringBlue := ', #b# : #', aColor privateBlue, '#"'.
	^ stringRed, stringGreen, stringBlue
]

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 6/19/2024 21:34'
}
PESaveButton >> directory [

	^ 'Saved-Images'
]

{
	#category : #'on click',
	#'squeak_changestamp' : 'GLE 6/4/2024 01:07'
}
PESaveButton >> doAction [

	self save
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:54'
}
PESaveButton >> jsonString [

	^ self target jsonString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:54'
}
PESaveButton >> jsonString: anObject [

	self target jsonString: anObject
]

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:16'
}
PESaveButton >> save [

	| fileName |
	
	fileName := self openFileSaverDialog getUserResponse.
	fileName isNil
		ifFalse: [ self checkIfFileExists: fileName ]
]

{
	#category : #'ui label',
	#'squeak_changestamp' : 'GLE 6/19/2024 21:34'
}
PESaveButton >> windowTitle [

	^ 'Save File'
]

{
	#category : #saving,
	#'squeak_changestamp' : 'GLE 6/22/2024 14:01'
}
PESaveButton >> writeFile: aFileName stream: aFileStream [

	self addToJson.
	aFileStream 
		nextPutAll: self jsonString; 
		close.
	self jsonString: ''
	
]
