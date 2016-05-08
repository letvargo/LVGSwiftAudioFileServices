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
    case BadPropertySize(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileDoesNotAllow64BitDataSizeError`.
    case DoesNotAllow64BitDataSize(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileEndOfFileError`.
    case EndOfFile(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileFileNotFoundError`.
    case FileNotFound(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidChunkError`.
    case InvalidChunk(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidFileError`.
    case InvalidFile(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileInvalidPacketOffsetError`.
    case InvalidPacketOffset(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileNotOpenError`.
    case NotOpen(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileNotOptimizedError`.
    case NotOptimized(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileOperationNotSupportedError`.
    case OperationNotSupported(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFilePermissionsError`.
    case Permissions(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFilePositionError`.
    case Position(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnspecifiedError`.
    case Unspecified(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedDataFormatError`.
    case UnsupportedDataFormat(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedFileTypeError`.
    case UnsupportedFileType(message: String)
    
    /// The equivalent of `OSStatus` code `kAudioFileUnsupportedPropertyError`.
    case UnsupportedProperty(message: String)
    
    /// Created when the `OSStatus` code is not defined by Audio File Services.
    case Undefined(status: OSStatus, message: String)
    
    /// Initializes a `AudioFileError` using a result code
    /// defined by Audio File Services and a message that provides
    /// information about the context from which the error was thrown.
    public init(status: OSStatus, message: String) {
        switch status {
        case kAudioFileUnspecifiedError:                self = .Unspecified(message: message)
        case kAudioFileUnsupportedFileTypeError:        self = .UnsupportedFileType(message: message)
        case kAudioFileUnsupportedDataFormatError:      self = .UnsupportedDataFormat(message: message)
        case kAudioFileUnsupportedPropertyError:        self = .UnsupportedProperty(message: message)
        case kAudioFileBadPropertySizeError:            self = .BadPropertySize(message: message)
        case kAudioFilePermissionsError:                self = .Permissions(message: message)
        case kAudioFileNotOptimizedError:               self = .NotOptimized(message: message)
        case kAudioFileInvalidChunkError:               self = .InvalidChunk(message: message)
        case kAudioFileDoesNotAllow64BitDataSizeError:  self = .DoesNotAllow64BitDataSize(message: message)
        case kAudioFileInvalidPacketOffsetError:        self = .InvalidPacketOffset(message: message)
        case kAudioFileInvalidFileError:                self = .InvalidFile(message: message)
        case kAudioFileOperationNotSupportedError:      self = .OperationNotSupported(message: message)
        case kAudioFileNotOpenError:                    self = .NotOpen(message: message)
        case kAudioFileEndOfFileError:                  self = .EndOfFile(message: message)
        case kAudioFilePositionError:                   self = .Position(message: message)
        case kAudioFileFileNotFoundError:               self = .FileNotFound(message: message)
        default:                                        self = .Undefined(status: status, message: message)
        }
    }
    
    /// The `OSStatus` result code associated with the error.
    public var code: OSStatus {
        switch self {
        case .Unspecified:                  return kAudioFileUnspecifiedError
        case .UnsupportedFileType:          return kAudioFileUnsupportedFileTypeError
        case .UnsupportedDataFormat:        return kAudioFileUnsupportedDataFormatError
        case .UnsupportedProperty:          return kAudioFileUnsupportedPropertyError
        case .BadPropertySize:              return kAudioFileBadPropertySizeError
        case .Permissions:                  return kAudioFilePermissionsError
        case .NotOptimized:                 return kAudioFileNotOptimizedError
        case .InvalidChunk:                 return kAudioFileInvalidChunkError
        case .DoesNotAllow64BitDataSize:    return kAudioFileDoesNotAllow64BitDataSizeError
        case .InvalidPacketOffset:          return kAudioFileInvalidPacketOffsetError
        case .InvalidFile:                  return kAudioFileInvalidFileError
        case .OperationNotSupported:        return kAudioFileOperationNotSupportedError
        case .NotOpen:                      return kAudioFileNotOpenError
        case .EndOfFile:                    return kAudioFileEndOfFileError
        case .Position:                     return kAudioFilePositionError
        case .FileNotFound:                 return kAudioFileFileNotFoundError
        case .Undefined(let (status, _)):   return status
        }
    }
    
    /// Returns "Audio File Services Error" for all cases.
    public var domain: String {
        return "Audio File Services Error"
    }
    
    /// A message that provides information about the context from which the error was thrown.
    public var message: String {
        switch self {
        case .Unspecified(let m):               return m
        case .UnsupportedFileType(let m):       return m
        case .UnsupportedDataFormat(let m):     return m
        case .UnsupportedProperty(let m):       return m
        case .BadPropertySize(let m):           return m
        case .Permissions(let m):               return m
        case .NotOptimized(let m):              return m
        case .InvalidChunk(let m):              return m
        case .DoesNotAllow64BitDataSize(let m): return m
        case .InvalidPacketOffset(let m):       return m
        case .InvalidFile(let m):               return m
        case .OperationNotSupported(let m):     return m
        case .NotOpen(let m):                   return m
        case .EndOfFile(let m):                 return m
        case .Position(let m):                  return m
        case .FileNotFound(let m):              return m
        case .Undefined(let (_, m)):            return m
        }
    }
    
    /// A short description of the error.
    public var shortDescription: String {
        switch self {
        case .Unspecified:                  return "Unspecified error."
        case .UnsupportedFileType:          return "Unsupported file type."
        case .UnsupportedDataFormat:        return "Unsupported data format."
        case .UnsupportedProperty:          return "Unsupported property."
        case .BadPropertySize:              return "Bad property size."
        case .Permissions:                  return "Invalid permissions."
        case .NotOptimized:                 return "Not optimized."
        case .InvalidChunk:                 return "Invalid chunk."
        case .DoesNotAllow64BitDataSize:    return "Does not allow 64-bit data size."
        case .InvalidPacketOffset:          return "Invalid packet offset."
        case .InvalidFile:                  return "Invalid file."
        case .OperationNotSupported:        return "Operation not supported."
        case .NotOpen:                      return "File not open."
        case .EndOfFile:                    return "End of file."
        case .Position:                     return "Invalid position."
        case .FileNotFound:                 return "File not found."
        case .Undefined:                    return "This error is not defined by Audio File Services."
        }
    }
}