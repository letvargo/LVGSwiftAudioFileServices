//
//  AudioFilePropertyInfoExtension.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import LVGSwiftAudioFileServices
import AudioToolbox

extension AudioFile {
    
    // MARK: AudioFile Property Information

    public func propertyInfo(property: AudioFileProperty) throws -> (UInt32, Bool) {
        return (try getPropertySize(property), try getPropertyIsWritable(property))
    }

    public func propertySize(property: AudioFileProperty) throws -> UInt32 {

        var size: UInt32 = 0

        try Error.check(
              AudioFileGetPropertyInfo(
                  self.ptr
                , property.code
                , &size
                , nil)
            , message: "Failed to get property size for property \(property.rawValue).")

        return size
    }

    public func propertyIsWritable(property: AudioFileProperty) throws -> Bool {

        var isWritable: UInt32 = 0

        try Error.check(
            AudioFileGetPropertyInfo(
                self.ptr
                , property.code
                , nil
                , &isWritable)
            , message: "Failed to determine if property is writable for property \(property.rawValue).")
        
        return isWritable == 1
    }
}