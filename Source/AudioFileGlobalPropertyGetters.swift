//
//  AudioFileGlobalPropertyGetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import AudioToolbox

extension AudioFile {
    
    // MARK: Audio File Services Global Property Getters
    
    /**
    
     Get the size of the specified global property.
     
     - parameters:
       - property: The global property.
       - specifierSize: The size of the specifier, if any. Pass `0` if no
       specifier is required for querying the property.
       - specifier: A void pointer to data that is used to query the property.
     - returns: The size of the property data in bytes as a `UInt32` value.
     - throws: `AudioFileError`
     */
    public static func globalPropertySize(
        _ property: AudioFileGlobalProperty,
        specifierSize: UInt32 = 0,
        specifier: UnsafeMutableRawPointer? = nil) throws -> UInt32 {
        
        var size: UInt32 = UInt32.max
        try Error.check(
            AudioFileGetGlobalInfoSize(
                property.code,
                specifierSize,
                specifier,
                &size ),
            message: "An error occurred while getting the size of the global property '\(property.shortDescription)'.")
        return size
    }
    
    fileprivate static func property<T>(
        _ property: AudioFileGlobalProperty,
        buffer: UnsafeMutablePointer<T>,
        specifierSize: UInt32 = 0,
        specifier: UnsafeMutableRawPointer? = nil,
        size inSize: UInt32? = nil) throws {
        
        var size = try inSize ?? AudioFile.globalPropertySize(property)
        try Error.check(
            AudioFileGetGlobalInfo(
                property.code,
                specifierSize,
                specifier,
                &size,
                buffer),
            message: "An error occurred while trying to get the global property '\(property.shortDescription)'.")
    }
    
    /// Get a list off all audio file extensions.
    ///
    /// - returns: A `[String]` that contains all available audio file extensions.
    /// - throws: `AudioFileError`
    public static func allExtensions() throws -> [String] {
        var extensions = NSArray()
        try AudioFile.property(.allExtensions, buffer: &extensions)
        return extensions.flatMap { $0 as? String }
    }
    
    /// Get a list of all HFS type codes.
    ///
    /// - returns: A `[FourCharCode]` that contains all available HFS type codes.
    /// - throws: `AudioFileError`
    public static func allHFSTypeCodes() throws -> [FourCharCode] {
        let size = try AudioFile.globalPropertySize(.allHFSTypeCodes)
        var codes = [FourCharCode](repeating: 0, count: Int(size) / sizeof(FourCharCode))
        try property(.allHFSTypeCodes, buffer: &codes, size: size)
        return codes
    }
    
    /// Get a list of all MIME types.
    ///
    /// - returns: A `[String]` that contains all available MIME types.
    /// - throws: `AudioFileError`
    public static func allMIMETypes() throws -> [String] {
        var types = NSArray()
        try AudioFile.property(.allMIMETypes, buffer: &types)
        return types.flatMap { $0 as? String }
    }
    
    /// Get a list of all UTIs.
    ///
    /// - returns: A `[String]` that contains all available UTIs.
    /// - throws: `AudioFileError`
    public static func allUTIs() throws -> [String] {
        var UTIs = NSArray()
        try AudioFile.property(.allUTIs, buffer: &UTIs)
        return UTIs.flatMap { $0 as? String }
    }
    
    /**
    
     Get a list of all available format IDs for the specified `AudioFileType`.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: A `[AudioFormatID]` of all format IDs for the specified `AudioFileType`.
     - throws: `AudioFileError`
     */
    public static func availableFormatIDs(_ audioFileType: AudioFileType) throws -> [AudioFormatID] {
        
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .availableFormatIDs,
            specifierSize: specifierSize,
            specifier: &specifier )
        var formats = [AudioFormatID](repeating: 0, count: Int(size) / sizeof(AudioFormatID))
        try AudioFile.property(
            .availableFormatIDs,
            buffer: &formats,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return formats
    }
    
    /**
     Get a list of `AudioStreamBasicDescription`s for the specified format.
    
     - parameter audioFileTypeAndFormatID: The `AudioFileTypeAndFormatID`
     that you are querying.
     - returns: A `[AudioStreamBasicDescription]` containing formats available
     for the specified `AudioFileTypeAndFormatID`.
     - throws: `AudioFileError`
     */
    public static func availableStreamDescriptionsForFormat(
        _ audioFileTypeAndFormatID: AudioFileTypeAndFormatID) throws -> [AudioStreamBasicDescription] {
        
        var specifier = audioFileTypeAndFormatID
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .availableStreamDescriptionsForFormat,
            specifierSize: specifierSize,
            specifier: &specifier )
        var formats = [AudioStreamBasicDescription](
            repeating: AudioStreamBasicDescription(),
            count: Int(size) / sizeof(AudioStreamBasicDescription) )
        try AudioFile.property(
            .availableStreamDescriptionsForFormat,
            buffer: &formats,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return formats
    }
    
