Class {
	#name : #PECanvasSizeInputGian,
	#superclass : #PEUI,
	#instVars : [
		'heightInput',
		'widthInput',
		'window',
		'submitButton',
		'inputLine',
		'inputLineHeight',
		'inputPixelSize',
		'inputLines',
		'addedText'
	],
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PECanvasSizeInputGian >> addedText [

	^ addedText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PECanvasSizeInputGian >> addedText: aString [

	addedText := aString
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'LW 5/25/2024 18:23'
}
PECanvasSizeInputGian >> checkSizeCorrectnessfor: aHeight and: aWidth and: aSize [

	(aHeight isZero) | (aWidth isZero) | (aSize isZero) ifTrue: [^ false] ifFalse: [^ true]
	
		"ifFalse: [(aHeight \\ aSize = 0) & (aWidth \\ aSize = 0) ifTrue: [^ true] ifFalse: [^ false]]
		ifTrue: [^ false]"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInputGian >> heightInput [

	^ heightInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PECanvasSizeInputGian >> heightInput: aHeight [

	heightInput := aHeight
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/25/2024 17:39'
}
PECanvasSizeInputGian >> initialize [

	self initializeWindow; initializeInputLines; initializeSubmitButton; initializeText.
	self window openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/25/2024 18:08'
}
PECanvasSizeInputGian >> initializeInputLines [

	self 
		inputLine: (PEInputMorphWithLabel new setLabel: 'Width:'; position: 50 @ 100; yourself);
		inputLineHeight: (PEInputMorphWithLabel new setLabel: 'Height:'; 
							position: (self inputLine position x) @ (self inputLine position y + 150); yourself);
		inputPixelSize: (PEInputMorphWithLabel new setLabel: 'Pixel size'; 
							position: (self inputLineHeight position x) @ (self inputLineHeight position y + 150); yourself);
		inputLines: (Array with: self inputLine with: self inputLineHeight with: self inputPixelSize).
	self inputLines do: [:each | self window addMorph: each inputField]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/25/2024 17:23'
}
PECanvasSizeInputGian >> initializeSubmitButton [

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
		position: (self inputPixelSize position x) @ (self inputPixelSize position y + 150)).
	self window addMorph: self submitButton.

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 10:18'
}
PECanvasSizeInputGian >> initializeText [

	self addedText: 
	(StringMorph new 
		contents: 'Please only use positive natural numbers'; 
		position: (self submitButton position x) @ (self submitButton position y + 50); 
		color: Color red;
		fontName: 'Arial' size: 20;
		extent: 1000 @ 100;
		yourself).
	self window addMorph: self addedText.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/25/2024 17:36'
}
PECanvasSizeInputGian >> initializeWindow [

	self window: (PEWindowWithSize new setLabel: 'Canvas size'; yourself).
	 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PECanvasSizeInputGian >> inputLine [

	^ inputLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PECanvasSizeInputGian >> inputLine: aLine [

	inputLine := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PECanvasSizeInputGian >> inputLineHeight [

	^ inputLineHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PECanvasSizeInputGian >> inputLineHeight: aLine [

	inputLineHeight := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PECanvasSizeInputGian >> inputLines [

	^ inputLines
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PECanvasSizeInputGian >> inputLines: anArray [

	inputLines := anArray
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 22:19'
}
PECanvasSizeInputGian >> inputPixelSize [

	^ inputPixelSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 22:19'
}
PECanvasSizeInputGian >> inputPixelSize: aSize [

	inputPixelSize := aSize
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:57'
}
PECanvasSizeInputGian >> processHeight: aHeight andWidth: aWidth andSize: aSize [

	| numericValueHeight 	numericValueWidth numericValuePixelSize |
		
	numericValueHeight := aHeight getNumericValue.
	numericValueWidth := aWidth getNumericValue.
	numericValuePixelSize := aSize getNumericValue.
	(self checkSizeCorrectnessfor: numericValueHeight and: numericValueWidth and: numericValuePixelSize)
		ifTrue: [PECanvas pixelGridWidth: numericValueHeight andHeight: numericValueWidth. PEPixel pixelSize: numericValuePixelSize. PEBuilder new buildPixelEditor. self window abandon]
		ifFalse: [self addedText emphasis: 4. self addedText changed]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PECanvasSizeInputGian >> submitButton [

	^ submitButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PECanvasSizeInputGian >> submitButton: aButton [

	submitButton := aButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInputGian >> widthInput [

	^ widthInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PECanvasSizeInputGian >> widthInput: aWidth [

	widthInput := aWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:10'
}
PECanvasSizeInputGian >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:09'
}
PECanvasSizeInputGian >> window: aWindow [

	window := aWindow
]
