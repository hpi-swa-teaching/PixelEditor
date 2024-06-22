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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/22/2024 13:46'
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
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 20:04'
}
PEPanelBuilder >> createPanelsWithBuilder: aBuilder andPixelEditor: aPixelEditor [

	| panels |
	
	self pixelEditor: aPixelEditor.
	panels := { self createCanvasPanelWithBuilder: aBuilder.
		self createColorButtonPanelWithBuilder: aBuilder.
		self createSettingsButtonPanelWithBuilder: aBuilder.
		self createToolPanelWithBuilder: aBuilder.
		self createColorSelectorPanelWithBuilder: aBuilder }.
	aPixelEditor containerDictionary: self containerDictionary.
	^ panels
	
]

{
	#category : #'as yet unclassified',
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
	#category : #'as yet unclassified',
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
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 16:03'
}
PEPanelBuilder >> initialize [ 

	super initialize.
	self containerDictionary: Dictionary new
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
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEPanelBuilder >> settingsButtonCollection [

	^ PEButtonBuilder default buildSettingsButtons: self pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:11'
}
PEPanelBuilder >> settingsButtonPanel [
	
	| settingsButtons |
	
	settingsButtons := self settingsButtonCollection.
	self containerDictionary at: #settingsButtons put: settingsButtons.
	^ { settingsButtons }
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:19'
}
PEPanelBuilder >> toolButtonCollection [

	^ PEButtonBuilder default buildToolButtons: self pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/20/2024 11:10'
}
PEPanelBuilder >> toolButtonPanel [
	
	| toolButtons |
	
	toolButtons := self toolButtonCollection.
	self containerDictionary at: #toolButtons put: toolButtons.
	^ { toolButtons }
]
