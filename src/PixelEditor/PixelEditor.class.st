Class {
	#name : #PixelEditor,
	#superclass : #Object,
	#instVars : [
		'playground'
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
	#'squeak_changestamp' : 'Corvin 5/28/2024 11:00'
}
PixelEditor class >> open [
	ToolBuilder open: self new.
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
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:21'
}
PixelEditor >> buildWith: aBuilder [ 
	^ aBuilder build: (aBuilder pluggableWindowSpec new model: self;
			 label: #labelString;
			 extent: self class defaultExtent;
			 children: {self createCanvasPanelWithBuilder: aBuilder};
			 yourself)
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 11:07'
}
PixelEditor >> createCanvasMorph [
	^ (PECanvas new) name: 'canvas'; yourself.
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:20'
}
PixelEditor >> createCanvasPanelWithBuilder: aBuilder [ 
	^ aBuilder pluggablePanelSpec new model: self;
		 children: #playgroundInCollection;
		 frame: (LayoutFrame new leftFraction: 0.33;
			 topFraction: 0;
			 rightFraction: 1;
			 bottomFraction: 0.45)
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:19'
}
PixelEditor >> initialize [
	super initialize.
	self playground: MotuPlayground new.
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:16'
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
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:19'
}
PixelEditor >> open [
	^ ToolBuilder open: self
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:19'
}
PixelEditor >> playground [
	^ playground
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:19'
}
PixelEditor >> playground: aMotuPlayground [
	playground := aMotuPlayground
]

{
	#category : #toolbuilder,
	#'squeak_changestamp' : 'Corvin 6/1/2024 12:22'
}
PixelEditor >> playgroundInCollection [
	^ {self playground}
]

{
	#category : #toolbuilder,
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
