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
		'addedText'
	],
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PEInputWindow >> addedText [

	^ addedText
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:37'
}
PEInputWindow >> addedText: aString [

	addedText := aString
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 6/24/2024 19:22'
}
PEInputWindow >> checkForEmptyValuesIn: aDictionary [

	(aDictionary anySatisfy: [:each | each isEmpty])
		ifFalse: [self checkForStringValuesIn: aDictionary]
	
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/24/2024 19:21'
}
PEInputWindow >> checkForStringValuesIn: aDictionary [

	| dictionary |

	dictionary := (self convertToInteger: aDictionary).
	(dictionary anySatisfy: [:each | each isNil])
		ifFalse: [self checkSizeCorrectnessFor: dictionary]
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 00:08'
}
PEInputWindow >> checkSizeCorrectnessFor: aDictionary [

	 (aDictionary allSatisfy: [:each | each > 0])
		ifFalse: [self incorrectValues]
		ifTrue: [self openPixelEditorWithDictionary: aDictionary]
	
		
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 23:58'
}
PEInputWindow >> convertToInteger: aDictionary [

	^ Dictionary new fillFrom: aDictionary with: [:each | each string asIntegerIfAllDigits]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:49'
}
PEInputWindow >> createDefaultCanvas [

	PECanvas 
		pixelGridWidth: 10 andHeight: 10;
		pixelSize: 100.
	PixelEditor open.
	self abandon
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:49'
}
PEInputWindow >> createPixelEditor [

	super initialize.
	self 
		initializeInputLines;
		initializeSubmitButton; "addmorph dann einfach returnen"
		initializeText;
		borderWidth: 0;
		openInWorld;
		setLabel: 'Canvas Size'
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:49'
}
PEInputWindow >> incorrectValues [

	self addedText 
		changed; 
		emphasis: 4
		
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'LW 6/11/2024 12:12'
}
PEInputWindow >> initialExtent [

	^ 250 @ 300
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:50'
}
PEInputWindow >> initializeInputLineHeight [

	^ PETextInputMorphWithLabel new 
		setLabel: 'Height:';
		position: (self inputLineWidth position x) @ (self inputLineWidth position y + 150);
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:50'
}
PEInputWindow >> initializeInputLinePixelSize [

	^ PETextInputMorphWithLabel new 
		setLabel: 'Pixel size:';
		position: (self inputLineHeight position x) @ (self inputLineHeight position y + 150); 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:50'
}
PEInputWindow >> initializeInputLineWidth [

	^ PETextInputMorphWithLabel new 
		setLabel: 'Width:';
		position: 50 @ 100; 
		yourself
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:51'
}
PEInputWindow >> initializeInputLines [

	self 
		inputLineWidth: self initializeInputLineWidth;
		inputLineHeight: self initializeInputLineHeight;
		inputLinePixelSize: self initializeInputLinePixelSize;
		inputLines: { self inputLineWidth . self inputLineHeight . self inputLinePixelSize }.
	self inputLines do: [:each | self 
		addMorph: (each inputField); 
		addMorph: each label]
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:53'
}
PEInputWindow >> initializeSubmitButton [

	self submitButton: (PluggableButtonMorph new 
		label: 'Submit size';
		extent: self submitButtonSize;
		target: self;
		actionSelector: #processHeight:andWidth:andSize:;
	      arguments: {self inputLineHeight getContent . self inputLineWidth getContent . self inputLinePixelSize getContent};
		position: (self inputLinePixelSize position x) @ (self inputLinePixelSize position y + 150)).
	self addMorph: self submitButton

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/22/2024 13:54'
}
PEInputWindow >> initializeText [

	self addedText: 
	(StringMorph new 
		color: Color red;
		contents: 'Please only use positive natural numbers'; 
		position: (self submitButton position x) @ (self submitButton position y + 100); 
		fontName: 'Arial' size: 20;
		extent: 1000 @ 100;
		yourself).
	self addMorph: self addedText.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PEInputWindow >> inputLineHeight [

	^ inputLineHeight
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 19:40'
}
PEInputWindow >> inputLineHeight: aLine [

	inputLineHeight := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/27/2024 11:43'
}
PEInputWindow >> inputLinePixelSize [

	^ inputLinePixelSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/27/2024 11:43'
}
PEInputWindow >> inputLinePixelSize: aSize [

	inputLinePixelSize := aSize
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/10/2024 20:10'
}
PEInputWindow >> inputLineWidth [

	^ inputLineWidth
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 6/10/2024 20:10'
}
PEInputWindow >> inputLineWidth: aLine [

	inputLineWidth := aLine
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PEInputWindow >> inputLines [

	^ inputLines
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/25/2024 17:13'
}
PEInputWindow >> inputLines: anArray [

	inputLines := anArray
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/20/2024 17:46'
}
PEInputWindow >> openPixelEditorWithDictionary: aDictionary [

	PECanvas pixelGridWidth: (aDictionary at: 'width')  andHeight: (aDictionary at: 'height');
		pixelSize: (aDictionary at: 'pixelSize'). 
	PixelEditor open.
	self abandon
]

{
	#category : #inputProcessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 09:38'
}
PEInputWindow >> processHeight: aHeight andWidth: aWidth andSize: aSize [

	| dictionary |
	
	dictionary := Dictionary newFromPairs: { 'width' . aWidth . 'height' . aHeight . 'pixelSize' . aSize }.
	(dictionary anySatisfy: [:each | each notEmpty])
		ifFalse: [self createDefaultCanvas] 
		ifTrue: [self checkForEmptyValuesIn: dictionary]
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PEInputWindow >> submitButton [

	^ submitButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'LW 5/24/2024 20:18'
}
PEInputWindow >> submitButton: aButton [

	submitButton := aButton
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:38'
}
PEInputWindow >> submitButtonSize [

	^ 200 @ 75
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
	#'squeak_changestamp' : 'LW 5/23/2024 17:09'
}
PEInputWindow >> window: aWindow [

	window := aWindow
]