    /**
     Get a list of audio file extensions available for the specified
     `AudioFileType`.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: A `[String]` containing the list of available extensions.
     - throws: `AudioFileError`
     */
    public static func extensionsForType(_ audioFileType: AudioFileType) throws -> [String] {
    
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .extensionsForType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var extensions = NSArray()
        try AudioFile.property(
            .extensionsForType,
            buffer: &extensions,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return extensions.flatMap { $0 as? String }
    }
    
    /**
     Get name of the file type for the specified `AudioFileType`.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: The name of the `AudioFileType`.
     - throws: `AudioFileError`
     */
    public static func fileTypeName(_ audioFileType: AudioFileType) throws -> String {
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .fileTypeName,
            specifierSize: specifierSize,
            specifier: &specifier )
        var typeName: NSString = NSString(string: "")
        try AudioFile.property(
                .fileTypeName,
                buffer: &typeName,
                specifierSize: specifierSize,
                specifier: &specifier,
                size: size)
        return typeName as String
    }
    
    /**
     Get a list of HFS type codes for the specified `AudioFileType`.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: A `[FourCharCode]` containing the available HFS type codes
     for the specified `AudioFileType`.
     - throws: `AudioFileError`
     */
    public static func HFSTypeCodesForType(_ audioFileType: AudioFileType) throws -> [FourCharCode] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .hfsTypeCodesForType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var codes = [FourCharCode](repeating: 0, count: Int(size) / sizeof(FourCharCode))
        try AudioFile.property(
            .hfsTypeCodesForType,
            buffer: &codes,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return codes
    }
    
    /**
     Get a list of MIME types for the specified `AudioFileType`.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: A `[String]` containing the available MIME types
     for the specified `AudioFileType`.
     - throws: `AudioFileError`
     */
    public static func MIMETypesForType(_ audioFileType: AudioFileType) throws -> [String] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .mimeTypesForType,
            specifierSize: specifierSize,
            specifier: &specifier)
        var types = NSArray()
        try AudioFile.property(
            .mimeTypesForType,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types.flatMap { $0 as? String }
    }
    
    /**
     Get a list of all readable audio file types.
     
     - returns: A `[AudioFileTypeID]` containing all readable file types.
     - throws: `AudioFileError`
     */
    public static func readableTypes() throws -> [AudioFileTypeID] {
        let size = try AudioFile.globalPropertySize(.readableTypes)
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(.readableTypes, buffer: &types, size: size)
        return types
    }
    
    /**
     Get a list of types available for the provided extension.
     
     - parameter ext: The audio file extension that you are querying.
     - returns: A `[AudioFileTypeID]` containing all available file types.
     - throws: `AudioFileError`
     */
    public static func typesForExtension(_ ext: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: ext)
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .typesForExtension,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(
            .typesForExtension,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    /**
     Get a list of types available for the provided HFS type code.
     
     - parameter code: The HFS type code that you are querying.
     - returns: A `[AudioFileTypeID]` containing all available file types.
     - throws: `AudioFileError`
     */
    public static func typesForHFSTypeCode(_ code: FourCharCode) throws -> [AudioFileTypeID] {
        var specifier = code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .typesForHFSTypeCode,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(
            .typesForHFSTypeCode,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    /**
     Get a list of types available for the provided MIME type.
     
     - parameter type: The MIME type that you are querying.
     - returns: A `[AudioFileTypeID]` containing all available file types.
     - throws: `AudioFileError`
     */
    public static func typesForMIMEType(_ type: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: type)
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .typesForMIMEType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(
            .typesForMIMEType,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    /**
     Get a list of types available for the provided UTI.
     
     - parameter UTI: The UTI that you are querying.
     - returns: A `[AudioFileTypeID]` containing all available file types.
     - throws: `AudioFileError`
     */
    public static func typesForUTI(_ UTI: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: UTI)
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .typesForUTI,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(
            .typesForUTI,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    /**
     Get a list of UTIs available for the provided file type.
     
     - parameter audioFileType: The `AudioFileType` that you are querying.
     - returns: A `[String]` containing all available UTIs.
     - throws: `AudioFileError`
     */
    public static func UTIsForType(_ audioFileType: AudioFileType) throws -> [String] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(MemoryLayout.size(ofValue: specifier))
        let size = try AudioFile.globalPropertySize(
            .utisForType,
            specifierSize: specifierSize,
            specifier: &specifier)
        var UTIs = NSArray()
        try AudioFile.property(
            .utisForType,
            buffer: &UTIs,
            specifierSize:
            specifierSize,
            specifier: &specifier,
            size: size)
        return UTIs.flatMap { $0 as? String }
    }
    
    /**
     Get a list of all writable audio file types.
     
     - returns: A `[AudioFileTypeID]` containing all writable file types.
     - throws: `AudioFileError`
     */    public static func writableTypes() throws -> [AudioFileTypeID] {
        let size = try AudioFile.globalPropertySize(.writableTypes)
        var types = [AudioFileTypeID](repeating: 0, count: Int(size) / sizeof(AudioFileTypeID))
        try AudioFile.property(.writableTypes, buffer: &types, size: size)
        return types
    }
}
