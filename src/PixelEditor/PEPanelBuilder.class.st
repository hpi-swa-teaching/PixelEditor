Class {
	#name : #PEPanelBuilder,
	#superclass : #PEBuilder,
	#instVars : [
		'containerDictionary',
		'pixelEditor'
	],
	#category : #PixelEditor
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:27'
}
PEPanelBuilder >> canvas [

	self containerDictionary at: #canvas put: PECanvasBuilder new buildCanvas
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
	#'squeak_changestamp' : 'GLE 6/13/2024 16:01'
}
PEPanelBuilder >> canvasFromJson: aJsonString [

	self containerDictionary at: #canvas put: (PECanvasBuilder new buildCanvasFromJson: aJsonString)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 21:06'
}
PEPanelBuilder >> colorButtonCollection [

	^ PEButtonBuilder new 
		buildColorButtons: (self containerDictionary at: #canvas) withTarget: self pixelEditor
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:47'
}
PEPanelBuilder >> colorButtonPanel [
	
	| colorButtons |
	
	colorButtons := PEButtonRow new addMorphCollection: self colorButtonCollection.
	self containerDictionary at: #colorButtons put: colorButtons.
	^ { colorButtons }
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 20:05'
}
PEPanelBuilder >> colorSelectorPanel [

	| colorSelector |
	
	colorSelector := PEButtonRow new. 
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
	#'squeak_changestamp' : 'GLE 6/13/2024 13:57'
}
PEPanelBuilder >> createCanvasPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #canvasAsCollection;
		 frame: (LayoutFrame new leftFraction: 0.33;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/13/2024 14:47'
}
PEPanelBuilder >> createColorButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #colorButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
			 topFraction: 0.66;
			 leftFraction: 0;
			 bottomFraction: 1)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 20:04'
}
PEPanelBuilder >> createColorSelectorPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #colorSelectorPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:31'
}
PEPanelBuilder >> createSettingsButtonPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #settingsButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
			 topFraction: 0;
			 leftFraction: 0;
			 bottomFraction: 0.2)
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 19:58'
}
PEPanelBuilder >> createToolPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #toolButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
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
	#'squeak_changestamp' : 'GLE 6/13/2024 16:21'
}
PEPanelBuilder >> settingsButtonCollection [

	^ PEButtonBuilder new buildSettingsButtons: self pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/13/2024 14:33'
}
PEPanelBuilder >> settingsButtonPanel [
	
	| settingsButtons |
	
	settingsButtons := PEButtonRow new addMorphCollection: self settingsButtonCollection.
	self containerDictionary at: #settingsButtons put: settingsButtons.
	^ { settingsButtons }
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/17/2024 20:21'
}
PEPanelBuilder >> toolButtonCollection [

	^ PEButtonBuilder new buildToolButtons: (self containerDictionary at: #canvas) for: self pixelEditor
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/13/2024 14:44'
}
PEPanelBuilder >> toolButtonPanel [
	
	| toolButtons |
	
	toolButtons := PEButtonRow new addMorphCollection: self toolButtonCollection.
	self containerDictionary at: #toolButtons put: toolButtons.
	^ { toolButtons }
]
