"
A PEInputWindow is processing the user input when creating the PixelEditor. 

Instance Variables
	inputFieldDictionary:		type: Dictionary new
	window:					type: PluggableSystemWindow new

inputFieldDictionary
	- In this dictionary we save the inputFields to access them and read their values. The dictionary is created in the PEUserInputBuilder and passed on to the inputWindow.

window
	- We save the window so we can close the InputWindow. The window is created by the builder in PEUserInputBuilder and is passed on to the inputWindow.

"
Class {
	#name : #PEInputWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'window',
		'inputFieldDictionary'
	],
	#category : #PixelEditor,
	#'squeak_changestamp' : 'GLE 7/12/2024 11:18'
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/12/2024 14:00'
}
PEInputWindow class >> open [

	| instance |
	
	PEBuilder reset.
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
	#'squeak_changestamp' : 'GLE 7/7/2024 18:06'
}
PEInputWindow >> checkForEmptyValuesIn: aDictionary [

	(aDictionary anySatisfy: [:each | each isEmpty ])
		ifFalse: [ self checkForStringValuesIn: aDictionary ]
		ifTrue: [ PEUserInputBuilder default wrongValues ]
	
		
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:07'
}
PEInputWindow >> checkForStringValuesIn: aDictionary [

	| dictionary |

	dictionary := aDictionary collect: #asIntegerIfAllDigits.
	(dictionary anySatisfy: [:each | each isNil ])
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
	#category : #release,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:48'
}
PEInputWindow >> close [

	self window closeBoxHit
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
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:07'
}
PEInputWindow >> defaultLabel [

	^ 'Input Window'
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
	#'squeak_changestamp' : 'GLE 7/7/2024 18:07'
}
PEInputWindow >> labelString [

	^ self defaultLabel
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:49'
}
PEInputWindow >> openPixelEditorWithDictionary: aDictionary [

	PECanvas pixelGridWidth: (aDictionary at: 'Width:')  andHeight: (aDictionary at: 'Height:');
		pixelSize: (aDictionary at: 'Pixel Size:'). 
	PixelEditor open.
	self close
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:08'
}
PEInputWindow >> processValues [

	| dictionary |
	
	dictionary := self inputFieldDictionary collect: #string.
	(dictionary anySatisfy: [:each | each notEmpty ])
		ifFalse: [ self createDefaultCanvas ] 
		ifTrue: [ self checkForEmptyValuesIn: dictionary ]
		
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
