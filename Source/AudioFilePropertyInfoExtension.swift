//
//  AudioFilePropertyInfoExtension.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import AudioToolbox

extension AudioFile {
    
    // MARK: AudioFile Property Information
    
    public typealias PropertyInfo = (size: UInt32, writable: Bool)

    public func propertyInfo(_ property: AudioFileProperty) throws -> PropertyInfo {
        
        var isWritable: UInt32 = 0
        var size: UInt32 = 0
        
        try Error.check(
            AudioFileGetPropertyInfo(
                self.audioFileID
                , property.code
                , &size
                , &isWritable)
            , message: "Failed to get PropertyInfo for property \(property.shortDescription).")
        
        return (size, isWritable == 1)
    }

    public func propertySize(_ property: AudioFileProperty) throws -> UInt32 {
        return try propertyInfo(property).size
    }

    public func propertyIsWritable(_ property: AudioFileProperty) throws -> Bool {
        return try propertyInfo(property).writable
    }
}
