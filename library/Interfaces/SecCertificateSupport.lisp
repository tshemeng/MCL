(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:SecCertificateSupport.h"
; at Sunday July 2,2006 7:31:43 pm.
; 
;  *  SecCertificateSupport.h
;  *  SecurityHI
;  *
;  *  Copyright (c) 2002 Apple Computer, Inc. All rights reserved.
;  *
;  
; !
; 	@header SecCertificateSupport 
; 	The SecurityHI framework provides APIs that display a human interface for the user. These APIs are specific to the management of certificates, policies, trust and identities.
; 
;     The functions in the SecurityHI framework aren't directly callable using the Carbon stub library for CFM applications. They are, however, directly callable for Mac-O applications. To call them from CFM applications, you still link with the Carbon framework and you can use the following code for calling into the SecChooseIdentity function, for example:
;     
;     void *funcPtr = NULL;
; 	
;     CFBundleRef secHIBundle = NULL;
;     
; 	secHIBundle = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.securityhi"));
;     
; 	if (secHIBundle != NULL)
;     {
;     
; 		funcPtr = CFBundleGetFunctionPointerForName(secHIBundle, CFSTR("SecChooseIdentity"));
;         
; 		if (funcPtr != NULL)
;         
; 			    ; // call into funcPtr with parms to SecChooseIdentity()
;         
; 		CFRelease(secHIBundle);
;     
; 	}
; 

; #if !defined(__SECCERTIFICATESUPPORT__)
(defconstant $__SECCERTIFICATESUPPORT__ 1)
; #define __SECCERTIFICATESUPPORT__ 1

(require-interface "HIToolbox/MacWindows")

(require-interface "Security/SecIdentity")

(require-interface "Security/SecTrust")

(require-interface "Security/cssmtype")

; #if defined(__cplusplus)
#|
extern "C" {
#endif
|#
; !
; 	@enum CommandEventParameters
; 	@abstract Specifies a command event parameter.
; 	@constant typeSecIdentityRef Indicates an identity reference (typeUInt32).
; 

(defconstant $typeSecIdentityRef :|sidy|)
; !
; 	@function SecChooseIdentity
; 	@abstract Displays a list of identities in a panel and allows the user to pick one.
;     @param displayInfo A reference to a string to display in the panel that the user sees.
;     @param identities A reference to an array of identities to choose from. The identities are obtained by calling the SecCreateIdentitySearch and SecIdentitySearchNext functions.
;     @param identityRef On return, a pointer to an identity reference that was chosen by the user.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 

(deftrap-inline "_SecChooseIdentity" 
   ((displayInfo (:pointer :__CFString))
    (identities (:pointer :__CFArray))
    (identityRef (:pointer :SECIDENTITYREF))
   )
   :SInt32
() )
; !
; 	@function SecChooseIdentityAsSheet
;     @abstract Displays a list of identities in a sheet and allows the user to pick one. You obtain the chosen identity from the event after the target event handler is called.
;     @param parentWindow A reference to the window in which the sheet will appear.
;     @param inTarget A reference to the event target to receive the event.
;     @param displayInfo A reference to a string to display in the sheet that the user sees.
;     @param identities A reference to an array of identities to choose from. You call the functions  SecCreateIdentitySearch and SecIdentitySearchNext to obtain the identities.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 

(deftrap-inline "_SecChooseIdentityAsSheet" 
   ((parentWindow (:pointer :OpaqueWindowPtr))
    (inTarget (:pointer :OpaqueEventTargetRef))
    (displayInfo (:pointer :__CFString))
    (identities (:pointer :__CFArray))
   )
   :SInt32
() )
; !
; 	@function SecDisplayCertificate
; 	@abstract Displays a certificate that already exists in a keychain. The user can perform trust editing in this  user interface.
; 	@param certificateRef A reference to the certificate to display.
;     @param keychainList A reference to a list of keychains to assist in the finding of intermediate certificates. Pass NULL to specify the user's default keychain search list.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 

(deftrap-inline "_SecDisplayCertificate" 
   ((certificate (:pointer :OpaqueSecCertificateRef))
    (keychainList (:pointer :__CFArray))
   )
   :SInt32
() )
; !
; 	@function SecDisplayCertificateGroup
;     @abstract Displays the contents of a certificate group with a user interface. This user interface allows the user to change the trust decisions for these certificates.
;     @param certificates A pointer to the certificate group to display.
;     @param keychainList A reference to a list of keychains to assist in the finding of intermediate certificates. Pass NULL to specify the user's default keychain search list.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 

(deftrap-inline "_SecDisplayCertificateGroup" 
   ((certificates (:pointer :CSSM_CERTGROUP))
    (keychainList (:pointer :__CFArray))
   )
   :SInt32
() )
; !
; 	@function SecEditTrust
; 	@abstract Edits the trust information of a SecTrust object in a panel.
; 	@param displayInfo A reference to a string to display in the edit trust panel that the user sees. Pass NULL for a default-provided string.
;     @param trust The reference to a trust object in which to edit the trust.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 	@discussion  You must call the SecTrustEvaluate function prior to editing the trust information of the trust object. Pass in a string with arbitrary encoding for display purposes in the edit trust panel. For example, the user interface can show what went wrong during a verify or it can indicate that a certificate has expired. The user can edit the trust decisions at this time. If any certificate that is involved in the verification doesn't exist in a keychain, it can be added to a keychain by the user. 
; 

(deftrap-inline "_SecEditTrust" 
   ((displayInfo (:pointer :__CFString))
    (trust (:pointer :OpaqueSecTrustRef))
   )
   :SInt32
() )
; !
; 	@function SecEditTrustAsSheet
; 	@abstract Edits the trust information of a SecTrust object in a sheet. When the target event handler is called, you can see if the user clicked Cancel or OK.
;     @param parentWindow A reference to the window in which the sheet appears.
;     @param inTarget A reference to the event target to receive the event.
;     @param displayInfo A reference to a string to display in the Edit Trust sheet that the user sees. Pass NULL for a default-provided string.
;     @param trust A reference to the trust object in which to edit the trust.
; 	@result A result code.  See "Security Error Codes" (SecBase.h).
; 

(deftrap-inline "_SecEditTrustAsSheet" 
   ((parentWindow (:pointer :OpaqueWindowPtr))
    (inTarget (:pointer :OpaqueEventTargetRef))
    (displayInfo (:pointer :__CFString))
    (trust (:pointer :OpaqueSecTrustRef))
   )
   :SInt32
() )

; #if defined(__cplusplus)
#|
}
#endif
|#

; #endif /* ! __SECCERTIFICATESUPPORT__ */


(provide-interface "SecCertificateSupport")