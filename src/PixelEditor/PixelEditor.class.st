Class {
	#name : #PixelEditor,
	#superclass : #Model,
	#instVars : [
		'canvas',
		'hColorSelector',
		'aColorSelector'
	],
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:20'
}
PixelEditor class >> defaultExtent [
	^ 800@600
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:17'
}
PixelEditor class >> defaultLabel [
	^ 'Pixel Editor'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 6/2/2024 16:41'
}
PixelEditor class >> open [
	| instance |
	instance := self new.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 5/21/2024 11:52'
}
PixelEditor class >> register [
	"register the editor to the apps dropdown"
	
	TheWorldMenu registerOpenCommand: {'PixelEditor'. {PixelEditor. #open}}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:03'
}
PixelEditor >> aColorSelector [
	^ aColorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:04'
}
PixelEditor >> aColorSelector: aAColorSelector [ 
	aColorSelector := aAColorSelector
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:22'
}
PixelEditor >> buildWith: aBuilder [ 
	^ aBuilder build: (aBuilder pluggableWindowSpec new model: self;
			 label: #labelString;
			 extent: self class defaultExtent;
			 children: {self createCanvasPanelWithBuilder: aBuilder. self createToolPanelWithBuilder:  aBuilder};
			 yourself)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/1/2024 13:07'
}
PixelEditor >> canvas [
	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/1/2024 13:09'
}
PixelEditor >> canvas: aPECanvas [
	canvas := aPECanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/2/2024 16:54'
}
PixelEditor >> canvasInCollection [
	^ {self canvas}
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:04'
}
PixelEditor >> colorSelectorsInCollection [
	^ {self hColorSelector. self aColorSelector}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/2/2024 16:54'
}
PixelEditor >> createCanvasPanelWithBuilder: aBuilder [ 
	^ aBuilder pluggablePanelSpec new model: self;
		 children: #canvasInCollection;
		 frame: (LayoutFrame new leftFraction: 0.33;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 1)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:21'
}
PixelEditor >> createToolPanelWithBuilder: aBuilder [ 
	^ aBuilder pluggablePanelSpec new model: self;
		 children: {};
		 frame: (LayoutFrame new leftFraction: 0;
			 topFraction: 0;
			 rightFraction: 0.33;
			 bottomFraction: 1)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:50'
}
PixelEditor >> hColorSelector [
	^ hColorSelector
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/25/2024 11:50'
}
PixelEditor >> hColorSelector: aHColorSelector [
	hColorSelector := aHColorSelector
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/25/2024 12:04'
}
PixelEditor >> initialize [
	super initialize.
	canvas := PECanvas new.
	hColorSelector := HColorSelectorMorph new.
	aColorSelector := AColorSelectorMorph new.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:16'
}
PixelEditor >> labelString [
	^ self class defaultLabel
]

{
	#category : #canvas,
	#'squeak_changestamp' : 'Corvin 6/2/2024 17:00'
}
PixelEditor >> nameCanvasMorph [
	^ canvas name: 'canvas';
		 yourself
]

{
	#category : #'lifecycle hooks',
	#'squeak_changestamp' : 'Corvin 5/28/2024 11:02'
}
PixelEditor >> onClose [
	"TODO"
	^ ''
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:19'
}
PixelEditor >> open [
	^ ToolBuilder open: self
]

{
	#category : #styles,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:45'
}
PixelEditor >> windowColorToUse [
	^ Color
		colorFrom: (Model useColorfulWindows
				ifTrue: [self userInterfaceTheme customWindowColor
						ifNil: [Color
								r: 0.8
								g: 0.65
								b: 0.35
								alpha: 1.0]]
				ifFalse: [self userInterfaceTheme uniformWindowColor
						ifNil: [Color veryVeryLightGray]])
]
