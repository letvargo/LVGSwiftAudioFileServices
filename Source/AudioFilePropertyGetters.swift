//
//  AudioFilePropertyGetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import AudioToolbox

extension AudioFile {

    // Access the specified property and update the value.
    fileprivate func property<T>(
        _ property: AudioFileProperty,
        value: UnsafeMutablePointer<T>,
        size inSize: UInt32? = nil) throws {
        
        var size = try inSize ?? self.propertySize(property)
        try Error.check(
            AudioFileGetProperty(
                self.audioFileID,
                property.code,
                &size,
                value),
            message: "An error occurred while getting the property '\(property.shortDescription)'." )
    }
    /// Get the album artwork property.
    ///
    /// - returns: An `NSData?` object containing the artwork data. The method
    /// will return `nil` if there is no album artwork.
    /// - throws: `AudioFileError`
    public func albumArtwork() throws -> Data? {
    
        let size = try self.propertySize(.albumArtwork)
        
        guard size != 0 else { return nil }
        
        var buffer = [UInt8](repeating: 0, count: Int(size))
        try property(.albumArtwork, value: &buffer, size: size)
        
        return Data(bytes: UnsafePointer<UInt8>(buffer), count: Int(size))
    }
    
    /// Get the number of bytes of audio data in the file.
    ///
    /// - returns: The number of bytes as a `UInt`.
    /// - throws: `AudioFileError`
    public func audioDataByteCount() throws -> UInt {
    
        var count: UInt = 0
        try property(.audioDataByteCount, value: &count)
        
        return count
    }

    /// Get the number of packets of audio data in the file.
    ///
    /// - returns: The number of packets as a `UInt`.
    /// - throws: `AudioFileError`
    public func audioDataPacketCount() throws -> UInt {
        var count: UInt = 0
        try property(.audioDataPacketCount, value: &count)
        return count
    }
    
    /// Get the number of audio tracks.
    ///
    /// - returns: The number of audio tracks as a `UInt32`.
    /// - throws: `AudioFileError`
    public func audioTrackCount() throws -> UInt32 {
        var count: UInt32 = 0
        try property(.audioTrackCount, value: &count)
        return count
    }
    
    /// Get the audio file's bit rate.
    ///
    /// - returns: The bit rate of the audio file.
    /// - throws: `AudioFileError`
    public func bitRate() throws -> UInt32 {
        var rate: UInt32 = 0
        try property(.bitRate, value: &rate)
        return rate
    }
    
    /// Get the audio file's bit rate.
    ///
    /// - parameter: The bit rate of the audio file.
    /// - throws: `AudioFileError`
    public func byteToPacket(_ translation: inout AudioBytePacketTranslation) throws {
        let size = UInt32(MemoryLayout.size(ofValue: translation))
        try property(.byteToPacket, value: &translation, size: size)
    }
    
    public func channelLayout() throws -> AudioChannelLayout {
        var layout = AudioChannelLayout()
        try property(.channelLayout, value: &layout)
        return layout
    }
    
    public func chunkIDs() throws -> [FourCharCode] {
        let size = try propertySize(.chunkIDs)
        var chunks = [FourCharCode](
            repeating: 0,
            count: Int(size) / sizeof(FourCharCode) )
        try property(.chunkIDs, value: &chunks, size: size)
        return chunks
    }
    
    public func dataFormat() throws -> AudioStreamBasicDescription {
        var format = AudioStreamBasicDescription()
        try property(.dataFormat, value: &format)
        return format
    }
    
    public func dataOffset() throws -> Int {
        var offset = 0
        try property(.dataOffset, value: &offset)
        return offset
    }
    
    public func deferSizeUpdates() throws -> Bool {
        var deferUpdates: UInt32 = 0
        try property(.deferSizeUpdates, value: &deferUpdates)
        return deferUpdates == 1
    }
    
    public func estimatedDuration() throws -> Double {
        var duration: Double = 0
        try property(.estimatedDuration, value: &duration)
        return duration
    }

    public func fileFormat() throws -> AudioFileTypeID {
        var type: AudioFileTypeID = 0
        try property(.fileFormat, value: &type)
        return type
    }
    
    public func fileType() throws -> AudioFileType {
        let typeID: AudioFileTypeID = try self.fileFormat()
        guard let fileType = AudioFileType(code: typeID) else {
            throw AudioFileError(
                status: Int32.max,
                message: "fileFormat() method returned an unknown file type: \n\tAudioFileTypeID: \(typeID)\n\tcode: '\(typeID.codeString ?? String("None"))'")
        }
        return fileType
    }

    public func formatList() throws -> [AudioFormatListItem] {
        let size = try propertySize(.formatList)
        var list = [AudioFormatListItem](
            repeating: AudioFormatListItem(),
            count: Int(size) / sizeof(AudioFormatListItem))
        try property(.formatList, value: &list, size: size)
        return list
    }
    
    public func frameToPacket(_ translation: inout AudioFramePacketTranslation) throws {
        let size = UInt32(MemoryLayout.size(ofValue: translation))
        try property(.frameToPacket, value: &translation, size: size)
    }
    
    public func id3Tag() throws -> [UInt8] {
        let size = try propertyInfo(.id3Tag).size
        var tag = [UInt8](repeating: 0,count: Int(size))
        try property(.id3Tag, value: &tag, size: size)
        return tag
    }
    
    public func infoDictionary() throws -> [String: AnyObject] {
        var dictionary = NSDictionary()
        try property(.infoDictionary, value: &dictionary)
        return dictionary as? [String: AnyObject] ?? [:]
    }

    public func isOptimized() throws -> Bool {
        var isOptimized: UInt32 = 0
        try property(.isOptimized, value: &isOptimized)
        return isOptimized == 1
    }

    public func magicCookieData() throws -> [UInt8] {
        let size = try propertyInfo(.magicCookieData).size
        var data = [UInt8](repeating: 0, count: Int(size))
        try property(.magicCookieData, value: &data, size: size)
        return data
    }
    
    public func markerList() throws -> AudioFileMarkerList {
        var list = AudioFileMarkerList()
        try property(.markerList, value: &list)
        return list
    }

    public func maximumPacketSize() throws -> UInt32 {
        var maxSize: UInt32 = 0
        try property(.maximumPacketSize, value: &maxSize)
        return maxSize
    }
    
    public func packetSizeUpperBound() throws -> UInt32 {
        var bound: UInt32 = 0
        try property(.packetSizeUpperBound, value: &bound)
        return bound
    }
    
    public func packetTableInfo() throws -> AudioFilePacketTableInfo {
        var table = AudioFilePacketTableInfo()
        try property(.packetTableInfo, value: &table)
        return table
    }
    
    public func packetToByte(_ translation: inout AudioBytePacketTranslation) throws {
        let size = UInt32(MemoryLayout.size(ofValue: translation))
        try property(.packetToByte, value: &translation, size: size)
    }
    
    public func packetToFrame(_ translation: inout AudioFramePacketTranslation) throws {
        let size = UInt32(MemoryLayout.size(ofValue: translation))
        try property(.packetToFrame, value: &translation, size: size)
    }

    public func regionList() throws -> AudioFileRegionList {
        var list = AudioFileRegionList()
        try property(.regionList, value: &list)
        return list
    }
    
    public func reserveDuration() throws -> Double {
        var duration: Double = 0
        try property(.reserveDuration, value: &duration)
        return duration
    }
    
    public func sourceBitDepth() throws -> Int32 {
        var depth: Int32 = 0
        try property(.sourceBitDepth, value: &depth)
        return depth
    }
}
