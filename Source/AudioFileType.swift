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
    case aac_ADTS
    
    /// The equivalent of `kAudioFileAC3Type`.
    case ac3
    
    /// The equivalent of `kAudioFileAIFCType`.
    case aifc
    
    /// The equivalent of `kAudioFileAIFFType`.
    case aiff
    
    /// The equivalent of `kAudioFileAMRType`.
    case amr
    
    /// The equivalent of `kAudioFileCAFType`.
    case caf
    
    /// The equivalent of `kAudioFileM4AType`.
    case m4A
    
    /// The equivalent of `kAudioFileMP1Type`.
    case mp1
    
    /// The equivalent of `kAudioFileMP2Type`.
    case mp2
    
    /// The equivalent of `kAudioFileMP3Type`.
    case mp3
    
    /// The equivalent of `kAudioFileMPEG4Type`.
    case mpeg4
    
    /// The equivalent of `kAudioFileNextType`.
    case neXT
    
    /// The equivalent of `kAudioFile3GPType`.
    case threeGP
    
    /// The equivalent of `kAudioFile3GP2Type`.
    case threeGP2
    
    /// The equivalent of `kAudioFileSoundDesigner2Type`.
    case soundDesigner2
    
    /// The equivalent of `kAudioFileWAVEType`.
    case wave
    
    /// Initializes an `AudioFileType` using an `AudioFileTypeID`
    /// defined by Audio File Services.
    public init?(code: AudioFileTypeID) {
        switch code {
        case kAudioFileAIFFType             : self = .aiff
        case kAudioFileAIFCType             : self = .aifc
        case kAudioFileWAVEType             : self = .wave
        case kAudioFileSoundDesigner2Type   : self = .soundDesigner2
        case kAudioFileNextType             : self = .neXT
        case kAudioFileMP3Type              : self = .mp3
        case kAudioFileMP2Type              : self = .mp2
        case kAudioFileMP1Type              : self = .mp1
        case kAudioFileAC3Type              : self = .ac3
        case kAudioFileAAC_ADTSType         : self = .aac_ADTS
        case kAudioFileMPEG4Type            : self = .mpeg4
        case kAudioFileM4AType              : self = .m4A
        case kAudioFileCAFType              : self = .caf
        case kAudioFile3GPType              : self = .threeGP
        case kAudioFile3GP2Type             : self = .threeGP2
        case kAudioFileAMRType              : self = .amr
        default                             : return nil
        }
    }
    
    /// The `AudioFileTypeID` associated with the `AudioFileType`.
    public var code: AudioFileTypeID {
        switch self {
        case .aiff              : return kAudioFileAIFFType
        case .aifc              : return kAudioFileAIFCType
        case .wave              : return kAudioFileWAVEType
        case .soundDesigner2    : return kAudioFileSoundDesigner2Type
        case .neXT              : return kAudioFileNextType
        case .mp3               : return kAudioFileMP3Type
        case .mp2               : return kAudioFileMP2Type
        case .mp1               : return kAudioFileMP1Type
        case .ac3               : return kAudioFileAC3Type
        case .aac_ADTS          : return kAudioFileAAC_ADTSType
        case .mpeg4             : return kAudioFileMPEG4Type
        case .m4A               : return kAudioFileM4AType
        case .caf               : return kAudioFileCAFType
        case .threeGP           : return kAudioFile3GPType
        case .threeGP2          : return kAudioFile3GP2Type
        case .amr               : return kAudioFileAMRType
        }
    }
    
    /// Returns "Audio File Services Audio File Type" for all cases.
    public var domain: String {
        return "Audio File Services Audio File Type"
    }
    
    /// A short description of the file type.
    public var shortDescription: String {
        switch self {
        case .aac_ADTS:         return "An Advanced Audio Coding (AAC) Audio Data Transport Stream (ADTS) file."
        case .ac3:              return "An AC-3 file."
        case .aifc:             return "An Audio Interchange File Format Compressed (AIFF-C) file."
        case .aiff:             return "An Audio Interchange File Format (AIFF) file."
        case .amr:              return "An AMR (Adaptive Multi-Rate) file suitable for compressed speech."
        case .caf:              return "A Core Audio File Format file."
        case .neXT:             return "A NeXT or Sun Microsystems file."
        case .m4A:              return "An M4A file."
        case .mp1:              return "An MPEG Audio Layer 1 (.mp1) file."
        case .mp2:              return "An MPEG Audio Layer 2 (.mp2) file."
        case .mp3:              return "An MPEG Audio Layer 3 (.mp3) file."
        case .mpeg4:            return "An MPEG 4 file."
        case .threeGP:          return "A 3GPP file, suitable for video content on GSM mobile phones."
        case .threeGP2:         return "A 3GPP2 file, suitable for video content on CDMA mobile phones."
        case .soundDesigner2:   return "A Sound Designer II file."
        case .wave:             return "A Microsoft WAVE file."
        }
    }
}
