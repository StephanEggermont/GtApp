Class {
	#name : #GAApp,
	#superclass : #Object,
	#instVars : [
		'model',
		'element'
	],
	#category : #GtApp
}

{ #category : #accessing }
GAApp class >> open [
	^self new open 
]

{ #category : #accessing }
GAApp >> model [
	^ model ifNil: [model := GAModel default.
		model announcer when: GAEntityChanged send: #update:  to: self.
		model]
]

{ #category : #accessing }
GAApp >> model: anObject [
	model := anObject
]

{ #category : #accessing }
GAApp >> open [
	| space |
	self windowElement.
	space := BlSpace new
			extent: 300 @ 200;
			title: 'Application'.
	space root addChild: element.
	space when: BlSpaceClosedEvent do: [self model announcer unsubscribe: self].
	space show
]

{ #category : #'as yet unclassified' }
GAApp >> update: theModelChanged [

]

{ #category : #accessing }
GAApp >> windowElement [
	element := BrVerticalPane new.
	element
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	element margin: (BlInsets all: 5)
]
