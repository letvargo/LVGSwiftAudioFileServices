//
//  AudioFileInfoKey.swift
//  SwiftAudioToolbox
//
//  Created by doof nugget on 1/10/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import AudioToolbox

extension AudioFile {

    /// Retrieve the information for the specified key from the audio file's
    /// info dictionary.
    public func infoForKey(key: AudioFileInfoKey) throws -> String? {
        return try infoDictionary()[key.code] as? String
    }
}

// MARK: AudioFileID.InfoKey

/**
 An enum that represents the keys for accessing an audio file's info dictioanary.
 
 For more information about these keys defined by Audio File Services see the official 
 [Apple Audio File Services documentation](https://developer.apple.com/library/mac/documentation/MusicAudio/Reference/AudioFileConvertRef/index.html#//apple_ref/doc/uid/TP40006072).
 */

public enum AudioFileInfoKey: String, CustomStringConvertible {
    
    /// The equivalent of kAFInfoDictionary_Album
    case Album
    /// The equivalent of kAFInfoDictionary_ApproximateDurationInSeconds
    case ApproximateDurationInSeconds
    /// The equivalent of kAFInfoDictionary_Artist
    case Artist
    /// The equivalent of kAFInfoDictionary_ChannelLayout
    case ChannelLayout
    /// The equivalent of kAFInfoDictionary_Comments
    case Comments
    /// The equivalent of kAFInfoDictionary_Composer
    case Composer
    /// The equivalent of kAFInfoDictionary_Copyright
    case Copyright
    /// The equivalent of kAFInfoDictionary_EncodingApplication
    case EncodingApplication
    /// The equivalent of kAFInfoDictionary_Genre
    case Genre
    /// The equivalent of kAFInfoDictionary_ISRC
    case ISRC
    /// The equivalent of kAFInfoDictionary_KeySignature
    case KeySignature
    /// The equivalent of kAFInfoDictionary_Lyricist
    case Lyricist
    /// The equivalent of kAFInfoDictionary_NominalBitRate
    case NominalBitRate
    /// The equivalent of kAFInfoDictionary_RecordedDate
    case RecordedDate
    /// The equivalent of kAFInfoDictionary_SourceBitDepth
    case SourceBitDepth
    /// The equivalent of kAFInfoDictionary_SourceEncoder
    case SourceEncoder
    /// The equivalent of kAFInfoDictionary_Subtitle
    case Subtitle
    /// The equivalent of kAFInfoDictionary_Tempo
    case Tempo
    /// The equivalent of kAFInfoDictionary_Title
    case Title
    /// The equivalent of kAFInfoDictionary_TimeSignature
    case TimeSignature
    /// The equivalent of kAFInfoDictionary_TrackNumber
    case TrackNumber
    /// The equivalent of kAFInfoDictionary_Year
    case Year

    /// The info key `String`.
    public var code: String {
        switch self {
        case .Artist:                       return kAFInfoDictionary_Artist
        case .Album:                        return kAFInfoDictionary_Album
        case .Tempo:                        return kAFInfoDictionary_Tempo
        case .KeySignature:                 return kAFInfoDictionary_KeySignature
        case .TimeSignature:                return kAFInfoDictionary_TimeSignature
        case .TrackNumber:                  return kAFInfoDictionary_TrackNumber
        case .Year:                         return kAFInfoDictionary_Year
        case .Composer:                     return kAFInfoDictionary_Composer
        case .Lyricist:                     return kAFInfoDictionary_Lyricist
        case .Genre:                        return kAFInfoDictionary_Genre
        case .Title:                        return kAFInfoDictionary_Title
        case .RecordedDate:                 return kAFInfoDictionary_RecordedDate
        case .Comments:                     return kAFInfoDictionary_Comments
        case .Copyright:                    return kAFInfoDictionary_Copyright
        case .SourceEncoder:                return kAFInfoDictionary_SourceEncoder
        case .EncodingApplication:          return kAFInfoDictionary_EncodingApplication
        case .NominalBitRate:               return kAFInfoDictionary_NominalBitRate
        case .ChannelLayout:                return kAFInfoDictionary_ChannelLayout
        case .ApproximateDurationInSeconds: return kAFInfoDictionary_ApproximateDurationInSeconds
        case .SourceBitDepth:               return kAFInfoDictionary_SourceBitDepth
        case .ISRC:                         return kAFInfoDictionary_ISRC
        case .Subtitle:                     return kAFInfoDictionary_SubTitle
        }
    }
    
    /// A description of the info key.
    public var description: String {
        return "Audio File Info Key '\(code))'."
    }
}