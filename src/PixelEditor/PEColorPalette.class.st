Class {
	#name : #PEColorPalette,
	#superclass : #PEUI,
	#instVars : [
		'colorRed',
		'colorBlue',
		'colorGreen',
		'textMorphCollection',
		'colorButton',
		'chosenColor',
		'hsvMorph'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 16:10'
}
PEColorPalette class >> colorPaletteExtent [

	^ 150 @ 150
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 16:08'
}
PEColorPalette class >> sizeButtonRow [

	^ 80 @ 150
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 16:11'
}
PEColorPalette class >> textBoxSize [

	^ 70 @ 50
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 17:41'
}
PEColorPalette >> addHSV [

	| buttonRow |
	
	hsvMorph := HSVColorSelectorMorph new.
	self addMorphNext: hsvMorph.

	buttonRow := AlignmentMorph newRow.
	buttonRow addMorph: self buildCloseButton;
		addMorph: self buildAcceptButton.
	
	self addMorphBelow: buttonRow.

	


]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/23/2024 11:55'
}
PEColorPalette >> addMorphBelow: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: 0 @ (self submorphs last bounds corner y))] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/23/2024 18:07'
}
PEColorPalette >> addMorphNext: aMorph [

	self submorphs isEmpty
		ifTrue: [self addMorph: aMorph] 
		ifFalse: [self addMorphBack: (aMorph position: (self submorphs last bounds corner x) @ 0)] 
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 18:07'
}
PEColorPalette >> addTextButtonRow [

	| buttonRow |
	
	buttonRow := PEButtonRow new extent: PEColorPalette  sizeButtonRow.
	buttonRow addMorphBelow: (self getTextMorph: 'Red');
				addMorphBelow: (self getTextMorph: 'Green');
				addMorphBelow: (self getTextMorph: 'Blue');
				addMorphBelow: self buildAcceptButton.
		
	self addMorphNext: buttonRow
	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 18:33'
}
PEColorPalette >> addTextInputButtonRow [

	| buttonRow |
	
	buttonRow := PEButtonRow new extent: PEColorPalette sizeButtonRow.
	buttonRow addMorphBelow: self getTextInputMorph ;
				addMorphBelow: self getTextInputMorph;
				addMorphBelow: self getTextInputMorph;
				addMorphBelow: self buildCloseButton.
	
	self addMorphNext: buttonRow
	
	

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:52'
}
PEColorPalette >> adjustColor [

	chosenColor := self hsvMorph selectedColor.
    
	self colorButton color: self chosenColor;
		doActionLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 17:33'
}
PEColorPalette >> adjustHSV [

	self hsvMorph selectedColor: (self colorButton color)

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/27/2024 11:11'
}
PEColorPalette >> buildAcceptButton [

	^ PluggableButtonMorph new target: self;
		action: #adjustColor;
		color: Color yellow;
		label: 'Accept';
		extent: PEColorPalette textBoxSize;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 5/27/2024 11:11'
}
PEColorPalette >> buildCloseButton [

	^ PluggableButtonMorph new target: self;
		action: #abandon;
		color: Color yellow;
		label: 'Close';
		extent: PEColorPalette textBoxSize;
		yourself
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:43'
}
PEColorPalette >> chosenColor [
	^ chosenColor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:43'
}
PEColorPalette >> chosenColor: anObject [
	chosenColor := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 14:59'
}
PEColorPalette >> colorBlue [

	^ colorBlue
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 14:59'
}
PEColorPalette >> colorBlue: anObject [

	colorBlue := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 17:01'
}
PEColorPalette >> colorButton [

	^ colorButton
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 17:41'
}
PEColorPalette >> colorButton: anObject [

	| color |
	
	colorButton := anObject.
	color := colorButton color.
	self position: 150 @ (colorButton position y).
	self hsvMorph selectedColor: (self colorButton color)

	
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 15:00'
}
PEColorPalette >> colorGreen [

	^ colorGreen

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 14:59'
}
PEColorPalette >> colorGreen: anObject [

	colorGreen := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 15:00'
}
PEColorPalette >> colorRed [

	^ colorRed
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 15:00'
}
PEColorPalette >> colorRed: anObject [

	colorRed := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 16:41'
}
PEColorPalette >> doNothing [

	"Nothing"
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 15:03'
}
PEColorPalette >> getColorFromRGB [

	^Color r: self colorRed g: self colorGreen b: self colorBlue.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 18:10'
}
PEColorPalette >> getTextInputMorph [

	| morph textMorph |
		
	morph :=  Morph new color: Color lightMagenta;
		borderWidth: 2;
		borderColor: Color magenta;
		extent: PEColorPalette textBoxSize.
		
	textMorph := PEPluggableTextMorph new extent: morph extent;
		yourself.
	self textMorphCollection addLast: textMorph.
	
	^ morph addMorph: textMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 16:04'
}
PEColorPalette >> getTextMorph: aString [

	| morph |
	
	morph :=  Morph new color: Color transparent; 
		extent: PEColorPalette textBoxSize.
		
	^ morph addMorph: (PEButtonText  new contents: aString;
			extent: morph extent;
			center: morph center; 
			yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:45'
}
PEColorPalette >> hsvMorph [
	^ hsvMorph
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:45'
}
PEColorPalette >> hsvMorph: anObject [
	hsvMorph := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/23/2024 11:23'
}
PEColorPalette >> initialize [

	super initialize.
	self addHSV;
		openInWorld
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:54'
}
PEColorPalette >> rgbAdjustColor [

	self colorRed: ((self textMorphCollection at: 1) textMorph contents asNumber);
		colorGreen: ((self textMorphCollection at: 2) textMorph contents asNumber);
		colorBlue: ((self textMorphCollection at: 3) textMorph contents asNumber).
	
	self colorButton color: self getColorFromRGB;
		doActionLeft
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/25/2024 16:57'
}
PEColorPalette >> rgbInitialize [
	
	self textMorphCollection: OrderedCollection new;
		addTextButtonRow;
		addTextInputButtonRow;
		extent: PEColorPalette colorPaletteExtent;
		color: Color transparent;	
		borderWidth: 2;
		borderColor: Color darkGray;
		openInWorld;
		rgbAdjustColor

	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 16:46'
}
PEColorPalette >> textMorphCollection [

	^ textMorphCollection
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GT 5/20/2024 16:46'
}
PEColorPalette >> textMorphCollection: anObject [

	textMorphCollection := anObject
]
