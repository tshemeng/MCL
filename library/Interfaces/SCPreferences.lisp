(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:SCPreferences.h"
; at Sunday July 2,2006 7:31:32 pm.
; 
;  * Copyright (c) 2000-2003 Apple Computer, Inc. All rights reserved.
;  *
;  * @APPLE_LICENSE_HEADER_START@
;  * 
;  * This file contains Original Code and/or Modifications of Original Code
;  * as defined in and that are subject to the Apple Public Source License
;  * Version 2.0 (the 'License'). You may not use this file except in
;  * compliance with the License. Please obtain a copy of the License at
;  * http://www.opensource.apple.com/apsl/ and read it before using this
;  * file.
;  * 
;  * The Original Code and all software distributed under the License are
;  * distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
;  * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
;  * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
;  * FITNESS FOR A PARTICULAR PURPOSE, QUIET ENJOYMENT OR NON-INFRINGEMENT.
;  * Please see the License for the specific language governing rights and
;  * limitations under the License.
;  * 
;  * @APPLE_LICENSE_HEADER_END@
;  
; #ifndef _SCPREFERENCES_H
; #define _SCPREFERENCES_H

(require-interface "sys/cdefs")

(require-interface "CoreFoundation/CoreFoundation")

(require-interface "SystemConfiguration/SCDynamicStore")
; !
; 	@header SCPreferences
; 	The SCPreferencesXXX() APIs allow an application to load and
; 	store XML configuration data in a controlled manner and provide
; 	the necessary notifications to other applications that need to
; 	be aware of configuration changes.
; 
; 	The stored XML configuration data is accessed using a prefsID. A
; 	NULL value indicates that the default system preferences are to
; 	be accessed.
; 	A string which starts with a leading "/" character specifies the
; 	path to the file containing te preferences to be accessed.
; 	A string which does not start with a leading "/" character
; 	specifies a file relative to the default system preferences
; 	directory.
;  
; !
; 	@typedef SCPreferencesRef
; 	@discussion This is the handle to an open "session" for
; 		accessing system configuration preferences.
;  

(def-mactype :SCPreferencesRef (find-mactype '(:pointer :__SCPreferences)))
; !
; 	@function SCPreferencesGetTypeID
; 	Returns the type identifier of all SCPreferences instances.
;  

(deftrap-inline "_SCPreferencesGetTypeID" 
   (
   )
   :UInt32
() )
; !
; 	@function SCPreferencesCreate
; 	@discussion Initiates access to the per-system set of configuration
; 		preferences.
; 	@param allocator ...
; 	@param name A string that describes the name of the calling
; 		process.
; 	@param prefsID A string that identifies the name of the
; 		group of preferences to be accessed/updated.
; 	@result prefs A pointer to memory that will be filled with an
; 		SCPreferencesRef handle to be used for all subsequent requests.
; 		If a session cannot be established, the contents of
; 		memory pointed to by this parameter are undefined.
;  

(deftrap-inline "_SCPreferencesCreate" 
   ((allocator (:pointer :__CFAllocator))
    (name (:pointer :__CFString))
    (prefsID (:pointer :__CFString))
   )
   (:pointer :__SCPreferences)
() )
; !
; 	@function SCPreferencesLock
; 	@discussion Locks access to the configuration preferences.
; 
; 	This function obtains exclusive access to the configuration
; 	preferences associated with this prefsID. Clients attempting
; 	to obtain exclusive access to the preferences will either receive
; 	an kSCStatusPrefsBusy error or block waiting for the lock to be
; 	released.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@param wait A boolean flag indicating whether the calling process
; 		should block waiting for another process to complete its update
; 		operation and release its lock.
; 	@result TRUE if the lock was obtained; FALSE if an error occurred.
;  

(deftrap-inline "_SCPreferencesLock" 
   ((session (:pointer :__SCPreferences))
    (wait :Boolean)
   )
   :Boolean
() )
; !
; 	@function SCPreferencesCommitChanges
; 	@discussion Commits changes made to the configuration preferences to
; 		persitent storage.
; 
; 		This function commits any changes to permanent storage. An
; 		implicit call to SCPreferencesLock/SCPreferencesUnlock will
; 		be made if exclusive access has not already been established.
; 
; 		Note:  This routine commits changes to persistent storage.
; 		Call SCPreferencesApplyChanges() to apply the changes
; 		to the running system.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@result TRUE if the lock was obtained; FALSE if an error occurred.
;  

(deftrap-inline "_SCPreferencesCommitChanges" 
   ((session (:pointer :__SCPreferences))
   )
   :Boolean
() )
; !
; 	@function SCPreferencesApplyChanges
; 	@discussion Requests that the currently stored configuration
; 		preferences be applied to the active configuration.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@result TRUE if the lock was obtained; FALSE if an error occurred.
;  

(deftrap-inline "_SCPreferencesApplyChanges" 
   ((session (:pointer :__SCPreferences))
   )
   :Boolean
() )
; !
; 	@function SCPreferencesUnlock
; 	@discussion Releases exclusive access to the configuration preferences.
; 
; 		This function releases the exclusive access "lock" for this prefsID.
; 		Other clients will be now be able to establish exclusive access to
; 		the preferences.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@result TRUE if the lock was obtained; FALSE if an error occurred.
;  

(deftrap-inline "_SCPreferencesUnlock" 
   ((session (:pointer :__SCPreferences))
   )
   :Boolean
() )
; !
; 	@function SCPreferencesGetSignature
; 	@discussion Returns a sequence of bytes that can be used to determine
; 		if the saved configuration preferences have changed.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@param signature A pointer to a CFDataRef that will reflect
; 		the signature of the configuration preferences at the time
; 		of the call to SCPreferencesCreate().
; 	@result A CFDataRef that reflects the signature of the configuration
; 		preferences at the time of the call to SCPreferencesCreate().
;  

(deftrap-inline "_SCPreferencesGetSignature" 
   ((session (:pointer :__SCPreferences))
   )
   (:pointer :__CFData)
() )
; !
; 	@function SCPreferencesCopyKeyList
; 	@discussion Returns an array of currently defined preference keys.
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@result The list of keys.  You must release the returned value.
;  

(deftrap-inline "_SCPreferencesCopyKeyList" 
   ((session (:pointer :__SCPreferences))
   )
   (:pointer :__CFArray)
() )
; !
; 	@function SCPreferencesGetValue
; 	@discussion Returns the data associated with a preference key.
; 
; 		This function retrieves data associated with a key for the prefsID.
; 
; 		Note:  You could read stale data and not know it, unless you
; 		first call SCPreferencesLock().
; 	@param session An SCPreferencesRef handle that should be used for
; 		all API calls.
; 	@param key The preference key to be returned.
; 	@result The value associated with the specified preference key; If no
; 		value was located, NULL is returned.
;  

(deftrap-inline "_SCPreferencesGetValue" 
   ((session (:pointer :__SCPreferences))
    (key (:pointer :__CFString))
   )
   (:pointer :void)
() )
; !
; 	@function SCPreferencesAddValue
; 	@discussion Adds data for a preference key.
; 
; 	This function associates new data with the specified key. In order
; 	to commit these changes to permanent storage a call must be made to
; 	SCPreferencesCommitChanges().
; 	@param session The SCPreferencesRef handle that should be used to
; 		communicate with the APIs.
; 	@param key The preference key to be updated.
; 	@param value The CFPropertyListRef object containing the
; 		value to be associated with the specified preference key.
; 	@result TRUE if the value was added; FALSE if the key already exists or
; 		if an error occurred.
;  

(deftrap-inline "_SCPreferencesAddValue" 
   ((session (:pointer :__SCPreferences))
    (key (:pointer :__CFString))
    (value (:pointer :void))
   )
   :Boolean
() )
; !
; 	@function SCPreferencesSetValue
; 	@discussion Updates the data associated with a preference key.
; 
; 	This function adds or replaces the value associated with the
; 	specified key. In order to commit these changes to permanent
; 	storage a call must be made to SCPreferencesCommitChanges().
; 	@param session The SCPreferencesRef handle that should be used to
; 		communicate with the APIs.
; 	@param key The preference key to be updated.
; 	@param value The CFPropertyListRef object containing the
; 		data to be associated with the specified preference key.
; 	@result TRUE if the value was set; FALSE if an error occurred.
;  

(deftrap-inline "_SCPreferencesSetValue" 
   ((session (:pointer :__SCPreferences))
    (key (:pointer :__CFString))
    (value (:pointer :void))
   )
   :Boolean
() )
; !
; 	@function SCPreferencesRemoveValue
; 	@discussion Removes the data associated with a preference key.
; 
; 	This function removes the data associated with the specified
; 	key. In order to commit these changes to permanent storage a
; 	call must be made to SCPreferencesCommitChanges().
; 	@param session The SCPreferencesRef handle that should be used to
; 		communicate with the APIs.
; 	@param key The preference key to be removed.
; 	@result TRUE if the value was removed; FALSE if the key did not exist or
; 		if an error occurred.
;  

(deftrap-inline "_SCPreferencesRemoveValue" 
   ((session (:pointer :__SCPreferences))
    (key (:pointer :__CFString))
   )
   :Boolean
() )

; #endif /* _SCPREFERENCES_H */


(provide-interface "SCPreferences")