Class {
	#name : #PixelEditorInputWindowTest,
	#superclass : #PixelEditorTest,
	#category : #'PixelEditor-Tests'
}

{
	#category : #release,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:49'
}
PixelEditorInputWindowTest >> abandonInputWindow [

	PEInputWindow allInstances do: [:each | each close]

	
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LW 6/23/2024 13:24'
}
PixelEditorInputWindowTest >> checkForInputWindow [

	^ PEInputWindow allInstances isEmpty not
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:52'
}
PixelEditorInputWindowTest >> simulateCommandClick [

	| command window selector |
	
	PixelEditor register.
	command := (TheWorldMenu registeredOpenCommands detect: [:each | each first = 'PixelEditor' ]).
	command ifNotNil: [
		window := command second first.
		selector := command second second.
		window perform: selector ]
]

{
	#category : #testing,
	#'squeak_changestamp' : 'LW 6/23/2024 13:29'
}
PixelEditorInputWindowTest >> testInputWindowOpen [

		self simulateCommandClick.
		self assert: (self checkForInputWindow).
		self abandonInputWindow
]
