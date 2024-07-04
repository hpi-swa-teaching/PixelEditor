Class {
	#name : #PEPanelBuilder,
	#superclass : #PEBuilder,
	#instVars : [
		'containerDictionary',
		'pixelEditor'
	],
	#classInstVars : [
		'panelBuilder'
	],
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 12:07'
}
PEPanelBuilder class >> default [

	panelBuilder
		ifNil: [ panelBuilder := PEPanelBuilder new ].
	^ panelBuilder
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:18'
}
PEPanelBuilder >> containerDictionary: anObject [

	containerDictionary := anObject
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
	#'squeak_changestamp' : 'LW 7/4/2024 11:42'
}
PEPanelBuilder >> createHeightPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new 
		model: self;
		children: (self heightInput);
		frame: (LayoutFrame new 
			rightFraction: 0.5;
			topFraction: 0.2;
			leftFraction: 0;
			bottomFraction: 0.6)
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'LW 7/4/2024 11:33'
}
PEPanelBuilder >> createInputPanelsWithBuilder: aBuilder [

	| panels |

	panels := { self createHeightPanelWithBuilder: aBuilder.}.
		
	^ panels
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'LW 7/4/2024 11:34'
}
PEPanelBuilder >> createInputWindowPanelWithBuilder: aBuilder andModel: anInputWindow [

	^ aBuilder build: (aBuilder pluggableWindowSpec new 
		model: anInputWindow;
	 	label: #labelString;
		extent: self inputWindowExtent;
		children: (self createInputPanelsWithBuilder: aBuilder);
		yourself).
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 16:14'
}
PEPanelBuilder >> createWindowPanelWithBuilder: aBuilder andModel: aPixelEditor [

	self pixelEditor: aPixelEditor.
	^ aBuilder build: (aBuilder pluggableWindowSpec new 
		model: aPixelEditor;
	 	label: #labelString;
		extent: self pixelEditorExtent;
		children: (self createPanelsWithBuilder: aBuilder);
		yourself).
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'LW 7/4/2024 11:26'
}
PEPanelBuilder >> heightInput [

	^ { PETextInputMorphWithLabel new setLabel: 'Height:' }
	
]

{
	#category : #'input panels',
	#'squeak_changestamp' : 'LW 7/4/2024 11:19'
}
PEPanelBuilder >> heightInputAndLabel: aBuilder [

	^ { self }
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
	#category : #'as yet unclassified',
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:37'
}
PEPanelBuilder >> pixelEditor: anObject [

	pixelEditor := anObject
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 16:10'
}
PEPanelBuilder >> pixelEditorExtent [

	 ^ 800 @ 600
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
