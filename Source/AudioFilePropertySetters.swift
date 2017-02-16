//
//  AudioFilePropertySetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import AudioToolbox

extension AudioFile {

    fileprivate func property<T>(_ property: AudioFileProperty, value: UnsafePointer<T>, size: UInt32) throws {
        try Error.check(
            AudioFileSetProperty(
                self.audioFileID,
                property.code,
                size,
                value),
            message: "An error occurred while setting property '\(property.shortDescription)' to value '\(value)'.")
    }
    
    public func deferSizeUpdates(_ deferUpdates: Bool) throws {
        var shouldDefer: UInt32 = deferUpdates ? 1 : 0
        let size = UInt32(MemoryLayout<UInt32>.size)
        try property(.deferSizeUpdates, value: &shouldDefer, size: size)
    }
    
    public func id3Tag(_ tag: Data) throws {
        let size = UInt32(tag.count)
        try property(.id3Tag, value: (tag as NSData).bytes, size: size)
    }
    
    public func magicCookieData(_ data: Data) throws {
        let size = UInt32(data.count)
        try property(.magicCookieData, value: (data as NSData).bytes, size: size)
    }
    
    public func packetTableInfo(_ packetTable: AudioFilePacketTableInfo) throws {
        let size = UInt32(MemoryLayout<AudioFilePacketTableInfo>.size)
        try property(.packetTableInfo, value: [packetTable], size: size)
    }
    
    public func reserveDuration(_ duration: Double) throws {
        let size = UInt32(MemoryLayout<Double>.size)
        try property(.reserveDuration, value: [duration], size: size)
    }
    
    public func useAudioTrack(_ track: UInt32) throws {
        let size = UInt32(MemoryLayout<UInt32>.size)
        try property(.useAudioTrack, value: [track], size: size)
    }
}
