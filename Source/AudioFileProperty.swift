//
//  AudioFileProperty.swift
//  SwiftAudioToolbox
//
//  Created by doof nugget on 1/9/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import AudioToolbox
import LVGUtilities

public enum AudioFileProperty: CodedPropertyType {
    
    case FileFormat
    case DataFormat
    case FormatList
    case IsOptimized
    case MagicCookieData
    case AudioDataByteCount
    case AudioDataPacketCount
    case MaximumPacketSize
    case DataOffset
    case ChannelLayout
    case DeferSizeUpdates
    case MarkerList
    case RegionList
    case PacketToFrame
    case FrameToPacket
    case PacketToByte
    case ByteToPacket
    case ChunkIDs
    case PacketTableInfo
    case PacketSizeUpperBound
//    case InfoDictionary(NSDictionary?)
//    case ReserveDuration(Double?)
//    case EstimatedDuration(Double?)
//    case BitRate(UInt32?)
//    case ID3Tag(NSData?)
//    case SourceBitDepth(Int32?)
//    case AlbumArtwork(NSData?)
//    case AudioTrackCount(UInt32?)
//    case UseAudioTrack(UInt32?)
    
    public var domain: String {
        return "Audio File Services Property"
    }
    
    public var shortDescription: String {
        switch self {
        case .FileFormat:
            return "File format."
        case .DataFormat:
            return "Data format."
        case .FormatList:
            return "Format list."
        case .IsOptimized:
            return "Is optimized."
        case .MagicCookieData:
            return "Magic cookie data."
        case .AudioDataByteCount:
            return "Audio data byte count."
        case .AudioDataPacketCount:
            return "Audio data packet count."
        case .MaximumPacketSize:
            return "Maximum packet size."
        case .DataOffset:
            return "Data offset."
        case .ChannelLayout:
            return "Channel layout."
        case .DeferSizeUpdates:
            return "Defer size updates."
        case .MarkerList:
            return "Marker list."
        case .RegionList:
            return "Region list."
        case .PacketToFrame:
            return "Packet to frame."
        case .FrameToPacket:
            return "Frame to packet."
        case .PacketToByte:
            return "Packet to byte."
        case .ByteToPacket:
            return "Byte to packet."
        case .ChunkIDs:
            return "Chunk IDs."
        case .PacketTableInfo:
            return "Packet table info."
//        case .InfoDictionary(_):
//            return ("Info Dictionary", kAudioFilePropertyInfoDictionary)
        case .PacketSizeUpperBound:
            return "Packet size upper bound."
//        case .ReserveDuration(_):
//            return ("Reserve Duration", kAudioFilePropertyReserveDuration)
//        case .EstimatedDuration(_):
//            return ("Estimated Duration", kAudioFilePropertyEstimatedDuration)
//        case .BitRate(_):
//            return ("Bit Rate", kAudioFilePropertyBitRate)
//        case .ID3Tag(_):
//            return ("ID3 Tag", kAudioFilePropertyID3Tag)
//        case .SourceBitDepth(_):
//            return ("Source Bit Depth", kAudioFilePropertySourceBitDepth)
//        case .AlbumArtwork(_):
//            return ("Album Artwork", kAudioFilePropertyAlbumArtwork)
//        case .AudioTrackCount(_):
//            return ("Audio Track Count", kAudioFilePropertyAudioTrackCount)
//        case .UseAudioTrack(_):
//            return ("Use Audio Track", kAudioFilePropertyUseAudioTrack)
        }
    }
    
    public var code: UInt32 {
        switch self {
        case .FileFormat:
            return kAudioFilePropertyFileFormat
        case .DataFormat:
            return kAudioFilePropertyDataFormat
        case .FormatList:
            return kAudioFilePropertyFormatList
        case .IsOptimized:
            return kAudioFilePropertyIsOptimized
        case .MagicCookieData:
            return kAudioFilePropertyMagicCookieData
        case .AudioDataByteCount:
            return kAudioFilePropertyAudioDataByteCount
        case .AudioDataPacketCount:
            return kAudioFilePropertyAudioDataPacketCount
        case .MaximumPacketSize:
            return kAudioFilePropertyMaximumPacketSize
        case .DataOffset:
            return kAudioFilePropertyDataOffset
        case .ChannelLayout:
            return kAudioFilePropertyChannelLayout
        case .DeferSizeUpdates:
            return kAudioFilePropertyDeferSizeUpdates
        case .MarkerList:
            return kAudioFilePropertyMarkerList
        case .RegionList:
            return kAudioFilePropertyRegionList
        case .PacketToFrame:
            return kAudioFilePropertyPacketToFrame
        case .FrameToPacket:
            return kAudioFilePropertyFrameToPacket
        case .PacketToByte:
            return kAudioFilePropertyPacketToByte
        case .ByteToPacket:
            return kAudioFilePropertyByteToPacket
        case .ChunkIDs:
            return kAudioFilePropertyChunkIDs
        case .PacketTableInfo:
            return kAudioFilePropertyPacketTableInfo
        case .PacketSizeUpperBound:
            return kAudioFilePropertyPacketSizeUpperBound
        }
    }
    
