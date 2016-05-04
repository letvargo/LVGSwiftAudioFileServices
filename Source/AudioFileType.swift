//
//  AudioFileType.swift
//  SwiftAudioToolbox
//
//  Created by doof nugget on 1/10/16.
//  Copyright © 2016 letvargo. All rights reserved.
//

import Foundation
import AudioToolbox
import LVGUtilities

public enum AudioFileType: CodedPropertyType {
    
    /// The equivalent of `kAudioFileAAC_ADTSType`.
    case AAC_ADTS
    
    /// The equivalent of `kAudioFileAC3Type`.
    case AC3
    
    /// The equivalent of `kAudioFileAIFCType`.
    case AIFC
    
    /// The equivalent of `kAudioFileAIFFType`.
    case AIFF
    
    /// The equivalent of `kAudioFileAMRType`.
    case AMR
    
    /// The equivalent of `kAudioFileCAFType`.
    case CAF
    
    /// The equivalent of `kAudioFileM4AType`.
    case M4A
    
    /// The equivalent of `kAudioFileMP1Type`.
    case MP1
    
    /// The equivalent of `kAudioFileMP2Type`.
    case MP2
    
    /// The equivalent of `kAudioFileMP3Type`.
    case MP3
    
    /// The equivalent of `kAudioFileMPEG4Type`.
    case MPEG4
    
    /// The equivalent of `kAudioFileNextType`.
    case NeXT
    
    /// The equivalent of `kAudioFile3GPType`.
    case ThreeGP
    
    /// The equivalent of `kAudioFile3GP2Type`.
    case ThreeGP2
    
    /// The equivalent of `kAudioFileSoundDesigner2Type`.
    case SoundDesigner2
    
    /// The equivalent of `kAudioFileWAVEType`.
    case WAVE
    
    /// Initializes an `AudioFileType` using an `AudioFileTypeID`
    /// defined by Audio File Services.
    public init?(code: AudioFileTypeID) {
        switch code {
        case kAudioFileAIFFType             : self = .AIFF
        case kAudioFileAIFCType             : self = .AIFC
        case kAudioFileWAVEType             : self = .WAVE
        case kAudioFileSoundDesigner2Type   : self = .SoundDesigner2
        case kAudioFileNextType             : self = .NeXT
        case kAudioFileMP3Type              : self = .MP3
        case kAudioFileMP2Type              : self = .MP2
        case kAudioFileMP1Type              : self = .MP1
        case kAudioFileAC3Type              : self = .AC3
        case kAudioFileAAC_ADTSType         : self = .AAC_ADTS
        case kAudioFileMPEG4Type            : self = .MPEG4
        case kAudioFileM4AType              : self = .M4A
        case kAudioFileCAFType              : self = .CAF
        case kAudioFile3GPType              : self = .ThreeGP
        case kAudioFile3GP2Type             : self = .ThreeGP2
        case kAudioFileAMRType              : self = .AMR
        default                             : return nil
        }
    }
    
    /// The `AudioFileTypeID` associated with the `AudioFileType`.
    public var code: AudioFileTypeID {
        switch self {
        case .AIFF              : return kAudioFileAIFFType
        case .AIFC              : return kAudioFileAIFCType
        case .WAVE              : return kAudioFileWAVEType
        case .SoundDesigner2    : return kAudioFileSoundDesigner2Type
        case .NeXT              : return kAudioFileNextType
        case .MP3               : return kAudioFileMP3Type
        case .MP2               : return kAudioFileMP2Type
        case .MP1               : return kAudioFileMP1Type
        case .AC3               : return kAudioFileAC3Type
        case .AAC_ADTS          : return kAudioFileAAC_ADTSType
        case .MPEG4             : return kAudioFileMPEG4Type
        case .M4A               : return kAudioFileM4AType
        case .CAF               : return kAudioFileCAFType
        case .ThreeGP           : return kAudioFile3GPType
        case .ThreeGP2          : return kAudioFile3GP2Type
        case .AMR               : return kAudioFileAMRType
        }
    }
    
    /// Returns "Audio File Services Audio File Type" for all cases.
    public var domain: String {
        return "Audio File Services Audio File Type"
    }
    
    /// A short description of the file type.
    public var shortDescription: String {
        switch self {
        case .AAC_ADTS:         return "An Advanced Audio Coding (AAC) Audio Data Transport Stream (ADTS) file."
        case .AC3:              return "An AC-3 file."
        case .AIFC:             return "An Audio Interchange File Format Compressed (AIFF-C) file."
        case .AIFF:             return "An Audio Interchange File Format (AIFF) file."
        case .AMR:              return "An AMR (Adaptive Multi-Rate) file suitable for compressed speech."
        case .CAF:              return "A Core Audio File Format file."
        case .NeXT:             return "A NeXT or Sun Microsystems file."
        case .M4A:              return "An M4A file."
        case .MP1:              return "An MPEG Audio Layer 1 (.mp1) file."
        case .MP2:              return "An MPEG Audio Layer 2 (.mp2) file."
        case .MP3:              return "An MPEG Audio Layer 3 (.mp3) file."
        case .MPEG4:            return "An MPEG 4 file."
        case .ThreeGP:          return "A 3GPP file, suitable for video content on GSM mobile phones."
        case .ThreeGP2:         return "A 3GPP2 file, suitable for video content on CDMA mobile phones."
        case .SoundDesigner2:   return "A Sound Designer II file."
        case .WAVE:             return "A Microsoft WAVE file."
        }
    }
}