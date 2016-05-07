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
    case InfoDictionary
    case ReserveDuration
    case EstimatedDuration
    case BitRate
    case ID3Tag
    case SourceBitDepth
    case AlbumArtwork
    case AudioTrackCount
    case UseAudioTrack
    
    public var domain: String {
        return "Audio File Services Property"
    }
    
    public var shortDescription: String {
        switch self {
        case .FileFormat:
            return "File format"
        case .DataFormat:
            return "Data format"
        case .FormatList:
            return "Format list"
        case .IsOptimized:
            return "Is optimized"
        case .MagicCookieData:
            return "Magic cookie data"
        case .AudioDataByteCount:
            return "Audio data byte count"
        case .AudioDataPacketCount:
            return "Audio data packet count"
        case .MaximumPacketSize:
            return "Maximum packet size"
        case .DataOffset:
            return "Data offset"
        case .ChannelLayout:
            return "Channel layout"
        case .DeferSizeUpdates:
            return "Defer size updates"
        case .MarkerList:
            return "Marker list"
        case .RegionList:
            return "Region list"
        case .PacketToFrame:
            return "Packet to frame"
        case .FrameToPacket:
            return "Frame to packet"
        case .PacketToByte:
            return "Packet to byte"
        case .ByteToPacket:
            return "Byte to packet"
        case .ChunkIDs:
            return "Chunk IDs"
        case .PacketTableInfo:
            return "Packet table info"
        case .InfoDictionary(_):
            return "Info dictionary"
        case .PacketSizeUpperBound:
            return "Packet size upper bound"
        case .ReserveDuration:
            return "Reserve duration"
        case .EstimatedDuration:
            return "Estimated duration"
        case .BitRate:
            return "Bit rate"
        case .ID3Tag:
            return "ID3 tag"
        case .SourceBitDepth:
            return "Source bit depth"
        case .AlbumArtwork:
            return "Album artwork"
        case .AudioTrackCount:
            return "Audio track count"
        case .UseAudioTrack:
            return "Use audio track"
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
        case .InfoDictionary:
            return kAudioFilePropertyInfoDictionary
        case .AlbumArtwork:
            return kAudioFilePropertyAlbumArtwork
        case .ReserveDuration:
            return kAudioFilePropertyReserveDuration
        case .EstimatedDuration:
            return kAudioFilePropertyEstimatedDuration
        case .BitRate:
            return kAudioFilePropertyBitRate
        case .ID3Tag:
            return kAudioFilePropertyID3Tag
        case .SourceBitDepth:
            return kAudioFilePropertySourceBitDepth
        case .AudioTrackCount:
            return kAudioFilePropertyAudioTrackCount
        case .UseAudioTrack:
            return kAudioFilePropertyUseAudioTrack
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
        case kAudioFilePropertyInfoDictionary:
            self = .InfoDictionary
        case kAudioFilePropertyAlbumArtwork:
            self = .AlbumArtwork
        case kAudioFilePropertyReserveDuration:
            self = .ReserveDuration
        case kAudioFilePropertyEstimatedDuration:
            self = .EstimatedDuration
        case kAudioFilePropertyBitRate:
            self = .BitRate
        case kAudioFilePropertyID3Tag:
            self = .ID3Tag
        case kAudioFilePropertySourceBitDepth:
            self = .SourceBitDepth
        case kAudioFilePropertyAudioTrackCount:
            self = .AudioTrackCount
        case kAudioFilePropertyUseAudioTrack:
            self = .UseAudioTrack
        default:
            return nil
        }
    }
}