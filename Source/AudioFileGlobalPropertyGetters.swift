//
//  AudioFileGlobalPropertyGetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import LVGSwiftAudioFileServices
import AudioToolbox

extension AudioFile {
    
    // MARK: Audio File Services Global Property Getters
    
    public static func globalPropertySize(
        property: AudioFileGlobalProperty,
        specifierSize: UInt32 = 0,
        specifier: UnsafeMutablePointer<Void> = nil) throws -> UInt32 {
        
        var size: UInt32 = 0
        
        try Error.check(
            AudioFileGetGlobalInfoSize(
                property.code,
                specifierSize,
                specifier,
                &size ),
            message: "An error occurred while getting the size of the global property '\(property.shortDescription)'.")
        
        return size
    }
    
    private static func property<T>(
        property: AudioFileGlobalProperty,
        buffer: UnsafeMutablePointer<T>,
        specifierSize: UInt32 = 0,
        specifier: UnsafeMutablePointer<Void> = nil,
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
    
    public static func allExtensions() throws -> [String] {
        var extensions = NSArray()
        try AudioFile.property(.AllExtensions, buffer: &extensions)
        return extensions.flatMap { $0 as? String }
    }
    
    public static func allHFSTypeCodes() throws -> [FourCharCode] {
        let size = try AudioFile.globalPropertySize(.AllHFSTypeCodes)
        var codes = [FourCharCode](count: Int(size) / sizeof(FourCharCode), repeatedValue: 0)
        try property(.AllHFSTypeCodes, buffer: &codes, size: size)
        return codes
    }
    
    public static func allMIMETypes() throws -> [String] {
        var types = NSArray()
        try AudioFile.property(.AllMIMETypes, buffer: &types)
        return types.flatMap { $0 as? String }
    }
    
    public static func allUTIs() throws -> [String] {
        var UTIs = NSArray()
        try AudioFile.property(.AllUTIs, buffer: &UTIs)
        return UTIs.flatMap { $0 as? String }
    }
    
    public static func availableFormatIDs(audioFileType: AudioFileType) throws -> [AudioFormatID] {
        
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .AvailableFormatIDs,
            specifierSize: specifierSize,
            specifier: &specifier )
        var formats = [AudioFormatID](count: Int(size) / sizeof(AudioFormatID), repeatedValue: 0)
        try AudioFile.property(
            .AvailableFormatIDs,
            buffer: &formats,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return formats
    }
    
    public static func availableStreamDescriptionsForFormat(
        audioFileTypeAndFormatID: AudioFileTypeAndFormatID) throws -> [AudioStreamBasicDescription] {
        
        var specifier = audioFileTypeAndFormatID
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .AvailableStreamDescriptionsForFormat,
            specifierSize: specifierSize,
            specifier: &specifier )
        var formats = [AudioStreamBasicDescription](
            count: Int(size) / sizeof(AudioStreamBasicDescription),
            repeatedValue: AudioStreamBasicDescription() )
        try AudioFile.property(
            .AvailableStreamDescriptionsForFormat,
            buffer: &formats,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return formats
    }
    
    public static func extensionsForType(audioFileType: AudioFileType) throws -> [String] {
    
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .ExtensionsForType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var extensions = NSArray()
        try AudioFile.property(
            .ExtensionsForType,
            buffer: &extensions,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return extensions.flatMap { $0 as? String }
    }
    
    public static func fileTypeName(audioFileType: AudioFileType) throws -> String {
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .FileTypeName,
            specifierSize: specifierSize,
            specifier: &specifier )
        var typeName: NSString = NSString(string: "")
        try AudioFile.property(
                .FileTypeName,
                buffer: &typeName,
                specifierSize: specifierSize,
                specifier: &specifier,
                size: size)
        return typeName as String
    }

    public static func HFSTypeCodesForType(audioFileType: AudioFileType) throws -> [FourCharCode] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .HFSTypeCodesForType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var codes = [FourCharCode](count: Int(size) / sizeof(FourCharCode), repeatedValue: 0)
        try AudioFile.property(
            .HFSTypeCodesForType,
            buffer: &codes,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return codes
    }

    public static func MIMETypesForType(audioFileType: AudioFileType) throws -> [String] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .MIMETypesForType,
            specifierSize: specifierSize,
            specifier: &specifier)
        var types = NSArray()
        try AudioFile.property(
            .MIMETypesForType,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types.flatMap { $0 as? String }
    }
    
    public static func readableTypes() throws -> [UInt32] {
        var size = try AudioFile.globalPropertySize(.ReadableTypes)
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(.ReadableTypes, buffer: &types, size: size)
        return types
    }
    
    public static func typesForExtension(ext: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: ext)
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .TypesForExtension,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(
            .TypesForExtension,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    public static func typesForHFSTypeCode(ext: FourCharCode) throws -> [AudioFileTypeID] {
        var specifier = ext
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .TypesForHFSTypeCode,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(
            .TypesForHFSTypeCode,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    public static func typesForMIMEType(ext: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: ext)
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .TypesForMIMEType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(
            .TypesForMIMEType,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    public static func typesForUTI(ext: String) throws -> [AudioFileTypeID] {
        var specifier = NSString(string: ext)
        let specifierSize = UInt32(sizeofValue(specifier))
        var size = try AudioFile.globalPropertySize(
            .TypesForUTI,
            specifierSize: specifierSize,
            specifier: &specifier )
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(
            .TypesForUTI,
            buffer: &types,
            specifierSize: specifierSize,
            specifier: &specifier,
            size: size)
        return types
    }
    
    public static func UTIsForType(audioFileType: AudioFileType) throws -> [String] {
        var specifier = audioFileType.code
        let specifierSize = UInt32(sizeofValue(specifier))
        let size = try AudioFile.globalPropertySize(
            .UTIsForType,
            specifierSize: specifierSize,
            specifier: &specifier )
        var UTIs = NSArray()
        try AudioFile.property(
            .UTIsForType,
            buffer: &UTIs,
            specifierSize:
            specifierSize,
            specifier: &specifier,
            size: size)
        return UTIs.flatMap { $0 as? String }
    }
    
    public static func writableTypes() throws -> [AudioFileTypeID] {
        var size = try AudioFile.globalPropertySize(.WritableTypes)
        var types = [AudioFileTypeID](count: Int(size) / sizeof(AudioFileTypeID), repeatedValue: 0)
        try AudioFile.property(.WritableTypes, buffer: &types, size: size)
        return types
    }
}