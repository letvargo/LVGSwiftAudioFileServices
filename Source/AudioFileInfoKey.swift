//
//  AudioFileInfoKey.swift
//  SwiftAudioToolbox
//
//  Created by doof nugget on 1/10/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import Foundation
import AudioToolbox


extension AudioFile {

    public func infoForKey(key: AudioFileInfoKey) throws -> NSString? {
        
        return infoDictionary?[key.code] as? NSString
    }
}

// MARK: AudioFileID.InfoKey

public enum AudioFileInfoKey: String, CustomStringConvertible {
    
    case Artist
    case Album
    case Tempo
    case KeySignature
    case TimeSignature
    case TrackNumber
    case Year
    case Composer
    case Lyricist
    case Genre
    case Title
    case RecordedDate
    case Comments
    case Copyright
    case SourceEncoder
    case EncodingApplication
    case NominalBitRate
    case ChannelLayout
    case ApproximateDurationInSeconds
    case SourceBitDepth
    case ISRC
    case Subtitle
    
    public var description: String {
        
        return "Audio File Info Key \(rawValue). Code: \(code)"
    }

    public var code: String {
        switch self {
        case .Artist:
            return kAFInfoDictionary_Artist
        case .Album:
            return kAFInfoDictionary_Album
        case .Tempo:
            return kAFInfoDictionary_Tempo
        case .KeySignature:
            return kAFInfoDictionary_KeySignature
        case .TimeSignature:
            return kAFInfoDictionary_TimeSignature
        case .TrackNumber:
            return kAFInfoDictionary_TrackNumber
        case .Year:
            return kAFInfoDictionary_Year
        case .Composer:
            return kAFInfoDictionary_Composer
        case .Lyricist:
            return kAFInfoDictionary_Lyricist
        case .Genre:
            return kAFInfoDictionary_Genre
        case .Title:
            return kAFInfoDictionary_Title
        case .RecordedDate:
            return kAFInfoDictionary_RecordedDate
        case .Comments:
            return kAFInfoDictionary_Comments
        case .Copyright:
            return kAFInfoDictionary_Copyright
        case .SourceEncoder:
            return kAFInfoDictionary_SourceEncoder
        case .EncodingApplication:
            return kAFInfoDictionary_EncodingApplication
        case .NominalBitRate:
            return kAFInfoDictionary_NominalBitRate
        case .ChannelLayout:
            return kAFInfoDictionary_ChannelLayout
        case .ApproximateDurationInSeconds:
            return kAFInfoDictionary_ApproximateDurationInSeconds
        case .SourceBitDepth:
            return kAFInfoDictionary_SourceBitDepth
        case .ISRC:
            return kAFInfoDictionary_ISRC
        case .Subtitle:
            return kAFInfoDictionary_SubTitle
        }
    }
}