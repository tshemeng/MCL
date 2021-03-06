(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:NSDrawer.h"
; at Sunday July 2,2006 7:30:46 pm.
; 
;         NSDrawer.h
;         Application Kit
;         Copyright (c) 1999-2003, Apple Computer, Inc.
;         All rights reserved.
; 

; #import <CoreFoundation/CFDate.h>

; #import <CoreFoundation/CFRunLoop.h>

; #import <Foundation/NSObject.h>

; #import <Foundation/NSGeometry.h>

; #import <AppKit/AppKitDefines.h>

; #import <AppKit/NSResponder.h>

; #import <AppKit/NSWindow.h>
(def-mactype :_NSDrawerState (find-mactype ':sint32))

(defconstant $NSDrawerClosedState 0)
(defconstant $NSDrawerOpeningState 1)
(defconstant $NSDrawerOpenState 2)
(defconstant $NSDrawerClosingState 3)
(def-mactype :NSDrawerState (find-mactype ':SINT32))
#| @INTERFACE 
NSDrawer : NSResponder
{
    
    NSDrawerState 	_drawerState;
    NSDrawerState	_drawerNextState;
    NSRectEdge 		_drawerEdge;
    NSRectEdge 		_drawerNextEdge;
    NSRectEdge 		_drawerPreferredEdge;
    float 		_drawerPercent;
    float 		_drawerPercentSaved;
    float		_drawerLeadingOffset;
    float		_drawerTrailingOffset;
    NSLock 		*_drawerLock;
    NSWindow		*_drawerWindow;
    NSWindow 		*_drawerParentWindow;
    NSWindow		*_drawerNextParentWindow;
    NSString		*_drawerSaveName;
    CFAbsoluteTime 	_drawerStartTime;
    CFTimeInterval 	_drawerTotalTime;
    CFRunLoopRef 	_drawerLoop;
    CFRunLoopTimerRef 	_drawerTimer;
    id 			_drawerDelegate;
    unsigned int	_drawerFlags;
    CFRunLoopObserverRef _drawerObserver;
}

- (id)initWithContentSize:(NSSize)contentSize preferredEdge:(NSRectEdge)edge;

- (void)setParentWindow:(NSWindow *)parent;
- (NSWindow *)parentWindow;
- (void)setContentView:(NSView *)aView;
- (NSView *)contentView;
- (void)setPreferredEdge:(NSRectEdge)edge;
- (NSRectEdge)preferredEdge;
- (void)setDelegate:(id)anObject;
- (id)delegate;

- (void)open;
- (void)openOnEdge:(NSRectEdge)edge;
- (void)close;

- (void)open:(id)sender;
- (void)close:(id)sender;
- (void)toggle:(id)sender;

- (int)state;
- (NSRectEdge)edge;

- (void)setContentSize:(NSSize)size;
- (NSSize)contentSize;
- (void)setMinContentSize:(NSSize)size;
- (NSSize)minContentSize;
- (void)setMaxContentSize:(NSSize)size;
- (NSSize)maxContentSize;

- (void)setLeadingOffset:(float)offset;
- (float)leadingOffset;
- (void)setTrailingOffset:(float)offset;
- (float)trailingOffset;

|#
#| @INTERFACE 
NSWindow(Drawers)

- (NSArray *)drawers;

|#
#| @INTERFACE 
NSObject(NSDrawerNotifications)
- (void)drawerWillOpen:(NSNotification *)notification;
- (void)drawerDidOpen:(NSNotification *)notification;
- (void)drawerWillClose:(NSNotification *)notification;
- (void)drawerDidClose:(NSNotification *)notification;
|#
#| @INTERFACE 
NSObject(NSDrawerDelegate)
- (BOOL)drawerShouldOpen:(NSDrawer *)sender;
- (BOOL)drawerShouldClose:(NSDrawer *)sender;
- (NSSize)drawerWillResizeContents:(NSDrawer *)sender toSize:(NSSize)contentSize;
|#
;  Notifications 
(def-mactype :NSDrawerWillOpenNotification (find-mactype '(:pointer :NSString)))
(def-mactype :NSDrawerDidOpenNotification (find-mactype '(:pointer :NSString)))
(def-mactype :NSDrawerWillCloseNotification (find-mactype '(:pointer :NSString)))
(def-mactype :NSDrawerDidCloseNotification (find-mactype '(:pointer :NSString)))
;  Note that the size of a drawer is determined partly by its content, partly by
; the size of its parent window.  The size in the direction of the drawer's motion
; is determined by the drawer's content size, and may be manually changed by the
; user within the limits determined by the min and max content sizes (programmatic
; changes are not so limited.)  The size in the transverse direction is determined
; by the size of the parent window, combined with the drawer's leading and trailing
; offsets.  For finer control over the size of the drawer in the transverse direction,
; listen for the parent window's NSWindowDidResizeNotification and then reset the
; leading and/or trailing offsets accordingly.  The one overriding restriction is
; that a drawer can never be larger than its parent, and the sizes of both drawer
; and parent are constrained by this. 

(provide-interface "NSDrawer")