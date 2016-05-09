//
//  AudioFileProperty.swift
//  SwiftAudioToolbox
//
//  Created by doof nugget on 1/9/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import AudioToolbox
import LVGUtilities

/**
 An enum with cases that correspond to the audio file property constants defined by
 Audio File Services.
 
 For more information about these properties and the constants that identify
 them, see the official [Apple Audio File Services documentation](https://developer.apple.com/library/mac/documentation/MusicAudio/Reference/AudioFileConvertRef/index.html#//apple_ref/doc/uid/TP40006072).
 */

public enum AudioFileProperty: CodedPropertyType {
    
    /// The equivalent of kAudioFilePropertyAlbumArtwork
    case AlbumArtwork
    /// The equivalent of kAudioFilePropertyAudioDataByteCount
    case AudioDataByteCount
    /// The equivalent of kAudioFilePropertyAudioDataPacketCount
    case AudioDataPacketCount
    /// The equivalent of kAudioFilePropertyAudioTrackCount
    case AudioTrackCount
    /// The equivalent of kAudioFilePropertyBitRate
    case BitRate
    /// The equivalent of kAudioFilePropertyByteToPacket
    case ByteToPacket
    /// The equivalent of kAudioFilePropertyChannelLayout
    case ChannelLayout
    /// The equivalent of kAudioFilePropertyChunkIDs
    case ChunkIDs
    /// The equivalent of kAudioFilePropertyDataFormat
    case DataFormat
    /// The equivalent of kAudioFilePropertyDataOffset
    case DataOffset
    /// The equivalent of kAudioFilePropertyDeferSizeUpdates
    case DeferSizeUpdates
    /// The equivalent of kAudioFilePropertyEstimatedDuration
    case EstimatedDuration
    /// The equivalent of kAudioFilePropertyFileFormat
    case FileFormat
    /// The equivalent of kAudioFilePropertyFrameToPacket
    case FrameToPacket
    /// The equivalent of kAudioFilePropertyFormatList
    case FormatList
    /// The equivalent of kAudioFilePropertyID3Tag
    case ID3Tag
    /// The equivalent of kAudioFilePropertyInfoDictionary
    case InfoDictionary
    /// The equivalent of kAudioFilePropertyIsOptimized
    case IsOptimized
    /// The equivalent of kAudioFilePropertyMagicCookieData
    case MagicCookieData
    /// The equivalent of kAudioFilePropertyMarkerList
    case MarkerList
    /// The equivalent of kAudioFilePropertyMaximumPacketSize
    case MaximumPacketSize
    /// The equivalent of kAudioFilePropertyPacketToByte
    case PacketToByte
    /// The equivalent of kAudioFilePropertyPacketToFrame
    case PacketToFrame
    /// The equivalent of kAudioFilePropertyRegionList
    case RegionList
    /// The equivalent of kAudioFilePropertyPacketTableInfo
    case PacketTableInfo
    /// The equivalent of kAudioFilePropertyPacketSizeUpperBound
    case PacketSizeUpperBound
    /// The equivalent of kAudioFilePropertyReserveDuration
    case ReserveDuration
    /// The equivalent of kAudioFilePropertySourceBitDepth
    case SourceBitDepth
    /// The equivalent of kAudioFilePropertyUseAudioTrack
    case UseAudioTrack
    
    /// Initialize an `AudioFileProperty` from an `AudioFilePropertyID`.
    public init?(code: AudioFilePropertyID) {
        switch code {
        case kAudioFilePropertyFileFormat:              self = .FileFormat
        case kAudioFilePropertyDataFormat:              self = .DataFormat
        case kAudioFilePropertyFormatList:              self = .FormatList
        case kAudioFilePropertyIsOptimized:             self = .IsOptimized
        case kAudioFilePropertyMagicCookieData:         self = .MagicCookieData
        case kAudioFilePropertyAudioDataByteCount:      self = .AudioDataByteCount
        case kAudioFilePropertyAudioDataPacketCount:    self = .AudioDataPacketCount
        case kAudioFilePropertyMaximumPacketSize:       self = .MaximumPacketSize
        case kAudioFilePropertyDataOffset:              self = .DataOffset
        case kAudioFilePropertyChannelLayout:           self = .ChannelLayout
        case kAudioFilePropertyDeferSizeUpdates:        self = .DeferSizeUpdates
        case kAudioFilePropertyMarkerList:              self = .MarkerList
        case kAudioFilePropertyRegionList:              self = .RegionList
        case kAudioFilePropertyPacketToFrame:           self = .PacketToFrame
        case kAudioFilePropertyFrameToPacket:           self = .FrameToPacket
        case kAudioFilePropertyPacketToByte:            self = .PacketToByte
        case kAudioFilePropertyByteToPacket:            self = .ByteToPacket
        case kAudioFilePropertyChunkIDs:                self = .ChunkIDs
        case kAudioFilePropertyPacketTableInfo:         self = .PacketTableInfo
        case kAudioFilePropertyPacketSizeUpperBound:    self = .PacketSizeUpperBound
        case kAudioFilePropertyInfoDictionary:          self = .InfoDictionary
        case kAudioFilePropertyAlbumArtwork:            self = .AlbumArtwork
        case kAudioFilePropertyReserveDuration:         self = .ReserveDuration
        case kAudioFilePropertyEstimatedDuration:       self = .EstimatedDuration
        case kAudioFilePropertyBitRate:                 self = .BitRate
        case kAudioFilePropertyID3Tag:                  self = .ID3Tag
        case kAudioFilePropertySourceBitDepth:          self = .SourceBitDepth
        case kAudioFilePropertyAudioTrackCount:         self = .AudioTrackCount
        case kAudioFilePropertyUseAudioTrack:           self = .UseAudioTrack
        default:                                        return nil
        }
    }
    
