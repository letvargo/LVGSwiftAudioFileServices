//
//  AudioFilePropertyGetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import LVGSwiftAudioFileServices
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

    public func fileFormat() throws -> AudioFileTypeID {
        var type: AudioFileTypeID = 0
        try property(.FileFormat, value: &type)
        return type
    }
    
    public func fileType() throws -> AudioFileType {
        var typeID: AudioFileTypeID = try self.fileFormat()
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
            repeatedValue: AudioFormatListItem() )
        try property(.FormatList, value: &list, size: size)
        return list
    }
    
    public func frameToPacket(inout translation: AudioFramePacketTranslation) throws {
        let size = UInt32(sizeofValue(translation))
        try property(.FrameToPacket, value: &translation, size: size)
    }

    public func isOptimized() throws -> Bool {
        var isOptimized: UInt32 = 0
        try property(.IsOptimized, value: &isOptimized)
        return isOptimized == 1
    }

    public func magicCookieData() throws -> [UInt8] {
        let size = try propertyInfo(.MagicCookieData).size
        var data = [UInt8](
            count: Int(size) / sizeof(UInt8),
            repeatedValue: 0 )
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

//    public var albumArtwork: NSData? {
//        get {
//            return getPropertyNoError(.AlbumArtwork(nil))
//        }
//    }
//
//    public var audioTrackCount: UInt32? {
//        get {
//            return getPropertyNoError(.AudioTrackCount(nil))
//        }
//    }
//
//    public var bitRate: UInt32? {
//        get {
//            return getPropertyNoError(.BitRate(nil))
//        }
//    }
//
//    public var estimatedDuration: Double? {
//        get {
//            return getPropertyNoError(.EstimatedDuration(nil))
//        }
//    }
//
//    public var id3Tag: NSData? {
//        get {
//            return getPropertyNoError(.ID3Tag(nil))
//        }
//    }
//
//    public var infoDictionary: NSDictionary? {
//        get {
//            return getPropertyNoError(.InfoDictionary(nil))
//        }
//    }
//
//    public var reserveDuration: Double? {
//        get {
//            return getPropertyNoError(.ReserveDuration(nil))
//        }
//    }
//
//    public var sourceBitDepth: Int32? {
//        get {
//            return getPropertyNoError(.SourceBitDepth(nil))
//        }
//    }
//
//    private func fetch(code: AudioFilePropertyID, size: UnsafeMutablePointer<UInt32>, data: UnsafeMutablePointer<Void>, property: String) throws {
//
//        try Error.check(
//            AudioFileGetProperty(
//                ptr
//                , code
//                , size
//                , data)
//            , message: "Failed to get property \(property).")
//    }
//
//    public func getProperty<T>(property: AudioFileProperty) throws -> T {
//
//        var size: UInt32 = try getPropertySize(property)
//        var count = 1
//
//        switch property {
//
//        case .AlbumArtwork(_):
//            count = Int(size) / sizeof(UInt8)
//            var buffer = [UInt8](count: count, repeatedValue: 0)
//            try fetch(property.code, size: &size, data: &buffer, property: property.rawValue)
//            let data = NSData(bytes: &buffer, length: count)
//            guard let artwork = data as? T else { throw AudioFileError(status: 0, message: "Type annotation for property \(property.rawValue) needs to be NSData.") }
//            return artwork
//
//        case .AudioTrackCount(_):
//            var data: UInt32 = 0
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let trackCount = data as? T else { throw AudioFileError(status: 0, message: "Type annotation for property \(property.rawValue) needs to be UInt32.") }
//            return trackCount
//
//        case .BitRate(_):
//            var data: UInt32 = 0
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let bitRate = data as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be UInt32.") }
//            return bitRate
//
//        case .EstimatedDuration(_):
//            var data: Double = 0
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let duration = data as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be Double.") }
//            return duration
//
//        case .ID3Tag:
//            count = Int(size) / sizeof(UInt8)
//            var data = [UInt8](count: count, repeatedValue: 0)
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let tag = NSData(bytes: &data, length: count) as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be NSData.") }
//            return tag
//
//        case .InfoDictionary(_):
//            var data = NSDictionary()
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let infoDict = data as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be NSDictionary.") }
//            return infoDict
//
//        case .ReserveDuration(_):
//            var data: Double = 0
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let duration = data as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be Double.") }
//            return duration
//
//        case .SourceBitDepth(_):
//            var data: Int32 = 0
//            try fetch(property.code, size: &size, data: &data, property: property.rawValue)
//            guard let bitDepth = data as? T else { throw AudioFileError(status: 0, message: "Type for property \(property.rawValue) needs to be Int32.") }
//            return bitDepth
//
//        case .UseAudioTrack(_):
//            throw AudioFileError(status: 0, message: "Property \(property.rawValue) is write-only.")
//        }
//    }
}