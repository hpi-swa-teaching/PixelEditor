Class {
	#name : #PEButtonRow,
	#superclass : #PEUI,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'GLE 5/17/2024 17:51'
}
PEButtonRow >> initialize [

	super initialize. 
	self borderWidth: 2;
		borderColor: Color black;
		color: Color transparent
]
