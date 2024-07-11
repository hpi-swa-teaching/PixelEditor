Class {
	#name : #PEPanelBuilder,
	#superclass : #PEBuilder,
	#instVars : [
		'containerDictionary',
		'pixelEditor',
		'inputWindow'
	],
	#classInstVars : [
		'panelBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEPanelBuilder class >> default [

	self panelBuilder
		ifNil: [ self reset ].
	^ self panelBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEPanelBuilder class >> panelBuilder [

	^ panelBuilder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:16'
}
PEPanelBuilder class >> panelBuilder: aPanelBuilder [

	^ panelBuilder := aPanelBuilder
]

{
	#category : #initialize,
	#'squeak_changestamp' : 'GLE 7/6/2024 15:15'
}
PEPanelBuilder class >> reset [

	self panelBuilder: self new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:18'
}
PEPanelBuilder >> canvas [

	self containerDictionary at: #canvas put: PECanvasBuilder default buildCanvas
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:28'
}
PEPanelBuilder >> canvasAsCollection [

	^ { self containerDictionary at: #canvas }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:18'
}
PEPanelBuilder >> canvasFromJson: aJsonString [

	self containerDictionary at: #canvas put: (PECanvasBuilder default buildCanvasFromJson: aJsonString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:04'
}
PEPanelBuilder >> colorButtonPanel [
	
	| colorButtons |
	
	colorButtons := self colorButtonRow.
	self containerDictionary at: #colorButtons put: colorButtons.
	^ { colorButtons }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:18'
}
PEPanelBuilder >> colorButtonRow [

	^ PEButtonBuilder default buildColorButtonsWithTarget: self pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/20/2024 11:15'
}
PEPanelBuilder >> colorSelectorPanel [

	| colorSelector |
	
	colorSelector := PEButtonBuilder default buildEmptyButtonRow.
	self containerDictionary at: #colorSelector put: colorSelector.
	^ { colorSelector }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:18'
}
PEPanelBuilder >> containerDictionary [

	^ containerDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:02'
}
PEPanelBuilder >> containerDictionary: aDictionary [

	containerDictionary := aDictionary
]

{
	#category : #'canvas panel',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:46'
}
PEPanelBuilder >> createCanvasPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #canvasAsCollection;
		frame: (LayoutFrame new 
			leftFraction: 0.33;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 1)
]

{
	#category : #'color panel',
	#'squeak_changestamp' : 'LW 7/4/2024 11:11'
}
PEPanelBuilder >> createColorButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #colorButtonPanel;
		frame: (LayoutFrame new 
			rightFraction: 0.33;
			topFraction: 0.66;
			leftFraction: 0;
			bottomFraction: 1)
]

{
	#category : #'color panel',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:47'
}
PEPanelBuilder >> createColorSelectorPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #colorSelectorPanel;
		frame: (LayoutFrame new 
			rightFraction: 0.33;
			topFraction: 0.2;
			leftFraction: 0;
			bottomFraction: 0.5)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:15'
}
PEPanelBuilder >> createHeightPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #heightInput;
		frame: (LayoutFrame new 
			rightFraction: 0.5;
			topFraction: 0.15;
			leftFraction: 0;
			bottomFraction: 0)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:20'
}
PEPanelBuilder >> createInputPanelsWithBuilder: aBuilder [


	^ {	self createHeightPanelWithBuilder: aBuilder.
		self createWidthPanelWithBuilder: aBuilder.
		self createPixelSizePanelWithBuilder: aBuilder.
		self createSubmitButtonPanelWithBuilder: aBuilder}
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:17'
}
PEPanelBuilder >> createInputWindowPanelWithBuilder: aBuilder andModel: anInputWindow [

	self inputWindow: anInputWindow.
	^ aBuilder build: (aBuilder pluggableWindowSpec new 
		model: anInputWindow;
	 	label: #labelString;
		extent: self inputWindowExtent;
		children: (self createInputPanelsWithBuilder: aBuilder);
		yourself)
]

{
	#category : #'panel initialization',
	#'squeak_changestamp' : 'GLE 6/22/2024 16:28'
}
PEPanelBuilder >> createPanelsWithBuilder: aBuilder [

	| panels |

	panels := { self createCanvasPanelWithBuilder: aBuilder.
		self createColorButtonPanelWithBuilder: aBuilder.
		self createSettingsButtonPanelWithBuilder: aBuilder.
		self createToolPanelWithBuilder: aBuilder.
		self createColorSelectorPanelWithBuilder: aBuilder }.
	self pixelEditor containerDictionary: self containerDictionary.
	^ panels
	
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:40'
}
PEPanelBuilder >> createPixelSizePanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #pixelSizeInput;
		frame: (LayoutFrame new 
			rightFraction: 0.5;
			topFraction: 0.65;
			leftFraction: 0;
			bottomFraction: 0)
]

