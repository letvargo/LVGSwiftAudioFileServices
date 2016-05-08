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

    private func property<T>(property: AudioFileProperty, value: UnsafeMutablePointer<T>, size inSize: UInt32? = nil) throws {
        var size = try inSize ?? propertySize(property)
        
        try Error.check(
            AudioFileGetProperty(
                self.audioFileID,
                property.code,
                &size,
                value),
            message: "An error occurred while getting the property '\(property.shortDescription)'." )
    }
    
    public func albumArtwork() throws -> NSData {
        let size = try propertySize(.AlbumArtwork)
        var buffer = [UInt8](count: Int(size), repeatedValue: 0)
        try property(.AlbumArtwork, value: &buffer, size: size)
        return NSData(bytes: buffer, length: Int(size))
    }
    
    public func audioDataByteCount() throws -> UInt {
        var count: UInt = 0
        try property(.AudioDataByteCount, value: &count)
        return count
    }

    public func audioDataPacketCount() throws -> UInt {
        var count: UInt = 0
        try property(.AudioDataPacketCount, value: &count)
        return count
    }
    
    public func audioTrackCount() throws -> UInt32 {
        var count: UInt32 = 0
        try property(.AudioTrackCount, value: &count)
        return count
    }
    
    public func bitRate() throws -> UInt32 {
        var rate: UInt32 = 0
        try property(.BitRate, value: &rate)
        return rate
    }
    
    public func byteToPacket(inout translation: AudioBytePacketTranslation) throws {
        let size = UInt32(sizeofValue(translation))
        try property(.ByteToPacket, value: &translation, size: size)
    }
    
    public func channelLayout() throws -> AudioChannelLayout {
        var layout = AudioChannelLayout()
        try property(.ChannelLayout, value: &layout)
        return layout
    }
    
    public func chunkIDs() throws -> [FourCharCode] {
        let size = try propertySize(.ChunkIDs)
        var chunks = [FourCharCode](
            count: Int(size) / sizeof(FourCharCode),
            repeatedValue: 0 )
        try property(.ChunkIDs, value: &chunks, size: size)
        return chunks
    }
    
    public func dataFormat() throws -> AudioStreamBasicDescription {
        var format = AudioStreamBasicDescription()
        try property(.DataFormat, value: &format)
        return format
    }
    
    public func dataOffset() throws -> Int {
        var offset = 0
        try property(.DataOffset, value: &offset)
        return offset
    }
    
    public func deferSizeUpdates() throws -> Bool {
        var deferUpdates: UInt32 = 0
        try property(.DeferSizeUpdates, value: &deferUpdates)
        return deferUpdates == 1
    }
    
    public func estimatedDuration() throws -> Double {
        var duration: Double = 0
        try property(.EstimatedDuration, value: &duration)
        return duration
    }

    public func fileFormat() throws -> AudioFileTypeID {
        var type: AudioFileTypeID = 0
        try property(.FileFormat, value: &type)
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
        let size = try propertySize(.FormatList)
        var list = [AudioFormatListItem](
            count: Int(size) / sizeof(AudioFormatListItem),
            repeatedValue: AudioFormatListItem())
        try property(.FormatList, value: &list, size: size)
        return list
    }
    
    public func frameToPacket(inout translation: AudioFramePacketTranslation) throws {
        let size = UInt32(sizeofValue(translation))
        try property(.FrameToPacket, value: &translation, size: size)
    }
    
    public func id3Tag() throws -> [UInt8] {
        let size = try propertyInfo(.ID3Tag).size
        var tag = [UInt8](count: Int(size),repeatedValue: 0)
        try property(.ID3Tag, value: &tag, size: size)
        return tag
    }
    
    public func infoDictionary() throws -> [String: AnyObject] {
        var dictionary = NSDictionary()
        try property(.InfoDictionary, value: &dictionary)
        return dictionary as? [String: AnyObject] ?? [:]
    }

    public func isOptimized() throws -> Bool {
        var isOptimized: UInt32 = 0
        try property(.IsOptimized, value: &isOptimized)
        return isOptimized == 1
    }

    public func magicCookieData() throws -> [UInt8] {
        let size = try propertyInfo(.MagicCookieData).size
        var data = [UInt8](count: Int(size), repeatedValue: 0)
        try property(.MagicCookieData, value: &data, size: size)
        return data
    }
    
    public func markerList() throws -> AudioFileMarkerList {
        var list = AudioFileMarkerList()
        try property(.MarkerList, value: &list)
        return list
    }

    public func maximumPacketSize() throws -> UInt32 {
        var maxSize: UInt32 = 0
        try property(.MaximumPacketSize, value: &maxSize)
        return maxSize
    }
    
    public func packetSizeUpperBound() throws -> UInt32 {
        var bound: UInt32 = 0
        try property(.PacketSizeUpperBound, value: &bound)
        return bound
    }
    
    public func packetTableInfo() throws -> AudioFilePacketTableInfo {
        var table = AudioFilePacketTableInfo()
        try property(.PacketTableInfo, value: &table)
        return table
    }
    
    public func packetToByte(inout translation: AudioBytePacketTranslation) throws {
        let size = UInt32(sizeofValue(translation))
        try property(.PacketToByte, value: &translation, size: size)
    }
    
    public func packetToFrame(inout translation: AudioFramePacketTranslation) throws {
        let size = UInt32(sizeofValue(translation))
        try property(.PacketToFrame, value: &translation, size: size)
    }

    public func regionList() throws -> AudioFileRegionList {
        var list = AudioFileRegionList()
        try property(.RegionList, value: &list)
        return list
    }
    
    public func reserveDuration() throws -> Double {
        var duration: Double = 0
        try property(.ReserveDuration, value: &duration)
        return duration
    }
    
    public func sourceBitDepth() throws -> Int32 {
        var depth: Int32 = 0
        try property(.SourceBitDepth, value: &depth)
        return depth
    }
}