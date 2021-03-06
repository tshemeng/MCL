(in-package :TRAPS)
; Generated from #P"macintosh-hd:hd3:CInterface Translator:Source Interfaces:NSBundle.h"
; at Sunday July 2,2006 7:30:36 pm.
; 	NSBundle.h
; 	Copyright (c) 1994-2003, Apple, Inc. All rights reserved.
; 

; #import <Foundation/NSObject.h>
;  Because NSBundle caches allocated instances, subclasses should be prepared
;    to receive an already initialized object back from [super initWithPath:] 
#| @INTERFACE 
NSBundle : NSObject {
private
    unsigned int	_flags;
    id		        _cfBundle;
    void		*_reserved5;
    Class		_principalClass;
    void		*_tmp1;
    void		*_tmp2;
    void		*_reserved1;
    void		*_reserved0;
}

+ (NSBundle *)mainBundle;
+ (NSBundle *)bundleWithPath:(NSString *)path;
- (id)initWithPath:(NSString *)path;

+ (NSBundle *)bundleForClass:(Class)aClass;
+ (NSBundle *)bundleWithIdentifier:(NSString *)identifier;

+ (NSArray *)allBundles;
+ (NSArray *)allFrameworks;

- (BOOL)load;
#if MAC_OS_X_VERSION_10_2 <= MAC_OS_X_VERSION_MAX_ALLOWED
- (BOOL)isLoaded;
#endif

- (NSString *)bundlePath;
- (NSString *)resourcePath;
- (NSString *)executablePath;
- (NSString *)pathForAuxiliaryExecutable:(NSString *)executableName;

- (NSString *)privateFrameworksPath;
- (NSString *)sharedFrameworksPath;
- (NSString *)sharedSupportPath;
- (NSString *)builtInPlugInsPath;

- (NSString *)bundleIdentifier;

- (Class)classNamed:(NSString *)className;

- (Class)principalClass;

+ (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)path;
- (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext;
- (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSString *)pathForResource:(NSString *)name ofType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;

+ (NSArray *)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSArray *)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath;
- (NSArray *)pathsForResourcesOfType:(NSString *)ext inDirectory:(NSString *)subpath forLocalization:(NSString *)localizationName;

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;

- (NSDictionary *)infoDictionary;
#if MAC_OS_X_VERSION_10_2 <= MAC_OS_X_VERSION_MAX_ALLOWED
- (NSDictionary *)localizedInfoDictionary;
- (id)objectForInfoDictionaryKey:(NSString *)key;
#endif

- (NSArray *)localizations;
- (NSArray *)preferredLocalizations;
#if MAC_OS_X_VERSION_10_2 <= MAC_OS_X_VERSION_MAX_ALLOWED
- (NSString *)developmentLocalization;
#endif

+ (NSArray *)preferredLocalizationsFromArray:(NSArray *)localizationsArray;
#if MAC_OS_X_VERSION_10_2 <= MAC_OS_X_VERSION_MAX_ALLOWED
+ (NSArray *)preferredLocalizationsFromArray:(NSArray *)localizationsArray forPreferences:(NSArray *)preferencesArray;
#endif

|#
; #define NSLocalizedString(key, comment) 	    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]
; #define NSLocalizedStringFromTable(key, tbl, comment) 	    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:(tbl)]
; #define NSLocalizedStringFromTableInBundle(key, tbl, bundle, comment) 	    [bundle localizedStringForKey:(key) value:@"" table:(tbl)]
; #define NSLocalizedStringWithDefaultValue(key, tbl, bundle, val, comment) 	    [bundle localizedStringForKey:(key) value:(val) table:(tbl)]
(def-mactype :NSBundleDidLoadNotification (find-mactype '(:pointer :NSString)))
(def-mactype :NSLoadedClasses (find-mactype '(:pointer :NSString)))
;  notification key

(provide-interface "NSBundle")