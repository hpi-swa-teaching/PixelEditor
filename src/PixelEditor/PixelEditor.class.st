Class {
	#name : #PixelEditor,
	#superclass : #Object,
	#instVars : [
		'window'
	],
	#category : #PixelEditor
}

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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 5/28/2024 11:01'
}
PixelEditor >> buildWith: builder [ 
	| newMorph |
	newMorph := builder build: (builder pluggableWindowSpec new model: self;
					 label: 'Pixel Editor';
					 children: {};
					 closeAction: #onClose;
					 minimumExtent: 550 @ 400).
	""
	"self
	
	

	createCommandBarWithBuilder:
	builder "
	""
	^ newMorph
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'Corvin 5/28/2024 11:00'
}
PixelEditor >> initialize [
	super initialize.
]

{
	#category : #'lifecycle hooks',
	#'squeak_changestamp' : 'Corvin 5/28/2024 11:02'
}
PixelEditor >> onClose [
	"TODO"
	^ ''
]
