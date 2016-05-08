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
    case AllExtensions
    /// The equivalent of kAudioFileGlobalInfo_AllHFSTypeCodes
    case AllHFSTypeCodes
    /// The equivalent of kAudioFileGlobalInfo_AllMIMIETypes
    case AllMIMETypes
    /// The equivalent of kAudioFileGlobalInfo_AllUTIs
    case AllUTIs
    /// The equivalent of kAudioFileGlobalInfo_AvailableFormatIDs
    case AvailableFormatIDs
    /// The equivalent of kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat
    case AvailableStreamDescriptionsForFormat
    /// The equivalent of kAudioFileGlobalInfo_ExtensionsForType
    case ExtensionsForType
    /// The equivalent of kAudioFileGlobalInfo_FileTypeName
    case FileTypeName
    /// The equivalent of kAudioFileGlobalInfo_HFSTypeCodesForType
    case HFSTypeCodesForType
    /// The equivalent of kAudioFileGlobalInfo_MIMETypesForType
    case MIMETypesForType
    /// The equivalent of kAudioFileGlobalInfo_ReadableTypes
    case ReadableTypes
    /// The equivalent of kAudioFileGlobalInfo_TypesForExtension
    case TypesForExtension
    /// The equivalent of kAudioFileGlobalInfo_TypesForHFSTypeCode
    case TypesForHFSTypeCode
    /// The equivalent of kAudioFileGlobalInfo_TypesForMIMEType
    case TypesForMIMEType
    /// The equivalent of kAudioFileGlobalInfo_TypesForUTI
    case TypesForUTI
    /// The equivalent of kAudioFileGlobalInfo_UTIsForType
    case UTIsForType
    /// The equivalent of kAudioFileGlobalInfo_WritableTypes
    case WritableTypes
    
    /// Initialize an `AudioFileGlobalProperty` from a property ID constant
    /// defined in Audio File Services.
    public init?(code: UInt32) {
        switch code {
        case kAudioFileGlobalInfo_AllExtensions:                            self = .AllExtensions
        case kAudioFileGlobalInfo_AllHFSTypeCodes:                          self = .AllHFSTypeCodes
        case kAudioFileGlobalInfo_AllMIMETypes:                             self = .AllMIMETypes
        case kAudioFileGlobalInfo_AllUTIs:                                  self = .AllUTIs
        case kAudioFileGlobalInfo_AvailableFormatIDs:                       self = .AvailableFormatIDs
        case kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat:     self = .AvailableStreamDescriptionsForFormat
        case kAudioFileGlobalInfo_ExtensionsForType:                        self = .ExtensionsForType
        case kAudioFileGlobalInfo_FileTypeName:                             self = .FileTypeName
        case kAudioFileGlobalInfo_HFSTypeCodesForType:                      self = .HFSTypeCodesForType
        case kAudioFileGlobalInfo_MIMETypesForType:                         self = .MIMETypesForType
        case kAudioFileGlobalInfo_ReadableTypes:                            self = .ReadableTypes
        case kAudioFileGlobalInfo_TypesForExtension:                        self = .TypesForExtension
        case kAudioFileGlobalInfo_TypesForHFSTypeCode:                      self = .TypesForHFSTypeCode
        case kAudioFileGlobalInfo_TypesForMIMEType:                         self = .TypesForMIMEType
        case kAudioFileGlobalInfo_TypesForUTI:                              self = .TypesForUTI
        case kAudioFileGlobalInfo_UTIsForType:                              self = .UTIsForType
        case kAudioFileGlobalInfo_WritableTypes:                            self = .WritableTypes
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
        case .AllExtensions:                        return "All extensions"
        case .AllHFSTypeCodes:                      return "All HFS type codes"
        case .AllMIMETypes:                         return "All MIME types"
        case .AllUTIs:                              return "All UTIs"
        case .AvailableFormatIDs:                   return "Available format IDs"
        case .AvailableStreamDescriptionsForFormat: return "Available stream descriptions for format"
        case .ExtensionsForType:                    return "Extensions for type"
        case .FileTypeName:                         return "File type name"
        case .HFSTypeCodesForType:                  return "HFS type codes for type"
        case .MIMETypesForType:                     return "MIME types for type"
        case .ReadableTypes:                        return "Readable types"
        case .TypesForExtension:                    return "Types for extension"
        case .TypesForHFSTypeCode:                  return "Types for HFS type code"
        case .TypesForMIMEType:                     return "Types for MIME type"
        case .TypesForUTI:                          return "Types for UTI"
        case .UTIsForType:                          return "UTIs for type"
        case .WritableTypes:                        return "Writable types"
        }
    }
    
    /// The `UInt32` property ID constant defined in Audio File Services.
    public var code: UInt32 {
        switch self {
        case .AllExtensions:                            return kAudioFileGlobalInfo_AllExtensions
        case .AllHFSTypeCodes:                          return kAudioFileGlobalInfo_AllHFSTypeCodes
        case .AllMIMETypes:                             return kAudioFileGlobalInfo_AllMIMETypes
        case .AllUTIs:                                  return kAudioFileGlobalInfo_AllUTIs
        case .AvailableFormatIDs:                       return kAudioFileGlobalInfo_AvailableFormatIDs
        case .AvailableStreamDescriptionsForFormat:     return kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat
        case .ExtensionsForType:                        return kAudioFileGlobalInfo_ExtensionsForType
        case .FileTypeName:                             return kAudioFileGlobalInfo_FileTypeName
        case .HFSTypeCodesForType:                      return kAudioFileGlobalInfo_HFSTypeCodesForType
        case .MIMETypesForType:                         return kAudioFileGlobalInfo_MIMETypesForType
        case .ReadableTypes:                            return kAudioFileGlobalInfo_ReadableTypes
        case .TypesForExtension:                        return kAudioFileGlobalInfo_TypesForExtension
        case .TypesForHFSTypeCode:                      return kAudioFileGlobalInfo_TypesForHFSTypeCode
        case .TypesForMIMEType:                         return kAudioFileGlobalInfo_TypesForMIMEType
        case .TypesForUTI:                              return kAudioFileGlobalInfo_TypesForUTI
        case .UTIsForType:                              return kAudioFileGlobalInfo_UTIsForType
        case .WritableTypes:                            return kAudioFileGlobalInfo_WritableTypes
        }
    }
}