{
	#category : #'settings panel',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:47'
}
PEPanelBuilder >> createSettingsButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #settingsButtonPanel;
		frame: (LayoutFrame new 
			rightFraction: 0.33;
			topFraction: 0;
			leftFraction: 0;
			bottomFraction: 0.2)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:20'
}
PEPanelBuilder >> createSubmitButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #submitButton;
		frame: (LayoutFrame new 
			rightFraction: 0.5;
			topFraction: 0.8;
			leftFraction: 0;
			bottomFraction: 0)
]

{
	#category : #'tool panel',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:48'
}
PEPanelBuilder >> createToolPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #toolButtonPanel;
		frame: (LayoutFrame new 
			rightFraction: 0.33;
			topFraction: 0.5;
			leftFraction: 0;
			bottomFraction: 0.66)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:39'
}
PEPanelBuilder >> createWidthPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: #widthInput;
		frame: (LayoutFrame new 
			rightFraction: 0.5;
			topFraction: 0.4;
			leftFraction: 0;
			bottomFraction: 0)
]

{
	#category : #'panel initialization',
	#'squeak_changestamp' : 'GLE 7/11/2024 10:17'
}
PEPanelBuilder >> createWindowPanelWithBuilder: aBuilder andModel: aPixelEditor [

	self pixelEditor: aPixelEditor.
	^ aBuilder build: (aBuilder pluggableWindowSpec new 
		model: aPixelEditor;
	 	label: #labelString;
		extent: self pixelEditorExtent;
		children: (self createPanelsWithBuilder: aBuilder);
		yourself)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:39'
}
PEPanelBuilder >> heightInput [

	^ { PEUserInputBuilder default inputFieldWithLabel: 'Height:' }
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 16:03'
}
PEPanelBuilder >> initialize [ 

	super initialize.
	self containerDictionary: Dictionary new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:03'
}
PEPanelBuilder >> inputWindow [

	^ inputWindow
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:03'
}
PEPanelBuilder >> inputWindow: anInputWindow [

	inputWindow := anInputWindow
]

{
	#category : #extent,
	#'squeak_changestamp' : 'LW 7/4/2024 11:09'
}
PEPanelBuilder >> inputWindowExtent [

	^ 250 @ 300
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:37'
}
PEPanelBuilder >> pixelEditor [

	^ pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/7/2024 18:03'
}
PEPanelBuilder >> pixelEditor: aPixelEditor [

	pixelEditor := aPixelEditor
]

{
	#category : #extent,
	#'squeak_changestamp' : 'GLE 6/22/2024 16:10'
}
PEPanelBuilder >> pixelEditorExtent [

	 ^ 800 @ 600
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:40'
}
PEPanelBuilder >> pixelSizeInput [

	^ { PEUserInputBuilder default inputFieldWithLabel: 'Pixel Size:' }
	
]

{
	#category : #'settings panel',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEPanelBuilder >> settingsButtonCollection [

	^ PEButtonBuilder default buildSettingsButtons: self pixelEditor
]

{
	#category : #'settings panel',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:11'
}
PEPanelBuilder >> settingsButtonPanel [
	
	| settingsButtons |
	
	settingsButtons := self settingsButtonCollection.
	self containerDictionary at: #settingsButtons put: settingsButtons.
	^ { settingsButtons }
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 15:19'
}
PEPanelBuilder >> submitButton [

	^ { PEButtonBuilder default buildInputSubmitButtonWithTarget: self inputWindow }
]

{
	#category : #'tool panel',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEPanelBuilder >> toolButtonCollection [

	^ PEButtonBuilder default buildToolButtons: self pixelEditor
]

{
	#category : #'tool panel',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:10'
}
PEPanelBuilder >> toolButtonPanel [
	
	| toolButtons |
	
	toolButtons := self toolButtonCollection.
	self containerDictionary at: #toolButtons put: toolButtons.
	^ { toolButtons }
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'GLE 7/6/2024 14:40'
}
PEPanelBuilder >> widthInput [

	^ { PEUserInputBuilder default inputFieldWithLabel: 'Width:' }
	
]
