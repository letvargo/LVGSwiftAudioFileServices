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
    case albumArtwork
    /// The equivalent of kAudioFilePropertyAudioDataByteCount
    case audioDataByteCount
    /// The equivalent of kAudioFilePropertyAudioDataPacketCount
    case audioDataPacketCount
    /// The equivalent of kAudioFilePropertyAudioTrackCount
    case audioTrackCount
    /// The equivalent of kAudioFilePropertyBitRate
    case bitRate
    /// The equivalent of kAudioFilePropertyByteToPacket
    case byteToPacket
    /// The equivalent of kAudioFilePropertyChannelLayout
    case channelLayout
    /// The equivalent of kAudioFilePropertyChunkIDs
    case chunkIDs
    /// The equivalent of kAudioFilePropertyDataFormat
    case dataFormat
    /// The equivalent of kAudioFilePropertyDataOffset
    case dataOffset
    /// The equivalent of kAudioFilePropertyDeferSizeUpdates
    case deferSizeUpdates
    /// The equivalent of kAudioFilePropertyEstimatedDuration
    case estimatedDuration
    /// The equivalent of kAudioFilePropertyFileFormat
    case fileFormat
    /// The equivalent of kAudioFilePropertyFrameToPacket
    case frameToPacket
    /// The equivalent of kAudioFilePropertyFormatList
    case formatList
    /// The equivalent of kAudioFilePropertyID3Tag
    case id3Tag
    /// The equivalent of kAudioFilePropertyInfoDictionary
    case infoDictionary
    /// The equivalent of kAudioFilePropertyIsOptimized
    case isOptimized
    /// The equivalent of kAudioFilePropertyMagicCookieData
    case magicCookieData
    /// The equivalent of kAudioFilePropertyMarkerList
    case markerList
    /// The equivalent of kAudioFilePropertyMaximumPacketSize
    case maximumPacketSize
    /// The equivalent of kAudioFilePropertyPacketToByte
    case packetToByte
    /// The equivalent of kAudioFilePropertyPacketToFrame
    case packetToFrame
    /// The equivalent of kAudioFilePropertyRegionList
    case regionList
    /// The equivalent of kAudioFilePropertyPacketTableInfo
    case packetTableInfo
    /// The equivalent of kAudioFilePropertyPacketSizeUpperBound
    case packetSizeUpperBound
    /// The equivalent of kAudioFilePropertyReserveDuration
    case reserveDuration
    /// The equivalent of kAudioFilePropertySourceBitDepth
    case sourceBitDepth
    /// The equivalent of kAudioFilePropertyUseAudioTrack
    case useAudioTrack
    
    /// Initialize an `AudioFileProperty` from an `AudioFilePropertyID`.
    public init?(code: AudioFilePropertyID) {
        switch code {
        case kAudioFilePropertyFileFormat:              self = .fileFormat
        case kAudioFilePropertyDataFormat:              self = .dataFormat
        case kAudioFilePropertyFormatList:              self = .formatList
        case kAudioFilePropertyIsOptimized:             self = .isOptimized
        case kAudioFilePropertyMagicCookieData:         self = .magicCookieData
        case kAudioFilePropertyAudioDataByteCount:      self = .audioDataByteCount
        case kAudioFilePropertyAudioDataPacketCount:    self = .audioDataPacketCount
        case kAudioFilePropertyMaximumPacketSize:       self = .maximumPacketSize
        case kAudioFilePropertyDataOffset:              self = .dataOffset
        case kAudioFilePropertyChannelLayout:           self = .channelLayout
        case kAudioFilePropertyDeferSizeUpdates:        self = .deferSizeUpdates
        case kAudioFilePropertyMarkerList:              self = .markerList
        case kAudioFilePropertyRegionList:              self = .regionList
        case kAudioFilePropertyPacketToFrame:           self = .packetToFrame
        case kAudioFilePropertyFrameToPacket:           self = .frameToPacket
        case kAudioFilePropertyPacketToByte:            self = .packetToByte
        case kAudioFilePropertyByteToPacket:            self = .byteToPacket
        case kAudioFilePropertyChunkIDs:                self = .chunkIDs
        case kAudioFilePropertyPacketTableInfo:         self = .packetTableInfo
        case kAudioFilePropertyPacketSizeUpperBound:    self = .packetSizeUpperBound
        case kAudioFilePropertyInfoDictionary:          self = .infoDictionary
        case kAudioFilePropertyAlbumArtwork:            self = .albumArtwork
        case kAudioFilePropertyReserveDuration:         self = .reserveDuration
        case kAudioFilePropertyEstimatedDuration:       self = .estimatedDuration
        case kAudioFilePropertyBitRate:                 self = .bitRate
        case kAudioFilePropertyID3Tag:                  self = .id3Tag
        case kAudioFilePropertySourceBitDepth:          self = .sourceBitDepth
        case kAudioFilePropertyAudioTrackCount:         self = .audioTrackCount
        case kAudioFilePropertyUseAudioTrack:           self = .useAudioTrack
        default:                                        return nil
        }
    }
    
    /// The audio file property ID constant as defined in Audio File Services.
    public var code: UInt32 {
        switch self {
        case .fileFormat:           return kAudioFilePropertyFileFormat
        case .dataFormat:           return kAudioFilePropertyDataFormat
        case .formatList:           return kAudioFilePropertyFormatList
        case .isOptimized:          return kAudioFilePropertyIsOptimized
        case .magicCookieData:      return kAudioFilePropertyMagicCookieData
        case .audioDataByteCount:   return kAudioFilePropertyAudioDataByteCount
        case .audioDataPacketCount: return kAudioFilePropertyAudioDataPacketCount
        case .maximumPacketSize:    return kAudioFilePropertyMaximumPacketSize
        case .dataOffset:           return kAudioFilePropertyDataOffset
        case .channelLayout:        return kAudioFilePropertyChannelLayout
        case .deferSizeUpdates:     return kAudioFilePropertyDeferSizeUpdates
        case .markerList:           return kAudioFilePropertyMarkerList
        case .regionList:           return kAudioFilePropertyRegionList
        case .packetToFrame:        return kAudioFilePropertyPacketToFrame
        case .frameToPacket:        return kAudioFilePropertyFrameToPacket
        case .packetToByte:         return kAudioFilePropertyPacketToByte
        case .byteToPacket:         return kAudioFilePropertyByteToPacket
        case .chunkIDs:             return kAudioFilePropertyChunkIDs
        case .packetTableInfo:      return kAudioFilePropertyPacketTableInfo
        case .packetSizeUpperBound: return kAudioFilePropertyPacketSizeUpperBound
        case .infoDictionary:       return kAudioFilePropertyInfoDictionary
        case .albumArtwork:         return kAudioFilePropertyAlbumArtwork
        case .reserveDuration:      return kAudioFilePropertyReserveDuration
        case .estimatedDuration:    return kAudioFilePropertyEstimatedDuration
        case .bitRate:              return kAudioFilePropertyBitRate
        case .id3Tag:               return kAudioFilePropertyID3Tag
        case .sourceBitDepth:       return kAudioFilePropertySourceBitDepth
        case .audioTrackCount:      return kAudioFilePropertyAudioTrackCount
        case .useAudioTrack:        return kAudioFilePropertyUseAudioTrack
        }
    }
    
    /// Returns "Audio File Services Property" for all cases.
    public var domain: String {
        return "Audio File Services Property"
    }
    
    /// A short description of the property.
    public var shortDescription: String {
        switch self {
        case .fileFormat:               return "File format"
        case .dataFormat:               return "Data format"
        case .formatList:               return "Format list"
        case .isOptimized:              return "Is optimized"
        case .magicCookieData:          return "Magic cookie data"
        case .audioDataByteCount:       return "Audio data byte count"
        case .audioDataPacketCount:     return "Audio data packet count"
        case .maximumPacketSize:        return "Maximum packet size"
        case .dataOffset:               return "Data offset"
        case .channelLayout:            return "Channel layout"
        case .deferSizeUpdates:         return "Defer size updates"
        case .markerList:               return "Marker list"
        case .regionList:               return "Region list"
        case .packetToFrame:            return "Packet to frame"
        case .frameToPacket:            return "Frame to packet"
        case .packetToByte:             return "Packet to byte"
        case .byteToPacket:             return "Byte to packet"
        case .chunkIDs:                 return "Chunk IDs"
        case .packetTableInfo:          return "Packet table info"
        case .infoDictionary:           return "Info dictionary"
        case .packetSizeUpperBound:     return "Packet size upper bound"
        case .reserveDuration:          return "Reserve duration"
        case .estimatedDuration:        return "Estimated duration"
        case .bitRate:                  return "Bit rate"
        case .id3Tag:                   return "ID3 tag"
        case .sourceBitDepth:           return "Source bit depth"
        case .albumArtwork:             return "Album artwork"
        case .audioTrackCount:          return "Audio track count"
        case .useAudioTrack:            return "Use audio track"
        }
    }
}
