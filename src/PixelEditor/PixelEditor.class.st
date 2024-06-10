Class {
	#name : #PixelEditor,
	#superclass : #Model,
	#instVars : [
		'canvas',
		'colorButtonContainer',
		'jsonString',
		'settingsButtonContainer',
		'systemWindowBounds'
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
	#'squeak_changestamp' : 'GLE 6/4/2024 01:25'
}
PixelEditor class >> openWithCanvas: aCanvas [

	| instance |
	
	instance := self new canvas: aCanvas.
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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/5/2024 21:47'
}
PixelEditor >> addMorphsForUpdating: aCollection [
	
	aCollection do: [:each | self containingWindow paneMorphs add: each]
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/10/2024 18:01'
}
PixelEditor >> buildWith: aBuilder [ 
	
	| builder |
	
	builder := aBuilder build: (aBuilder pluggableWindowSpec new model: self;
	 	label: #labelString;
		extent: self class defaultExtent;
		children: (self createPanelsWith: aBuilder);
		yourself).
		self systemWindow addMorph: (PERezisingAgent new model: self).
		^ builder
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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/5/2024 23:39'
}
PixelEditor >> containers [

	^ { self canvas. 
		self colorButtonContainer.
		self settingsButtonContainer }
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
	#'squeak_changestamp' : 'GLE 6/4/2024 01:16'
}
PixelEditor >> createPanelsWith: aBuilder [

	^ {	self createCanvasPanelWithBuilder: aBuilder.
		self createColorButtonPanelWithBuilder: aBuilder.
		self createSettingsButtonPanelWithBuilder: aBuilder}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/4/2024 01:19'
}
PixelEditor >> createSettingsButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #settingsButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
			 topFraction: 0;
			 leftFraction: 0;
			 bottomFraction: 0.2)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/7/2024 20:57'
}
PixelEditor >> formFromCanvas [

	^ Form fromDisplay: (self canvas layer at: 1) rectangle
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'GLE 6/10/2024 16:58'
}
PixelEditor >> initialize [

	super initialize.
	self canvas: PECanvasBuilder new buildCanvas;
		jsonString: String new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:53'
}
PixelEditor >> jsonString [
	^ jsonString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 00:53'
}
PixelEditor >> jsonString: anObject [
	jsonString := anObject
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
	#'squeak_changestamp' : 'GLE 6/4/2024 01:12'
}
PixelEditor >> settingsButtonCollection [

	^ PEButtonBuilder new buildSettingsButtons: self
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 01:12'
}
PixelEditor >> settingsButtonContainer [

	^ settingsButtonContainer
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 01:12'
}
PixelEditor >> settingsButtonContainer: anObject [

	settingsButtonContainer := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 01:15'
}
PixelEditor >> settingsButtonPanel [
	
	self settingsButtonContainer: (PEButtonRow new addMorphCollection: self settingsButtonCollection).
	^ { self settingsButtonContainer }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/4/2024 01:36'
}
PixelEditor >> systemWindow [

	self dependents do: [:each | each className = 'PluggableSystemWindow' ifTrue: [^ each]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:45'
}
PixelEditor >> systemWindowBounds [
	^ systemWindowBounds
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 16:45'
}
PixelEditor >> systemWindowBounds: anObject [
	systemWindowBounds := anObject
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/10/2024 18:03'
}
PixelEditor >> update [

	self containers do: [:each | each update].
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