    public init?(code: AudioFilePropertyID) {
        switch code {
        case kAudioFilePropertyFileFormat:
            self = .FileFormat
        case kAudioFilePropertyDataFormat:
            self = .DataFormat
        case kAudioFilePropertyFormatList:
            self = .FormatList
        case kAudioFilePropertyIsOptimized:
            self = .IsOptimized
        case kAudioFilePropertyMagicCookieData:
            self = .MagicCookieData
        case kAudioFilePropertyAudioDataByteCount:
            self = .AudioDataByteCount
        case kAudioFilePropertyAudioDataPacketCount:
            self = .AudioDataPacketCount
        case kAudioFilePropertyMaximumPacketSize:
            self = .MaximumPacketSize
        case kAudioFilePropertyDataOffset:
            self = .DataOffset
        case kAudioFilePropertyChannelLayout:
            self = .ChannelLayout
        case kAudioFilePropertyDeferSizeUpdates:
            self = .DeferSizeUpdates
        case kAudioFilePropertyMarkerList:
            self = .MarkerList
        case kAudioFilePropertyRegionList:
            self = .RegionList
        case kAudioFilePropertyPacketToFrame:
            self = .PacketToFrame
        case kAudioFilePropertyFrameToPacket:
            self = .FrameToPacket
        case kAudioFilePropertyPacketToByte:
            self = .PacketToByte
        case kAudioFilePropertyByteToPacket:
            self = .ByteToPacket
        case kAudioFilePropertyChunkIDs:
            self = .ChunkIDs
        case kAudioFilePropertyPacketTableInfo:
            self = .PacketTableInfo
        case kAudioFilePropertyPacketSizeUpperBound:
            self = .PacketSizeUpperBound
        default:
            return nil
        }
    }
}

