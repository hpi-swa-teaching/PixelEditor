Class {
	#name : #PESystemWindow,
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
		'addedText'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'LW 6/11/2024 12:05'
}
PESystemWindow class >> submitButtonSize [

	^ 200 @ 75
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
	#'squeak_changestamp' : 'GLE 6/16/2024 20:33'
}
PESystemWindow >> checkSizeCorrectnessfor: aHeight andWith: aWidth andSize: aSize [

	({aHeight. aWidth. aSize} allSatisfy: [:each | each notNil])
		ifTrue: [^{aHeight. aWidth. aSize} allSatisfy: [:each | each > 0]] 
		ifFalse: [^ false]
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'LW 6/11/2024 13:43'
}
PESystemWindow >> createDefaultCanvas [

	PECanvas pixelGridWidth: 10 andHeight: 10. 
			PEPixel pixelSize: 100. 
			PixelEditor open.
			self abandon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 5/31/2024 11:10'
}
PESystemWindow >> createPixelEditor [

	super initialize.
	self initializeWindow; 
		initializeInputLines;
		initializeSubmitButton; "addmorph dann einfach returnen"
		initializeText.
	self openInWorld
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 12:12'
}
PESystemWindow >> initialExtent [

	^ 250 @ 300
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/16/2024 20:34'
}
PESystemWindow >> initializeInputLineHeight [

	^ PETextInputMorphWithLabel new setLabel: 'Height:';
		position: (self inputLineWidth position x) @ (self inputLineWidth position y + 150);
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 13:38'
}
PESystemWindow >> initializeInputLinePixelSize [

	^ PETextInputMorphWithLabel new setLabel: 'Pixel size:';
		position: (self inputLineHeight position x) @ (self inputLineHeight position y + 150); 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 13:39'
}
PESystemWindow >> initializeInputLineWidth [

	^ PETextInputMorphWithLabel new setLabel: 'Width:';
		position: 50 @ 100; yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 11:46'
}
PESystemWindow >> initializeInputLines [

	self inputLineWidth: self initializeInputLineWidth;
		inputLineHeight: self initializeInputLineHeight;
		inputLinePixelSize: self initializeInputLinePixelSize;
		inputLines: (Array with: self inputLineWidth with: self inputLineHeight with: self inputLinePixelSize).
	self inputLines do: [:each | self addMorph: each inputField. self addMorph: each label]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 12:03'
}
PESystemWindow >> initializeSubmitButton [

	self submitButton: (PluggableButtonMorph new label: 'Submit size';
		extent: (PESystemWindow submitButtonSize);
		target: self;
		actionSelector: #processHeight:andWidth:andSize:;
	      arguments: (Array withAll: {(self inputLineHeight getContent). (self inputLineWidth getContent). (self inputLinePixelSize getContent)});
		position: (self inputLinePixelSize position x) @ (self inputLinePixelSize position y + 150)).
	self addMorph: self submitButton

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/16/2024 20:35'
}
PESystemWindow >> initializeText [

	self addedText: 
	(StringMorph new color: Color red;
		contents: 'Please only use positive natural numbers'; 
		position: (self submitButton position x) @ (self submitButton position y + 100); 
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
	#'squeak_changestamp' : 'LW 6/10/2024 20:10'
}
PESystemWindow >> inputLineWidth [

	^ inputLineWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/10/2024 20:10'
}
PESystemWindow >> inputLineWidth: aLine [

	inputLineWidth := aLine
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
	#'squeak_changestamp' : 'LW 6/11/2024 13:44'
}
PESystemWindow >> processHeight: aHeight andWidth: aWidth andSize: aSize [

	"Refactoring notwendig hier"

	| numericValueHeight 	numericValueWidth numericValuePixelSize |
	
	({aHeight. aWidth. aSize} allSatisfy: [:each | each notEmpty]) ifFalse: [self createDefaultCanvas] ifTrue: [
	numericValueHeight := (aHeight string) asIntegerIfAllDigits.
	numericValueWidth := (aWidth string) asIntegerIfAllDigits.
	numericValuePixelSize := (aSize string) asIntegerIfAllDigits.
	(self checkSizeCorrectnessfor: numericValueHeight andWith: numericValueWidth andSize: numericValuePixelSize)
		ifTrue: [PECanvas pixelGridWidth: numericValueWidth andHeight: numericValueHeight. 
			PEPixel pixelSize: numericValuePixelSize. 
			PixelEditor open.
			self abandon]
		ifFalse: [self addedText emphasis: 4. 
			self addedText changed].]
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
