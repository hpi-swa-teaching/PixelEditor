Class {
	#name : #PECanvasSizeInputWorks,
	#superclass : #PEUI,
	#instVars : [
		'heightInput',
		'widthInput',
		'window',
		'submitButton',
		'inputLine',
		'inputLineHeight',
		'inputPixelSize'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 22:38'
}
PECanvasSizeInputWorks >> checkSizeCorrectnessfor: aHeight and: aWidth and: aSize [

	(aHeight isZero) | (aWidth isZero) ifTrue: [^ false] ifFalse: [^ true]
		
		"ifFalse: [(aHeight \\ aSize = 0) & (aWidth \\ aSize = 0) ifTrue: [^ true] ifFalse: [^ false]]
		ifTrue: [^ false]"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInputWorks >> heightInput [

	^ heightInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInputWorks >> heightInput: aHeight [

	heightInput := aHeight
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 20:13'
}
PECanvasSizeInputWorks >> initialize [

	self initializeWindow
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/25/2024 16:53'
}
PECanvasSizeInputWorks >> initializeSubmitButton [

	self submitButton:
	"(PEButton new 
		anObject: self; 
		arguments: (Array withAll: {self inputLineHeight textInput. self inputLine textInput. self inputPixelSize textInput});
		actionLeft: #processHeight:andWidth:andSize:;
		extent: 1000@500;
		label: 'Submit size';
		position: (self inputPixelSize position x) @ (self inputPixelSize position y + 150); yourself)"
	
	(PluggableButtonMorph new
		label: 'Submit size';
		target: self;
		actionSelector: #processHeight:andWidth:andSize:;
	      arguments: (Array withAll: {self inputLineHeight textInput. self inputLine textInput. self inputPixelSize textInput});
		position: (self inputPixelSize position x) @ (self inputPixelSize position y + 150))

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/25/2024 17:04'
}
PECanvasSizeInputWorks >> initializeWindow [

	self window: (PEWindowWithSize new setLabel: 'Canvas size'; yourself).
	
	self inputLine: (PEInputMorphWithLabel new setLabel: 'Width:'; position: 50 @ 100; yourself).
	self inputLineHeight: (PEInputMorphWithLabel new setLabel: 'Height:'; position: (self inputLine position x) @ (self inputLine position y + 150); yourself).
	self inputPixelSize: (PEInputMorphWithLabel new setLabel: 'Pixelsize'; position: (self inputLineHeight position x) @ (self inputLineHeight position y + 150); yourself).

	self initializeSubmitButton.
	self window addMorph: self inputLine inputField.
	self window addMorph: self inputLineHeight inputField.
	self window addMorph: self inputPixelSize inputField.
	self window addMorph: self submitButton.
	self window openInWorld.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PECanvasSizeInputWorks >> inputLine [

	^ inputLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PECanvasSizeInputWorks >> inputLine: aLine [

	inputLine := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PECanvasSizeInputWorks >> inputLineHeight [

	^ inputLineHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PECanvasSizeInputWorks >> inputLineHeight: aLine [

	inputLineHeight := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 22:19'
}
PECanvasSizeInputWorks >> inputPixelSize [

	^ inputPixelSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 22:19'
}
PECanvasSizeInputWorks >> inputPixelSize: aSize [

	inputPixelSize := aSize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/24/2024 22:33'
}
PECanvasSizeInputWorks >> processHeight: aHeight andWidth: aWidth andSize: aSize [

	| numericValueHeight 	numericValueWidth numericValuePixelSize |
		
	numericValueHeight := aHeight getNumericValue.
	numericValueWidth := aWidth getNumericValue.
	numericValuePixelSize := aSize getNumericValue.
	(self checkSizeCorrectnessfor: numericValueHeight and: numericValueWidth and: numericValuePixelSize)
		ifTrue: [PECanvas pixelGridWidth: numericValueHeight andHeight: numericValueWidth. PEPixel pixelSize: numericValuePixelSize. PEBuilder new buildPixelEditor. self window abandon]
		ifFalse: [Transcript show: 'Please only use numbers that are multiples of your pixel size'; cr.]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PECanvasSizeInputWorks >> submitButton [

	^ submitButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PECanvasSizeInputWorks >> submitButton: aButton [

	submitButton := aButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInputWorks >> widthInput [

	^ widthInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInputWorks >> widthInput: aWidth [

	widthInput := aWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:10'
}
PECanvasSizeInputWorks >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:09'
}
PECanvasSizeInputWorks >> window: aWindow [

	window := aWindow
]