    /// The audio file property ID constant as defined in Audio File Services.
    public var code: UInt32 {
        switch self {
        case .FileFormat:           return kAudioFilePropertyFileFormat
        case .DataFormat:           return kAudioFilePropertyDataFormat
        case .FormatList:           return kAudioFilePropertyFormatList
        case .IsOptimized:          return kAudioFilePropertyIsOptimized
        case .MagicCookieData:      return kAudioFilePropertyMagicCookieData
        case .AudioDataByteCount:   return kAudioFilePropertyAudioDataByteCount
        case .AudioDataPacketCount: return kAudioFilePropertyAudioDataPacketCount
        case .MaximumPacketSize:    return kAudioFilePropertyMaximumPacketSize
        case .DataOffset:           return kAudioFilePropertyDataOffset
        case .ChannelLayout:        return kAudioFilePropertyChannelLayout
        case .DeferSizeUpdates:     return kAudioFilePropertyDeferSizeUpdates
        case .MarkerList:           return kAudioFilePropertyMarkerList
        case .RegionList:           return kAudioFilePropertyRegionList
        case .PacketToFrame:        return kAudioFilePropertyPacketToFrame
        case .FrameToPacket:        return kAudioFilePropertyFrameToPacket
        case .PacketToByte:         return kAudioFilePropertyPacketToByte
        case .ByteToPacket:         return kAudioFilePropertyByteToPacket
        case .ChunkIDs:             return kAudioFilePropertyChunkIDs
        case .PacketTableInfo:      return kAudioFilePropertyPacketTableInfo
        case .PacketSizeUpperBound: return kAudioFilePropertyPacketSizeUpperBound
        case .InfoDictionary:       return kAudioFilePropertyInfoDictionary
        case .AlbumArtwork:         return kAudioFilePropertyAlbumArtwork
        case .ReserveDuration:      return kAudioFilePropertyReserveDuration
        case .EstimatedDuration:    return kAudioFilePropertyEstimatedDuration
        case .BitRate:              return kAudioFilePropertyBitRate
        case .ID3Tag:               return kAudioFilePropertyID3Tag
        case .SourceBitDepth:       return kAudioFilePropertySourceBitDepth
        case .AudioTrackCount:      return kAudioFilePropertyAudioTrackCount
        case .UseAudioTrack:        return kAudioFilePropertyUseAudioTrack
        }
    }
    
    /// Returns "Audio File Services Property" for all cases.
    public var domain: String {
        return "Audio File Services Property"
    }
    
    /// A short description of the property.
    public var shortDescription: String {
        switch self {
        case .FileFormat:               return "File format"
        case .DataFormat:               return "Data format"
        case .FormatList:               return "Format list"
        case .IsOptimized:              return "Is optimized"
        case .MagicCookieData:          return "Magic cookie data"
        case .AudioDataByteCount:       return "Audio data byte count"
        case .AudioDataPacketCount:     return "Audio data packet count"
        case .MaximumPacketSize:        return "Maximum packet size"
        case .DataOffset:               return "Data offset"
        case .ChannelLayout:            return "Channel layout"
        case .DeferSizeUpdates:         return "Defer size updates"
        case .MarkerList:               return "Marker list"
        case .RegionList:               return "Region list"
        case .PacketToFrame:            return "Packet to frame"
        case .FrameToPacket:            return "Frame to packet"
        case .PacketToByte:             return "Packet to byte"
        case .ByteToPacket:             return "Byte to packet"
        case .ChunkIDs:                 return "Chunk IDs"
        case .PacketTableInfo:          return "Packet table info"
        case .InfoDictionary:           return "Info dictionary"
        case .PacketSizeUpperBound:     return "Packet size upper bound"
        case .ReserveDuration:          return "Reserve duration"
        case .EstimatedDuration:        return "Estimated duration"
        case .BitRate:                  return "Bit rate"
        case .ID3Tag:                   return "ID3 tag"
        case .SourceBitDepth:           return "Source bit depth"
        case .AlbumArtwork:             return "Album artwork"
        case .AudioTrackCount:          return "Audio track count"
        case .UseAudioTrack:            return "Use audio track"
        }
    }
}