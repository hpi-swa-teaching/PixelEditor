Class {
	#name : #PEInputWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'heightInput',
		'widthInput',
		'window',
		'submitButton',
		'inputLineWidth',
		'inputLineHeight',
		'inputLinePixelSize',
		'inputLines',
		'addedText',
		'inputFieldDictionary'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 7/4/2024 11:41'
}
PEInputWindow class >> defaultLabel [

	^ 'Input Window'
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 7/4/2024 11:40'
}
PEInputWindow class >> open [

	| instance |
	
	instance := self new.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:32'
}
PEInputWindow >> buildWith: aBuilder [ 
	
	^ self window: (PEUserInputBuilder default createInputWindowPanel: aBuilder andModel: self)

]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:09'
}
PEInputWindow >> checkForEmptyValuesIn: aDictionary [

	(aDictionary anySatisfy: [:each | each isEmpty])
		ifFalse: [ self checkForStringValuesIn: aDictionary]
		ifTrue: [ PEUserInputBuilder default wrongValues ]
	
		
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:13'
}
PEInputWindow >> checkForStringValuesIn: aDictionary [

	| dictionary |

	dictionary := aDictionary collect: #asIntegerIfAllDigits.
	(dictionary anySatisfy: [:each | each isNil])
		ifFalse: [ self checkSizeCorrectnessFor: dictionary ]
		ifTrue: [ PEUserInputBuilder default wrongValues ]
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:09'
}
PEInputWindow >> checkSizeCorrectnessFor: aDictionary [

	 (aDictionary allSatisfy: [:each | each > 0 ])
		ifFalse: [ PEUserInputBuilder default wrongValues ]
		ifTrue: [ self openPixelEditorWithDictionary: aDictionary ]
	
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:36'
}
PEInputWindow >> createDefaultCanvas [

	PECanvas 
		pixelGridWidth: 10 andHeight: 10;
		pixelSize: 100.
	PixelEditor open.
	self window closeBoxHit
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:25'
}
PEInputWindow >> inputFieldDictionary [

	^ inputFieldDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:04'
}
PEInputWindow >> inputFieldDictionary: aDictionary [

	inputFieldDictionary := aDictionary
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:24'
}
PEInputWindow >> labelString [

	^ self class defaultLabel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:36'
}
PEInputWindow >> openPixelEditorWithDictionary: aDictionary [

	PECanvas pixelGridWidth: (aDictionary at: 'Width:')  andHeight: (aDictionary at: 'Height:');
		pixelSize: (aDictionary at: 'Pixel Size:'). 
	PixelEditor open.
	self window closeBoxHit
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:36'
}
PEInputWindow >> processValues [

	| dictionary |
	
	dictionary := self inputFieldDictionary collect: #string.
	(dictionary anySatisfy: [:each | each notEmpty])
		ifFalse: [self createDefaultCanvas] 
		ifTrue: [self checkForEmptyValuesIn: dictionary]
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:10'
}
PEInputWindow >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 16:32'
}
PEInputWindow >> window: aWindow [

	^ window := aWindow
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/6/2024 14:09'
}
PEInputWindow >> windowColorToUse [

	^ Color veryVeryLightGray
]
