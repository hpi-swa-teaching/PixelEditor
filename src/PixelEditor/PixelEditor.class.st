Class {
	#name : #PixelEditor,
	#superclass : #SystemWindow,
	#category : #PixelEditor
}

{
	#category : #initialization,
	#'squeak_changestamp' : 'Corvin 5/21/2024 11:49'
}
PixelEditor class >> open [
	"open and return instance of pixel editor in squeak world"

	| instance |
	
	instance := PixelEditor new.
	instance openInWorld.
	
	^instance

]

{
	#category : #initialization,
	#'squeak_changestamp' : 'GLE 5/31/2024 11:10'
}
PixelEditor class >> register [
	"register the editor to the apps dropdown"
	
	TheWorldMenu registerOpenCommand: {'PixelEditor'. {PESystemWindow new. #createPixelEditor}}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 5/14/2024 12:20'
}
PixelEditor >> initialize [

	super initialize.
	
	self
		setLabel: 'Pixel Editor'.
]