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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:30'
}
PEPanelBuilder >> colorButtonCollection [

	^ PEButtonBuilder new buildColorButtons: (self containerDictionary at: #canvas)
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
	#'squeak_changestamp' : 'GLE 6/13/2024 15:16'
}
PEPanelBuilder >> createPanelsWithBuilder: aBuilder andPixelEditor: aPixelEditor [

	| panels |
	
	panels := { self createCanvasPanelWithBuilder: aBuilder."+"
		self createColorButtonPanelWithBuilder: aBuilder. "+"
		self createSettingsButtonPanelWithBuilder: aBuilder.
		self createToolPanelWithBuilder: aBuilder }.
	self pixelEditor: aPixelEditor.
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:42'
}
PEPanelBuilder >> createToolPanelWithBuilder: aBuilder [ 

	^ aBuilder pluggablePanelSpec new model: self;
		 children: #toolButtonPanel;
		 frame: (LayoutFrame new rightFraction: 0.33;
			 topFraction: 0.52;
			 leftFraction: 0;
			 bottomFraction: 0.6)
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:34'
}
PEPanelBuilder >> initialize [ 

	super initialize.
	self containerDictionary: Dictionary new;
		canvas
		
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:38'
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
	#'squeak_changestamp' : 'GLE 6/13/2024 14:49'
}
PEPanelBuilder >> toolButtonCollection [

	^ PEButtonBuilder new buildToolButtons: (self containerDictionary at: #canvas)
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
