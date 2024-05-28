Class {
	#name : #PESystemWindow,
	#superclass : #SystemWindow,
	#instVars : [
		'heightInput',
		'widthInput',
		'window',
		'submitButton',
		'inputLine',
		'inputLineHeight',
		'inputLinePixelSize',
		'inputLines',
		'addedText'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:36'
}
PESystemWindow class >> initialExtent [

	^ 320 @ 300
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PESystemWindow >> addedText [

	^ addedText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PESystemWindow >> addedText: aString [

	addedText := aString
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'LW 5/27/2024 12:03'
}
PESystemWindow >> checkSizeCorrectnessfor: aHeight andWith: aWidth andSize: aSize [

	(aHeight isZero) | (aWidth isZero) | (aSize isZero) ifTrue: [^ false] ifFalse: [^ true]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 5/27/2024 11:56'
}
PESystemWindow >> createPixelEditorWith: anArray [
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PESystemWindow >> heightInput [

	^ heightInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:32'
}
PESystemWindow >> heightInput: aHeight [

	heightInput := aHeight
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 11:37'
}
PESystemWindow >> initialExtent [

	^ PESystemWindow initialExtent
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 12:02'
}
PESystemWindow >> initialize [

	super initialize.
	self initializeWindow; 
		initializeInputLines;
		initializeSubmitButton; "addmorph dann einfach returnen"
		initializeText.
	self openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 11:41'
}
PESystemWindow >> initializeInputLineHeight [

	^ PETextInputMorphWithLabel new setLabel: 'Height:'; 
		position: (self inputLine position x) @ (self inputLine position y + 150); 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 11:42'
}
PESystemWindow >> initializeInputLinePixelSize [

	^ PETextInputMorphWithLabel new setLabel: 'Pixel size'; 
		position: (self inputLineHeight position x) @ (self inputLineHeight position y + 150); 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 11:40'
}
PESystemWindow >> initializeInputLineWidth [

	^ PETextInputMorphWithLabel new setLabel: 'Width:'; position: 50 @ 100; yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 12:00'
}
PESystemWindow >> initializeInputLines [

	self inputLine: self initializeInputLineWidth;
		inputLineHeight: self initializeInputLineHeight;
		inputLinePixelSize: self initializeInputLinePixelSize;
		inputLines: (Array with: self inputLine with: self inputLineHeight with: self inputLinePixelSize).
	self inputLines do: [:each | self addMorph: each inputField]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 12:01'
}
PESystemWindow >> initializeSubmitButton [

	self submitButton: (PluggableButtonMorph new label: 'Submit size';
		target: self;
		actionSelector: #processHeight:andWidth:andSize:;
	      arguments: (Array withAll: {self inputLineHeight textInput. self inputLine textInput. self inputLinePixelSize textInput});
		position: (self inputLinePixelSize position x) @ (self inputLinePixelSize position y + 150)).
	self addMorph: self submitButton

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 10:57'
}
PESystemWindow >> initializeText [

	self addedText: 
	(StringMorph new 
		contents: 'Please only use positive natural numbers'; 
		position: (self submitButton position x) @ (self submitButton position y + 50); 
		color: Color red;
		fontName: 'Arial' size: 20;
		extent: 1000 @ 100;
		yourself).
	self addMorph: self addedText.
	
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 5/27/2024 10:56'
}
PESystemWindow >> initializeWindow [

	self setLabel: 'Canvas size'
	 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PESystemWindow >> inputLine [

	^ inputLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:50'
}
PESystemWindow >> inputLine: aLine [

	inputLine := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PESystemWindow >> inputLineHeight [

	^ inputLineHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PESystemWindow >> inputLineHeight: aLine [

	inputLineHeight := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/27/2024 11:43'
}
PESystemWindow >> inputLinePixelSize [

	^ inputLinePixelSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/27/2024 11:43'
}
PESystemWindow >> inputLinePixelSize: aSize [

	inputLinePixelSize := aSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PESystemWindow >> inputLines [

	^ inputLines
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PESystemWindow >> inputLines: anArray [

	inputLines := anArray
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'LW 5/27/2024 12:03'
}
PESystemWindow >> processHeight: aHeight andWidth: aWidth andSize: aSize [

	| numericValueHeight 	numericValueWidth numericValuePixelSize |
		
	numericValueHeight := aHeight getNumericValue.
	numericValueWidth := aWidth getNumericValue.
	numericValuePixelSize := aSize getNumericValue.
	(self checkSizeCorrectnessfor: numericValueHeight andWith: numericValueWidth andSize: numericValuePixelSize)
		ifTrue: [PECanvas pixelGridWidth: numericValueHeight andHeight: numericValueWidth. PEPixel pixelSize: 				numericValuePixelSize. PEBuilder new buildPixelEditor. self abandon]
		ifFalse: [self addedText emphasis: 4. self addedText changed]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PESystemWindow >> submitButton [

	^ submitButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PESystemWindow >> submitButton: aButton [

	submitButton := aButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PESystemWindow >> widthInput [

	^ widthInput
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/21/2024 22:33'
}
PESystemWindow >> widthInput: aWidth [

	widthInput := aWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:10'
}
PESystemWindow >> window [

	^ window
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/23/2024 17:09'
}
PESystemWindow >> window: aWindow [

	window := aWindow
]
