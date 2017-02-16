//
//  AudioFileGlobalProperty.swift
//  SwiftCoreAudio
//
//  Created by doof nugget on 1/18/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import AudioToolbox
import LVGUtilities

// MARK: Audio File Services Global Properties

/**
 An enum with cases that correspond to the global property constants defined by
 Audio File Services.
 
 For more information about these properties and the constants that identify
 them, see the official [Apple Audio File Services documentation](https://developer.apple.com/library/mac/documentation/MusicAudio/Reference/AudioFileConvertRef/index.html#//apple_ref/doc/uid/TP40006072).
 */
public enum AudioFileGlobalProperty: CodedPropertyType {
    
    /// The equivalent of kAudioFileGlobalInfo_AllExtensions
    case allExtensions
    /// The equivalent of kAudioFileGlobalInfo_AllHFSTypeCodes
    case allHFSTypeCodes
    /// The equivalent of kAudioFileGlobalInfo_AllMIMIETypes
    case allMIMETypes
    /// The equivalent of kAudioFileGlobalInfo_AllUTIs
    case allUTIs
    /// The equivalent of kAudioFileGlobalInfo_AvailableFormatIDs
    case availableFormatIDs
    /// The equivalent of kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat
    case availableStreamDescriptionsForFormat
    /// The equivalent of kAudioFileGlobalInfo_ExtensionsForType
    case extensionsForType
    /// The equivalent of kAudioFileGlobalInfo_FileTypeName
    case fileTypeName
    /// The equivalent of kAudioFileGlobalInfo_HFSTypeCodesForType
    case hfsTypeCodesForType
    /// The equivalent of kAudioFileGlobalInfo_MIMETypesForType
    case mimeTypesForType
    /// The equivalent of kAudioFileGlobalInfo_ReadableTypes
    case readableTypes
    /// The equivalent of kAudioFileGlobalInfo_TypesForExtension
    case typesForExtension
    /// The equivalent of kAudioFileGlobalInfo_TypesForHFSTypeCode
    case typesForHFSTypeCode
    /// The equivalent of kAudioFileGlobalInfo_TypesForMIMEType
    case typesForMIMEType
    /// The equivalent of kAudioFileGlobalInfo_TypesForUTI
    case typesForUTI
    /// The equivalent of kAudioFileGlobalInfo_UTIsForType
    case utisForType
    /// The equivalent of kAudioFileGlobalInfo_WritableTypes
    case writableTypes
    
    /// Initialize an `AudioFileGlobalProperty` from a property ID constant
    /// defined in Audio File Services.
    public init?(code: UInt32) {
        switch code {
        case kAudioFileGlobalInfo_AllExtensions:                            self = .allExtensions
        case kAudioFileGlobalInfo_AllHFSTypeCodes:                          self = .allHFSTypeCodes
        case kAudioFileGlobalInfo_AllMIMETypes:                             self = .allMIMETypes
        case kAudioFileGlobalInfo_AllUTIs:                                  self = .allUTIs
        case kAudioFileGlobalInfo_AvailableFormatIDs:                       self = .availableFormatIDs
        case kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat:     self = .availableStreamDescriptionsForFormat
        case kAudioFileGlobalInfo_ExtensionsForType:                        self = .extensionsForType
        case kAudioFileGlobalInfo_FileTypeName:                             self = .fileTypeName
        case kAudioFileGlobalInfo_HFSTypeCodesForType:                      self = .hfsTypeCodesForType
        case kAudioFileGlobalInfo_MIMETypesForType:                         self = .mimeTypesForType
        case kAudioFileGlobalInfo_ReadableTypes:                            self = .readableTypes
        case kAudioFileGlobalInfo_TypesForExtension:                        self = .typesForExtension
        case kAudioFileGlobalInfo_TypesForHFSTypeCode:                      self = .typesForHFSTypeCode
        case kAudioFileGlobalInfo_TypesForMIMEType:                         self = .typesForMIMEType
        case kAudioFileGlobalInfo_TypesForUTI:                              self = .typesForUTI
        case kAudioFileGlobalInfo_UTIsForType:                              self = .utisForType
        case kAudioFileGlobalInfo_WritableTypes:                            self = .writableTypes
        default:                                                            return nil
        }
    }

    /// Returns "Audio File Services Global Property" for all cases.
    public var domain: String {
        return "Audio File Services Global Property"
    }
    
    /// A short description of the property.
    public var shortDescription: String {
        switch self {
        case .allExtensions:                        return "All extensions"
        case .allHFSTypeCodes:                      return "All HFS type codes"
        case .allMIMETypes:                         return "All MIME types"
        case .allUTIs:                              return "All UTIs"
        case .availableFormatIDs:                   return "Available format IDs"
        case .availableStreamDescriptionsForFormat: return "Available stream descriptions for format"
        case .extensionsForType:                    return "Extensions for type"
        case .fileTypeName:                         return "File type name"
        case .hfsTypeCodesForType:                  return "HFS type codes for type"
        case .mimeTypesForType:                     return "MIME types for type"
        case .readableTypes:                        return "Readable types"
        case .typesForExtension:                    return "Types for extension"
        case .typesForHFSTypeCode:                  return "Types for HFS type code"
        case .typesForMIMEType:                     return "Types for MIME type"
        case .typesForUTI:                          return "Types for UTI"
        case .utisForType:                          return "UTIs for type"
        case .writableTypes:                        return "Writable types"
        }
    }
    
    /// The `UInt32` property ID constant defined in Audio File Services.
    public var code: UInt32 {
        switch self {
        case .allExtensions:                            return kAudioFileGlobalInfo_AllExtensions
        case .allHFSTypeCodes:                          return kAudioFileGlobalInfo_AllHFSTypeCodes
        case .allMIMETypes:                             return kAudioFileGlobalInfo_AllMIMETypes
        case .allUTIs:                                  return kAudioFileGlobalInfo_AllUTIs
        case .availableFormatIDs:                       return kAudioFileGlobalInfo_AvailableFormatIDs
        case .availableStreamDescriptionsForFormat:     return kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat
        case .extensionsForType:                        return kAudioFileGlobalInfo_ExtensionsForType
        case .fileTypeName:                             return kAudioFileGlobalInfo_FileTypeName
        case .hfsTypeCodesForType:                      return kAudioFileGlobalInfo_HFSTypeCodesForType
        case .mimeTypesForType:                         return kAudioFileGlobalInfo_MIMETypesForType
        case .readableTypes:                            return kAudioFileGlobalInfo_ReadableTypes
        case .typesForExtension:                        return kAudioFileGlobalInfo_TypesForExtension
        case .typesForHFSTypeCode:                      return kAudioFileGlobalInfo_TypesForHFSTypeCode
        case .typesForMIMEType:                         return kAudioFileGlobalInfo_TypesForMIMEType
        case .typesForUTI:                              return kAudioFileGlobalInfo_TypesForUTI
        case .utisForType:                              return kAudioFileGlobalInfo_UTIsForType
        case .writableTypes:                            return kAudioFileGlobalInfo_WritableTypes
        }
    }
}
