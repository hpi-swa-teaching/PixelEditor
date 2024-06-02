Class {
	#name : #PEPluggableTextMorph,
	#superclass : #PluggableTextMorph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 18:26'
}
PEPluggableTextMorph >> contents: aString [

	super contents: aString
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GT 5/20/2024 15:18'
}
PEPluggableTextMorph >> initialize [

	super initialize.
	self textMorph contents:''
]
