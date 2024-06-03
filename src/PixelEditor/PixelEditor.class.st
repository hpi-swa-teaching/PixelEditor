Class {
	#name : #PixelEditor,
	#superclass : #Model,
	#instVars : [
		'canvas',
		'colorButtonContainer'
	],
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/3/2024 10:04'
}
PixelEditor class >> defaultExtent [

	^ 800@600
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor class >> defaultLabel [

	^ 'Pixel Editor'
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:27'
}
PixelEditor class >> open [

	| instance |
	
	instance := self new.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor class >> register [

	"register the editor to the apps dropdown"
	TheWorldMenu registerOpenCommand: {'PixelEditor'. {PixelEditor. #open}}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:24'
}
PixelEditor >> buildWith: aBuilder [ 
	
	^ aBuilder build: (aBuilder pluggableWindowSpec new model: self;
	 	label: #labelString;
		extent: self class defaultExtent;
		children: (self createPanelsWith: aBuilder);
		yourself).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor >> canvas [

	^ canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor >> canvas: aPECanvas [

	canvas := aPECanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 14:23'
}
PixelEditor >> colorButtonCollection [

	^ PEButtonBuilder new buildColorButtons: self canvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:08'
}
PixelEditor >> colorButtonContainer [
	^ colorButtonContainer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:08'
}
PixelEditor >> colorButtonContainer: anObject [
	colorButtonContainer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:08'
}
PixelEditor >> colorButtonPanel [
	
	self colorButtonContainer: (PEButtonRow new addMorphCollection: self colorButtonCollection).
	^ { self colorButtonContainer }
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:57'
}
PixelEditor >> createCanvasPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #playgroundInCollection;
		 frame: (LayoutFrame new leftFraction: 0.33;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 1)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 14:45'
}
PixelEditor >> createColorButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #colorButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
			 topFraction: 0.66;
			 leftFraction: 0;
			 bottomFraction: 1)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:19'
}
PixelEditor >> createPanelsWith: aBuilder [

	^ {	self createCanvasPanelWithBuilder: aBuilder.
		self createColorButtonPanelWithBuilder: aBuilder}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 13:55'
}
PixelEditor >> createSettingsButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #playgroundInCollection;
		 frame: (LayoutFrame new rightFraction: 0.66;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 1)
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'GLE 6/3/2024 10:16'
}
PixelEditor >> initialize [

	super initialize.
	self canvas: PECanvasBuilder new buildCanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor >> labelString [

	^ self class defaultLabel
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
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor >> open [

	^ ToolBuilder open: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 10:02'
}
PixelEditor >> playgroundInCollection [

	^ {self canvas}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/3/2024 19:24'
}
PixelEditor >> resizeColorButtons [

	self colorButtonContainer position: (self colorButtonContainer owner position);
		extent: (self colorButtonContainer owner extent).
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/3/2024 14:00'
}
PixelEditor >> settingsButtonCollection [

	^ {self canvas}
]

{
	#category : #styles,
	#'squeak_changestamp' : 'GLE 6/3/2024 09:44'
}
PixelEditor >> windowColorToUse [

	^ Color colorFrom: (Model useColorfulWindows
				ifTrue: [self userInterfaceTheme customWindowColor
						ifNil: [Color r: 0.8 g: 0.65 b: 0.35 alpha: 1.0]]
				ifFalse: [self userInterfaceTheme uniformWindowColor
						ifNil: [Color veryVeryLightGray]])	

]
