Class {
	#name : #PixelEditorSettingsTest,
	#superclass : #PixelEditorTest,
	#category : #'PixelEditor-Tests'
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:49'
}
PixelEditorSettingsTest >> getSaveButton [

	self getSettingsButtonContainer submorphs do: 
		[:each | each basicType = #PESaveButton ifTrue: [^ each]].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:47'
}
PixelEditorSettingsTest >> getSettingsButtonContainer [

	^ self pixelEditor containerDictionary at: #settingsButtons
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 6/21/2024 16:56'
}
PixelEditorSettingsTest >> testWindowSaving [
	
	self createPixelEditor.
	self getSaveButton addToJson;
		writeFile: 'SavingTest' stream: (StandardFileStream forceNewFileNamed: 'SavingTest').
	self assert: (StandardFileStream isAFileNamed: (StandardFileStream fullName: 'SavingTest')).
	self abandonPixelEditor.
]