//extension AudioFile {
//
//    public typealias PropertyInfo = (size: UInt32, writable: Bool)
//
//    public func propertyInfo(inPropertyID: AudioFilePropertyID) throws -> PropertyInfo {
//        
//        var size: UInt32 = 0
//        var writable: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetPropertyInfo(
//                self.ptr,
//                inPropertyID,
//                &size,
//                &writable ),
//            message: "An error occurred while getting the property info for property '\(AudioFileProperty(rawValue: inPropertyID)?.shortDescription ?? inPropertyID.description)'" )
//        
//        return (size, writable != 0)
//    }
//    
//    public func propertyInfo(inPropertyID: AudioFileProperty) throws -> PropertyInfo {
//        return try propertyInfo(inPropertyID.code)
//    }
//
//    public func fileFormat() throws -> AudioFileTypeID {
//    
//        var size = try propertyInfo(.FileFormat).size
//        var type: AudioFileTypeID = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.FileFormat.code,
//                &size,
//                &type ),
//            message: "An error occurred while getting the 'fileFormat' property." )
//        
//        return type
//    }
//    
//    public func dataFormat() throws -> AudioStreamBasicDescription {
//        
//        var size = try propertyInfo(.DataFormat).size
//        var format = AudioStreamBasicDescription()
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.FileFormat.code,
//                &size,
//                &format ),
//            message: "An error occurred while getting the 'dataFormat' property." )
//        
//        return format
//    }
//    
//    public func formatList() throws -> [AudioFormatListItem] {
//    
//        var size = try propertyInfo(.FormatList).size
//        var list = [AudioFormatListItem](
//            count: Int(size) / sizeof(AudioFormatListItem),
//            repeatedValue: AudioFormatListItem() )
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.FormatList.code,
//                &size,
//                &list ),
//            message: "An error occurred while getting the 'formatList' property." )
//        
//        return list
//    }
//    
//    public func isOptimized() throws -> Bool {
//        
//        var size = try propertyInfo(.IsOptimized).size
//        var isOptimized: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.FileFormat.code,
//                &size,
//                &isOptimized ),
//            message: "An error occurred while getting the 'isOptimized' property." )
//        
//        return isOptimized == 1
//    }
//    
//    public func magicCookieData() throws -> [UInt8] {
//        
//        var size = try propertyInfo(.MagicCookieData).size
//        var data = [UInt8](
//            count: Int(size) / sizeof(UInt8),
//            repeatedValue: 0 )
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.MagicCookieData.code,
//                &size,
//                &data ),
//            message: "An error occurred while getting the 'magicCookieData' property." )
//        
//        return data
//    }
//    
//    public func audioDataByteCount() throws -> UInt {
//        
//        var size = try propertyInfo(.AudioDataByteCount).size
//        var count: UInt = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.AudioDataByteCount.code,
//                &size,
//                &count ),
//            message: "An error occurred while getting the 'audioDataByteCount' property." )
//        
//        return count
//    }
//    
//    public func audioDataPacketCount() throws -> UInt {
//        
//        var size = try propertyInfo(.AudioDataPacketCount).size
//        var count: UInt = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.AudioDataPacketCount.code,
//                &size,
//                &count ),
//            message: "An error occurred while getting the 'audioDataPacketCount' property." )
//        
//        return count
//    }
//    
//    public func maximumPacketSize() throws -> UInt32 {
//        
//        var size = try propertyInfo(.MaximumPacketSize).size
//        var maxSize: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.MaximumPacketSize.code,
//                &size,
//                &maxSize ),
//            message: "An error occurred while getting the 'maximumPacketSize' property." )
//        
//        return maxSize
//    }
//    
//    public func dataOffset() throws -> Int {
//        
//        var size = try propertyInfo(.DataOffset).size
//        var offset = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.DataOffset.code,
//                &size,
//                &offset ),
//            message: "An error occurred while getting the 'dataOffset' property." )
//        
//        return offset
//    }
//    
//    public func channelLayout() throws -> AudioChannelLayout {
//        
//        var size = try propertyInfo(.ChannelLayout).size
//        var layout = AudioChannelLayout()
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.ChannelLayout.code,
//                &size,
//                &layout ),
//            message: "An error occurred while getting the 'channelLayout' property." )
//        
//        return layout
//    }
//    
//    public func deferSizeUpdates() throws -> Bool {
//        
//        var size = try propertyInfo(.DeferSizeUpdates).size
//        var deferUpdates: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.DeferSizeUpdates.code,
//                &size,
//                &deferUpdates ),
//            message: "An error occurred while getting the 'deferSizeUpdates' property." )
//        
//        return deferUpdates == 1
//    }
//    
//    public func markerList() throws -> AudioFileMarkerList {
//        
//        var size = try propertyInfo(.MarkerList).size
//        var list = AudioFileMarkerList()
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.MarkerList.code,
//                &size,
//                &list ),
//            message: "An error occurred while getting the 'markerList' property." )
//        
//        return list
//    }
//    
//    public func regionList() throws -> AudioFileRegionList {
//        
//        var size = try propertyInfo(.RegionList).size
//        var list = AudioFileRegionList()
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.RegionList.code,
//                &size,
//                &list ),
//            message: "An error occurred while getting the 'regionList' property." )
//        
//        return list
//    }
//    
//    public func packetToFrame(inout translation: AudioFramePacketTranslation) throws {
//        
//        var size = UInt32(sizeofValue(translation))
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.PacketToFrame.code,
//                &size,
//                &translation ),
//            message: "An error occurred while getting the 'packetToFrame' property." )
//    }
//    
//    public func frameToPacket(inout translation: AudioFramePacketTranslation) throws {
//        
//        var size = UInt32(sizeofValue(translation))
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.FrameToPacket.code,
//                &size,
//                &translation ),
//            message: "An error occurred while getting the 'frameToPacket' property." )
//    }
//    
//    public func packetToByte(inout translation: AudioBytePacketTranslation) throws {
//        
//        var size = UInt32(sizeofValue(translation))
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.PacketToByte.code,
//                &size,
//                &translation ),
//            message: "An error occurred while getting the 'packetToByte' property." )
//    }
//    
//    public func byteToPacket(inout translation: AudioBytePacketTranslation) throws {
//        
//        var size = UInt32(sizeofValue(translation))
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.ByteToPacket.code,
//                &size,
//                &translation ),
//            message: "An error occurred while getting the 'byteToPacket' property." )
//    }
//    
//    public func chunkIDs() throws -> [FourCharCode] {
//        
//        var size = try propertyInfo(.ChunkIDs).size
//        var chunks = [FourCharCode](
//            count: Int(size) / sizeof(FourCharCode),
//            repeatedValue: 0 )
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.ChunkIDs.code,
//                &size,
//                &chunks ),
//            message: "An error occurred while getting the 'chunkIDs' property." )
//        
//        return chunks
//    }
//    
//    public func packetTableInfo() throws -> AudioFilePacketTableInfo {
//        
//        var size = try propertyInfo(.PacketTableInfo).size
//        var table = AudioFilePacketTableInfo()
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.PacketTableInfo.code,
//                &size,
//                &table ),
//            message: "An error occurred while getting the 'packetTableInfo' property." )
//        
//        return table
//    }
//    
//    public func packetSizeUpperBound() throws -> UInt32 {
//        
//        var size = try propertyInfo(.PacketSizeUpperBound).size
//        var bound: UInt32 = 0
//        
//        try Error.check(
//            AudioFileGetProperty(
//                self.ptr,
//                AudioFileProperty.PacketSizeUpperBound.code,
//                &size,
//                &bound ),
//            message: "An error occurred while getting the 'packetSizeUpperBound' property." )
//        
//        return bound
//    }

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
//}