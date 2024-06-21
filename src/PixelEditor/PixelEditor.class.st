Class {
	#name : #PixelEditor,
	#superclass : #Model,
	#instVars : [
		'jsonString',
		'containerDictionary',
		'json'
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
	#'squeak_changestamp' : 'GLE 6/19/2024 21:57'
}
PixelEditor class >> open [

	| instance |
	
	instance := self new.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/19/2024 16:55'
}
PixelEditor class >> openWithJson: aJson [

	| instance |
	
	instance := self new json: aJson.
	ToolBuilder open: instance.
	^ instance
]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 6/20/2024 19:03'
}
PixelEditor class >> register [

	"register the editor to the apps dropdown"
	TheWorldMenu registerOpenCommand: {'PixelEditor'. {PEInputWindow new. #createPixelEditor}}
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
	#'squeak_changestamp' : 'GLE 6/20/2024 00:29'
}
PixelEditor >> formFromCanvas [

	| canvas |
	
	canvas := self containerDictionary at: #canvas.
	canvas bottomRight < canvas layer first bottomRight
		ifTrue: [^ Form fromDisplay: canvas rectangle]
		ifFalse: [^ Form fromDisplay: canvas layer first rectangle]
	
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'GLE 6/19/2024 17:03'
}
PixelEditor >> initialize [

	super initialize.
	self jsonString: String new;
		json: JsonObject new
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 16:55'
}
PixelEditor >> json [
	^ json
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/19/2024 16:58'
}
PixelEditor >> json: aJson [

	json := aJson
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
	#'squeak_changestamp' : 'GLE 6/20/2024 17:59'
}
PixelEditor >> openColorSelector [

	| colorSelector container |
	
	colorSelector := PEColorPaletteBuilder new createColorPalette.
	container := self containerDictionary at: #colorSelector.
	container submorphs 
		ifEmpty: [container addMorphNext: colorSelector]
		ifNotEmpty: [container removeAllMorphs; 
				addMorphNext: colorSelector]
	
	
]

{
	#category : #'lifecycle hooks',
	#'squeak_changestamp' : 'GLE 6/19/2024 16:59'
}
PixelEditor >> panelsFromBuilder: aBuilder [

	| panels |
	
	panels := PEPanelBuilder new.
	self json isEmpty
		ifTrue: [ panels canvas]
		ifFalse:[ panels canvasFromJson: self json].
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
	#'squeak_changestamp' : 'GLE 6/21/2024 09:59'
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
