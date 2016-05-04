//
//  AudioFileID_Extension.swift
//  AudioToolboxTrainer_01
//
//  Created by doof nugget on 1/5/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import Foundation
import AudioToolbox

/// A Swift wrapper around Audio File Services' `AudioFileID`.
public class AudioFile {

    /// A COpaquePointer that references an `AudioFileID`.
    public var audioFileID: AudioFileID
    
    /// Initialize the `AudioFile` with the given `AudioFileID`.
    public init(audioFileID: AudioFileID) {
        self.audioFileID = audioFileID
    }
    
    /// Initialize an `AudioFile` with an empty `AudioFileID`.
    public convenience init() {
        self.init(audioFileID: nil)
    }
    
    /// Initialize an `AudioFile` with an audio file at the provided URL.
    public convenience init(
        url: NSURL,
        permissions: AudioFilePermissions,
        fileTypeHint: AudioFileType? = nil) throws {
        
        var audioFileID: AudioFileID = nil
        
        try Error.check(
            AudioFileOpenURL(
                url,
                permissions,
                fileTypeHint?.code ?? 0,
                &audioFileID),
            message: "Failed to open file at url \(url).")
        
        self.init(audioFileID: audioFileID)
    }

    // MARK: Creating and Initializing Audio Files

//    public func initializeWithCallbacks(
//        inClientData inClientData: UnsafeMutablePointer<Void>,
//        inReadFunc: AudioFile_ReadProc,
//        inWriteFunc: AudioFile_WriteProc,
//        inGetSizeFunc: AudioFile_GetSizeProc,
//        inSetSizeFunc: AudioFile_SetSizeProc,
//        inFileType: AudioFileType,
//        inFormat: UnsafeMutablePointer<AudioStreamBasicDescription>,
//        inFlags: AudioFileFlags) throws {
//
//        try Error.check(
//            AudioFileInitializeWithCallbacks(
//                inClientData
//                , inReadFunc
//                , inWriteFunc
//                , inGetSizeFunc
//                , inSetSizeFunc
//                , inFileType.code
//                , inFormat
//                , inFlags
//                , &self.audioFileID)
//            , message: "Failed to initialize file with callbacks.")
//    }

//    mutating public func createWithURL(url: NSURL, fileType: AudioFileType, inout format: AudioStreamBasicDescription, flags: AudioFileFlags) throws {
//        
//        try Error.check(
//            AudioFileCreateWithURL(
//                url,
//                fileType.code,
//                &format,
//                flags,
//                &ptr),
//            message: "Failed to create file at url \(url).")
    //    }
    
    // MARK: Opening and Closing Audio Files
    
    public func open(url: NSURL, permissions: AudioFilePermissions, fileTypeHint: AudioFileType? = nil) throws {
        
        try Error.check(
            AudioFileOpenURL(
                url,
                permissions,
                fileTypeHint?.code ?? 0,
                &self.audioFileID),
            message: "Failed to open file at url \(url).")
    }
    
//    mutating public func openWithCallbacks(inClientData inClientData: UnsafeMutablePointer<Void>, inReadFunc: AudioFile_ReadProc, inWriteFunc: AudioFile_WriteProc?, inGetSizeFunc: AudioFile_GetSizeProc, inSetSizeFunc: AudioFile_SetSizeProc?, inFileTypeHint: AudioFileType = .None, inFormat: UnsafeMutablePointer<AudioStreamBasicDescription>) throws {
//        
//        try Error.check(
//            AudioFileOpenWithCallbacks(
//                inClientData
//                , inReadFunc
//                , inWriteFunc
//                , inGetSizeFunc
//                , inSetSizeFunc
//                , inFileTypeHint.code
//                , &ptr)
//            , message: "Failed to initialize file with callbacks.")
//    }
//    
//    public func close() throws {
//        
//        try Error.check(
//              AudioFileClose(ptr)
//            , message: "Failed to close file.")
//    }
//
//    // MARK: Property Information
//    
//    public func getPropertyInfo(property: AudioFileProperty) throws -> (UInt32, Bool) {
//        return (try getPropertySize(property), try getPropertyIsWritable(property))
//    }
//    
//    public func getPropertySize(property: AudioFileProperty) throws -> UInt32 {
//        
//        var size: UInt32 = 0
//        
//        try Error.check(
//              AudioFileGetPropertyInfo(
//                  self.ptr
//                , property.code
//                , &size
//                , nil)
//            , message: "Failed to get property size for property \(property.rawValue).")
//        
//        return size
//    }
//    
//    public func getPropertyIsWritable(property: AudioFileProperty) throws -> Bool {
//        
//        var isWritable: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetPropertyInfo(
//                self.ptr
//                , property.code
//                , nil
//                , &isWritable)
//            , message: "Failed to determine if property is writable for property \(property.rawValue).")
//        
//        return isWritable == 1
//    }
//    
//    // MARK: Reading and Writing Data
//    
//    public func readBytes(inStartingByte inStartingByte: Int64, ioNumBytes: UnsafeMutablePointer<UInt32>, outBuffer: UnsafeMutablePointer<Void>, inUseCache: Bool = false) throws {
//        
//        try Error.check(
//            AudioFileReadBytes(
//                ptr
//                , inUseCache
//                , inStartingByte
//                , ioNumBytes
//                , outBuffer)
//        , message: "Failed to read bytes.")
//        
//    }
//    
//    public func writeBytes(inStartingByte inStartingByte: Int64, ioNumBytes: UnsafeMutablePointer<UInt32>, inBuffer: UnsafePointer<Void>, inUseCache: Bool = false) throws {
//        
//        try Error.check(
//            AudioFileWriteBytes(
//                ptr
//                , inUseCache
//                , inStartingByte
//                , ioNumBytes
//                , inBuffer)
//            , message: "Failed to write bytes.")
//    }
//    
//    public func readPacketData(ioNumBytes: UnsafeMutablePointer<UInt32>, outPacketDescriptions: UnsafeMutablePointer<AudioStreamPacketDescription>, inStartingPacket: Int64, ioNumPackets: UnsafeMutablePointer<UInt32>, outBuffer: UnsafeMutablePointer<Void>, inUseCache: Bool = false) throws {
//        try Error.check(
//            AudioFileReadPacketData(
//                ptr
//                , inUseCache
//                , ioNumBytes
//                , outPacketDescriptions
//                , inStartingPacket
//                , ioNumPackets
//                , outBuffer)
//            , message: "Failed to read packet data.")
//    }
//    
//    public func writePackets(numBytes: UInt32, packetDescriptions: UnsafePointer<AudioStreamPacketDescription>, startingPacket: Int64, inout numPackets: UInt32, buffer: UnsafePointer<Void>, useCache: Bool = false) throws {
//    
//        try Error.check(
//            AudioFileWritePackets(
//                self.ptr
//                , useCache
//                , numBytes
//                , packetDescriptions
//                , startingPacket
//                , &numPackets
//                , buffer)
//            , message: "Failed to write packets.")
//    }
//    
//    // MARK: Optimizing
//    
//    public func optimize() throws {
//        try Error.check(
//            AudioFileOptimize(ptr)
//            , message: "Failed to optimize audio file.")
//    }
}