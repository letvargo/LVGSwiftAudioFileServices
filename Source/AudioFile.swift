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

    // MARK: AudioFile properties

    /// A COpaquePointer that references an `AudioFileID`.
    public var audioFileID: AudioFileID
    
    // MARK: AudioFile initializers
    
    /// Initialize an `AudioFile` with an empty `AudioFileID`.
    public convenience init() {
        self.init(audioFileID: nil)
    }
    
    /// Initialize an `AudioFile` with the provided `AudioFileID`.
    public init(audioFileID: AudioFileID) {
        self.audioFileID = audioFileID
    }
    
    // MARK: Opening and Closing Audio Files
    
    /// Close the `AudioFile`.
    public func close() throws {
        
        try Error.check(
            AudioFileClose(self.audioFileID),
            message: "Failed to close file.")
    }
    
    /// Create an audio file at the provided URL.
    public func createWithURL(
        url: NSURL,
        fileType: AudioFileType,
        inout format: AudioStreamBasicDescription,
        flags: AudioFileFlags) throws {
        
        try Error.check(
            AudioFileCreateWithURL(
                url,
                fileType.code,
                &format,
                flags,
                &self.audioFileID),
            message: "Failed to create file at url \(url).")
    }
    
    /// Erase and initialize an audio file with callbacks for reading
    /// and writing audio data.
    public func initializeWithCallbacks(
        inClientData inClientData: UnsafeMutablePointer<Void>,
        inReadFunc: AudioFile_ReadProc,
        inWriteFunc: AudioFile_WriteProc,
        inGetSizeFunc: AudioFile_GetSizeProc,
        inSetSizeFunc: AudioFile_SetSizeProc,
        inFileType: AudioFileType,
        inout inFormat: AudioStreamBasicDescription,
        inFlags: AudioFileFlags) throws {
        
        try Error.check(
            AudioFileInitializeWithCallbacks(
                inClientData,
                inReadFunc,
                inWriteFunc,
                inGetSizeFunc,
                inSetSizeFunc,
                inFileType.code,
                &inFormat,
                inFlags,
                &self.audioFileID),
            message: "Failed to initialize file with callbacks.")
    }
    
    /**
    
     Open an audio file at the provided URL.
     
     This method returns `self` to allow for method chaining:
    
         let audioFile = try AudioFile().open(myURL, permissions: .ReadPermissions)
     
     - parameters:
       - url: The URL of the file you wish to open.
       - permissions: Read, write, or read-write permissions.
       - fileTypeHint: A hint for the type of the audio file you are opening.
       The default value is `nil` and this should be used if you do not know
       the file type.
    
     - returns: This method opens the file and returns `self` in order to
     allow method chaining.
         
     - throws: `AudioFileError`
     
     */
    public func open(
        url: NSURL,
        permissions: AudioFilePermissions,
        fileTypeHint: AudioFileType? = nil) throws -> AudioFile {
        
        try Error.check(
            AudioFileOpenURL(
                url,
                permissions,
                fileTypeHint?.code ?? 0,
                &self.audioFileID),
            message: "Failed to open file at url \(url).")
        
        return self
    }
    
    /**
     
     Open an `AudioFile` with callbacks for reading and/or writing audio data.
     
     - parameters:
       - inClientData: A void pointer to a data object that will be passed to the
     callback functions.
       - inReadFunc: A callback used to read data from an audio file.
       - inWriteFunc: A callback used to write data to an audio file. Pass `nil`
       for this parameter if you only intend to use read access.
       - inGetSizeFunc: A callback used to get the size of the audio file.
       - inSetSizeFunc: A callback used to set the size of the audio file. Pass `nil`
       for this parameter if you only intend to use read access.
       - inFileTypeHint: The `AudioFileType` of the audio file. Pass `nil` to provide
       no file type hint.
     - returns: The opened `AudioFile` with assigned callbacks.
     - throws: `AudioFileError`
     */
    public func openWithCallbacks(
        inClientData inClientData: UnsafeMutablePointer<Void>,
        inReadFunc: AudioFile_ReadProc,
        inWriteFunc: AudioFile_WriteProc?,
        inGetSizeFunc: AudioFile_GetSizeProc,
        inSetSizeFunc: AudioFile_SetSizeProc?,
        inFileTypeHint: AudioFileType?) throws -> AudioFile {
        
        try Error.check(
            AudioFileOpenWithCallbacks(
                inClientData,
                inReadFunc,
                inWriteFunc,
                inGetSizeFunc,
                inSetSizeFunc,
                inFileTypeHint?.code ?? 0,
                &self.audioFileID),
            message: "Failed to initialize file with callbacks.")
        
        return self
    }

    // MARK: Optimizing
    
    public func optimize() throws {
    
        try Error.check(
            AudioFileOptimize(self.audioFileID),
            message: "Failed to optimize audio file.")
    }
}