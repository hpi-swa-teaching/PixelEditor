Class {
	#name : #PixelEditor,
	#superclass : #Model,
	#instVars : [
		'jsonString',
		'containerDictionary'
	],
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/16/2024 19:02'
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
	#'squeak_changestamp' : 'GLE 6/11/2024 14:02'
}
PixelEditor class >> open [

	| instance |
	
	instance := self new.
	PEBuilder setUpDirectories.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/13/2024 16:27'
}
PixelEditor class >> openWithJson: aJson [

	| instance |
	
	instance := self new jsonString: aJson.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GT 6/10/2024 18:11'
}
PixelEditor class >> register [

	"register the editor to the apps dropdown"
	TheWorldMenu registerOpenCommand: {'PixelEditor'. {PESystemWindow new. #createPixelEditor}}
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'GLE 6/17/2024 19:18'
}
PixelEditor >> buildWith: aBuilder [ 
	
	| builder |
	
	builder := aBuilder 
		build: (aBuilder pluggableWindowSpec new model: self;
	 	label: #labelString;
		extent: self class defaultExtent;
		children: (self panelsFromBuilder: aBuilder);
		yourself).
	self systemWindow addMorph: (PERezisingAgent new model: self).
	^ builder
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 14:53'
}
PixelEditor >> containerDictionary [

	^ containerDictionary
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/16/2024 20:29'
}
PixelEditor >> containerDictionary: aDictionary [

	containerDictionary := aDictionary.
	
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/17/2024 15:48'
}
PixelEditor >> formFromCanvas [

	^ Form fromDisplay: (self containerDictionary at: #canvas) rectangle
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'GLE 6/13/2024 15:29'
}
PixelEditor >> initialize [

	super initialize.
	self jsonString: String new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 15:51'
}
PixelEditor >> jsonString [

	^ jsonString
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/13/2024 15:31'
}
PixelEditor >> jsonString: aJsonString [

	jsonString := aJsonString
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
	#'squeak_changestamp' : 'GLE 6/18/2024 10:31'
}
PixelEditor >> openColorSelector [

	| colorSelector container |
	
	colorSelector := PEColorSelectorBuilder new createColorSelector.
	container := self containerDictionary at: #colorSelector.
	container submorphs 
		ifEmpty: [container addMorphNext: colorSelector]
		ifNotEmpty: [container removeAllMorphs; 
				addMorphNext: colorSelector]
	
	
]

{
	#category : #'lifecycle hooks',
	#'squeak_changestamp' : 'GLE 6/13/2024 16:06'
}
PixelEditor >> panelsFromBuilder: aBuilder [

	| panels |
	
	panels := PEPanelBuilder new.
	self jsonString = ''
		ifTrue: [ panels canvas]
		ifFalse:[ panels canvasFromJson: self jsonString].
	^ panels createPanelsWithBuilder: aBuilder andPixelEditor: self
	
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
	#'squeak_changestamp' : 'GLE 6/16/2024 20:28'
}
PixelEditor >> update [

	self containerDictionary do: [:each | each update]
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
