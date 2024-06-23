Class {
	#name : #PixelEditorInputWindowTest,
	#superclass : #PixelEditorTest,
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/23/2024 13:28'
}
PixelEditorInputWindowTest >> abandonInputWindow [

	PEInputWindow allInstances do: [:each | each abandon]

	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/23/2024 13:24'
}
PixelEditorInputWindowTest >> checkForInputWindow [

	^ PEInputWindow allInstances isEmpty not
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/23/2024 13:18'
}
PixelEditorInputWindowTest >> simulateCommandClick [

	| command window selector |
	
	PixelEditor register.
	command := (TheWorldMenu registeredOpenCommands detect: [:each | each first = 'PixelEditor']).
	command ifNotNil: [
		window := command second first.
		selector := command second second.
		window perform: selector]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/23/2024 13:29'
}
PixelEditorInputWindowTest >> testInputWindowOpen [

		self simulateCommandClick.
		self assert: (self checkForInputWindow).
		self abandonInputWindow
]
