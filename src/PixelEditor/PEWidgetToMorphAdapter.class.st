Class {
	#name : #PEWidgetToMorphAdapter,
	#superclass : #PasteUpMorph,
	#category : #PixelEditor
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:25'
}
PEWidgetToMorphAdapter >> clear [
	self removeAllMorphs
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:25'
}
PEWidgetToMorphAdapter >> initialize [
	super initialize.
	self layoutFrame: (LayoutFrame
				fractions: (0 @ 0 rect: 1 @ 1));
		 beSticky;
		 setUpBackground;
		 clipSubmorphs: true.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:26'
}
PEWidgetToMorphAdapter >> setUpBackground [
	| theme |
	theme := Smalltalk at: #SqueakTheme ifAbsent: nil.
	theme
		ifNil: [self color: Preferences defaultWorldColor]
		ifNotNil: [self setAsBackground: theme linenblue]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Corvin 7/2/2024 11:28'
}
PEWidgetToMorphAdapter >> wantsDroppedMorph: aMorph event: evt [ 
	^ false
]
