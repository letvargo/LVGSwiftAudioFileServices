//
//  AudioFileError.swift
//  AudioToolboxTrainer_01
//
//  Created by doof nugget on 1/5/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import Foundation
import AudioToolbox
import LVGUtilities

// Internally, Error can be used as a shortname for AudioFileError
typealias Error = AudioFileError

/**
 
 An enum with cases that represent the `OSStatus` result codes defined by 
 Audio File Services.
 
 Each case has a `code` property equivalent to the result code for the
 corresponding error defined by Audio File Services.
 
 Each case also has an associated value of type `String` that can be accessed
 using the value's `message` property. This is used to provide information about
 the context from which the error was thrown.
 
 For more information about the `OSStatus` codes defined by Audio File Services 
 see the official [Apple Audio File Services documentation](https://developer.apple.com/library/mac/documentation/MusicAudio/Reference/AudioFileConvertRef/index.html#//apple_ref/doc/uid/TP40006072).
 
 */

public enum AudioFileError: CodedErrorType {
    
    /// The equivalent of `OSStatus` code `kAudioFileBadPropertySizeError`.
    case badPropertySize(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileDoesNotAllow64BitDataSizeError`.
    case doesNotAllow64BitDataSize(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileEndOfFileError`.
    case endOfFile(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileFileNotFoundError`.
    case fileNotFound(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidChunkError`.
    case invalidChunk(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidFileError`.
    case invalidFile(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidPacketOffsetError`.
    case invalidPacketOffset(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileNotOpenError`.
    case notOpen(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileNotOptimizedError`.
    case notOptimized(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileOperationNotSupportedError`.
    case operationNotSupported(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFilePermissionsError`.
    case permissions(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFilePositionError`.
    case position(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnspecifiedError`.
    case unspecified(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedDataFormatError`.
    case unsupportedDataFormat(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedFileTypeError`.
    case unsupportedFileType(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedPropertyError`.
    case unsupportedProperty(message: String)
    
    /// Created when the `OSStatus` code is not defined by Audio File Services.
    case undefined(status: OSStatus, message: String)
    
    /// Initializes a `AudioFileError` using a result code
    /// defined by Audio File Services and a message that provides
    /// information about the context from which the error was thrown.
    public init(status: OSStatus, message: String) {
        switch status {
        case kAudioFileUnspecifiedError:                self = .unspecified(message: message)
        case kAudioFileUnsupportedFileTypeError:        self = .unsupportedFileType(message: message)
        case kAudioFileUnsupportedDataFormatError:      self = .unsupportedDataFormat(message: message)
        case kAudioFileUnsupportedPropertyError:        self = .unsupportedProperty(message: message)
        case kAudioFileBadPropertySizeError:            self = .badPropertySize(message: message)
        case kAudioFilePermissionsError:                self = .permissions(message: message)
        case kAudioFileNotOptimizedError:               self = .notOptimized(message: message)
        case kAudioFileInvalidChunkError:               self = .invalidChunk(message: message)
        case kAudioFileDoesNotAllow64BitDataSizeError:  self = .doesNotAllow64BitDataSize(message: message)
        case kAudioFileInvalidPacketOffsetError:        self = .invalidPacketOffset(message: message)
        case kAudioFileInvalidFileError:                self = .invalidFile(message: message)
        case kAudioFileOperationNotSupportedError:      self = .operationNotSupported(message: message)
        case kAudioFileNotOpenError:                    self = .notOpen(message: message)
        case kAudioFileEndOfFileError:                  self = .endOfFile(message: message)
        case kAudioFilePositionError:                   self = .position(message: message)
        case kAudioFileFileNotFoundError:               self = .fileNotFound(message: message)
        default:                                        self = .undefined(status: status, message: message)
        }
    }
    
    /// The `OSStatus` result code associated with the error.
    public var code: OSStatus {
        switch self {
        case .unspecified:                  return kAudioFileUnspecifiedError
        case .unsupportedFileType:          return kAudioFileUnsupportedFileTypeError
        case .unsupportedDataFormat:        return kAudioFileUnsupportedDataFormatError
        case .unsupportedProperty:          return kAudioFileUnsupportedPropertyError
        case .badPropertySize:              return kAudioFileBadPropertySizeError
        case .permissions:                  return kAudioFilePermissionsError
        case .notOptimized:                 return kAudioFileNotOptimizedError
        case .invalidChunk:                 return kAudioFileInvalidChunkError
        case .doesNotAllow64BitDataSize:    return kAudioFileDoesNotAllow64BitDataSizeError
        case .invalidPacketOffset:          return kAudioFileInvalidPacketOffsetError
        case .invalidFile:                  return kAudioFileInvalidFileError
        case .operationNotSupported:        return kAudioFileOperationNotSupportedError
        case .notOpen:                      return kAudioFileNotOpenError
        case .endOfFile:                    return kAudioFileEndOfFileError
        case .position:                     return kAudioFilePositionError
        case .fileNotFound:                 return kAudioFileFileNotFoundError
        case .undefined(let (status, _)):   return status
        }
    }
    
    /// Returns "Audio File Services Error" for all cases.
    public var domain: String {
        return "Audio File Services Error"
    }
    
    /// A message that provides information about the context from which the error was thrown.
    public var message: String {
        switch self {
        case .unspecified(let m):               return m
        case .unsupportedFileType(let m):       return m
        case .unsupportedDataFormat(let m):     return m
        case .unsupportedProperty(let m):       return m
        case .badPropertySize(let m):           return m
        case .permissions(let m):               return m
        case .notOptimized(let m):              return m
        case .invalidChunk(let m):              return m
        case .doesNotAllow64BitDataSize(let m): return m
        case .invalidPacketOffset(let m):       return m
        case .invalidFile(let m):               return m
        case .operationNotSupported(let m):     return m
        case .notOpen(let m):                   return m
        case .endOfFile(let m):                 return m
        case .position(let m):                  return m
        case .fileNotFound(let m):              return m
        case .undefined(let (_, m)):            return m
        }
    }
    
    /// A short description of the error.
    public var shortDescription: String {
        switch self {
        case .unspecified:                  return "Unspecified error."
        case .unsupportedFileType:          return "Unsupported file type."
        case .unsupportedDataFormat:        return "Unsupported data format."
        case .unsupportedProperty:          return "Unsupported property."
        case .badPropertySize:              return "Bad property size."
        case .permissions:                  return "Invalid permissions."
        case .notOptimized:                 return "Not optimized."
        case .invalidChunk:                 return "Invalid chunk."
        case .doesNotAllow64BitDataSize:    return "Does not allow 64-bit data size."
        case .invalidPacketOffset:          return "Invalid packet offset."
        case .invalidFile:                  return "Invalid file."
        case .operationNotSupported:        return "Operation not supported."
        case .notOpen:                      return "File not open."
        case .endOfFile:                    return "End of file."
        case .position:                     return "Invalid position."
        case .fileNotFound:                 return "File not found."
        case .undefined:                    return "This error is not defined by Audio File Services."
        }
    }
}
