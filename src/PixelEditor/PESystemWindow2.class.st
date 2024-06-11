Class {
	#name : #PESystemWindow2,
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

{ #category : #'as yet unclassified' }
PESystemWindow2 class >> initialExtent [
	^ 320 @ 300
]

{ #category : #'as yet unclassified' }
PESystemWindow2 class >> submitButtonSize [
	^ 200 @ 100
]

{ #category : #accessing }
PESystemWindow2 >> addedText [
	^ addedText
]

{ #category : #accessing }
PESystemWindow2 >> addedText: t1 [ 
	addedText := t1
]

{ #category : #inputProcessing }
PESystemWindow2 >> checkSizeCorrectnessfor: t1 andWith: t2 andSize: t3 [ 
	t1 isZero | t2 isZero | t3 isZero
		ifTrue: [^ false].
	^ true
]

{ #category : #initialization }
PESystemWindow2 >> createPixelEditor [
	super initialize.
	self initializeWindow; initializeInputLines; initializeSubmitButton; initializeText.
	self openInWorld
]

{ #category : #'as yet unclassified' }
PESystemWindow2 >> createPixelEditorWith: t1 [ 
	^ self
]

{ #category : #accessing }
PESystemWindow2 >> heightInput [
	^ heightInput
]

{ #category : #accessing }
PESystemWindow2 >> heightInput: t1 [ 
	heightInput := t1
]

{ #category : #initialization }
PESystemWindow2 >> initialExtent [
	^ PESystemWindow initialExtent
]

{ #category : #initialization }
PESystemWindow2 >> initializeInputLineHeight [
	^ PETextInputMorphWithLabel2 new setLabel: 'Height:';
		 position: self inputLineWidth position x @ (self inputLineWidth position y + 150);
		 yourself
]

{ #category : #initialization }
PESystemWindow2 >> initializeInputLinePixelSize [
	^ PETextInputMorphWithLabel2 new setLabel: 'Pixel size';
		 position: self inputLineHeight position x @ (self inputLineHeight position y + 150);
		 yourself
]

{ #category : #initialization }
PESystemWindow2 >> initializeInputLineWidth [
	^ PETextInputMorphWithLabel2 new setLabel: 'Width:';
		 position: 50 @ 100;
		 yourself
]

{ #category : #initialization }
PESystemWindow2 >> initializeInputLines [
	self inputLineWidth: self initializeInputLineWidth;
		 inputLineHeight: self initializeInputLineHeight;
		 inputLinePixelSize: self initializeInputLinePixelSize;
		
		inputLines: (Array
				with: self inputLineWidth
				with: self inputLineHeight
				with: self inputLinePixelSize).
	self inputLines
		do: [:t1 | self addMorph: t1 inputField]
]

{ #category : #initialization }
PESystemWindow2 >> initializeSubmitButton [
	self submitButton: (PluggableButtonMorph new label: 'Submit size';
			 target: self;
			 actionSelector: #processHeight:andWidth:andSize:;
			
			arguments: (Array withAll: {self inputLineHeight inputField. self inputLineWidth inputField. self inputLinePixelSize inputField});
			 position: self inputLinePixelSize position x @ (self inputLinePixelSize position y + 150)).
	self addMorph: self submitButton
]

{ #category : #initialization }
PESystemWindow2 >> initializeText [
	self addedText: (StringMorph new contents: 'Please only use positive natural numbers';
			 position: self submitButton position x @ (self submitButton position y + 50);
			 color: Color red;
			 fontName: 'Arial' size: 20;
			 extent: 1000 @ 100;
			 yourself).
	self addMorph: self addedText
]

{ #category : #initialization }
PESystemWindow2 >> initializeWindow [
	self setLabel: 'Canvas size'
]

{ #category : #accessing }
PESystemWindow2 >> inputLineHeight [
	^ inputLineHeight
]

{ #category : #accessing }
PESystemWindow2 >> inputLineHeight: t1 [ 
	inputLineHeight := t1
]

{ #category : #accessing }
PESystemWindow2 >> inputLinePixelSize [
	^ inputLinePixelSize
]

{ #category : #accessing }
PESystemWindow2 >> inputLinePixelSize: t1 [ 
	inputLinePixelSize := t1
]

{ #category : #accessing }
PESystemWindow2 >> inputLineWidth [
	^ inputLineWidth
]

{ #category : #accessing }
PESystemWindow2 >> inputLineWidth: t1 [ 
	inputLineWidth := t1
]

{ #category : #accessing }
PESystemWindow2 >> inputLines [
	^ inputLines
]

{ #category : #accessing }
PESystemWindow2 >> inputLines: t1 [ 
	inputLines := t1
]

{ #category : #inputProcessing }
PESystemWindow2 >> processHeight: t1 andWidth: t2 andSize: t3 [ 
	| t4 t5 t6 t7 |
	t4 := t1 asNumber.
	t5 := t2 asNumber.
	t6 := t3 asNumber.
	(self
			checkSizeCorrectnessfor: t4
			andWith: t5
			andSize: t6)
		ifTrue: [PECanvas pixelGridWidth: t5 andHeight: t4.
			PEPixel pixelSize: t6.
			t7 := PixelEditor open.
			self abandon]
		ifFalse: [self addedText emphasis: 4.
			self addedText changed]
]

{ #category : #accessing }
PESystemWindow2 >> submitButton [
	^ submitButton
]

{ #category : #accessing }
PESystemWindow2 >> submitButton: t1 [ 
	submitButton := t1
]

{ #category : #accessing }
PESystemWindow2 >> widthInput [
	^ widthInput
]

{ #category : #accessing }
PESystemWindow2 >> widthInput: t1 [ 
	widthInput := t1
]

{ #category : #accessing }
PESystemWindow2 >> window [
	^ window
]

{ #category : #accessing }
PESystemWindow2 >> window: t1 [ 
	window := t1
]
