Class {
	#name : #PixelEditorSettingsTest,
	#superclass : #PixelEditorTest,
	#category : #'PixelEditor-Tests'
}

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:53'
}
PixelEditorSettingsTest >> getSaveButton [

	self getSettingsButtonContainer submorphs do: 
		[:each | each basicType = #PESaveButton ifTrue: [ ^ each ]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'GLE 6/21/2024 16:47'
}
PixelEditorSettingsTest >> getSettingsButtonContainer [

	^ self pixelEditor containerDictionary at: #settingsButtons
]

{
	#category : #testing,
	#'squeak_changestamp' : 'GLE 7/11/2024 11:53'
}
PixelEditorSettingsTest >> testWindowSaving [
	
	self createPixelEditor.
	self getSaveButton addToJson;
		writeFile: 'SavingTest' stream: (StandardFileStream forceNewFileNamed: 'SavingTest').
	self assert: (StandardFileStream isAFileNamed: (StandardFileStream fullName: 'SavingTest')).
	self abandonPixelEditor
]
