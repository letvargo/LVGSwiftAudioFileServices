//
//  AudioFilePropertySetters.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import Foundation
import LVGSwiftAudioFileServices
import AudioToolbox

extension AudioFile {

    private func property<T>(property: AudioFileProperty, value: UnsafePointer<T>, size: UInt32) throws {
        try Error.check(
            AudioFileSetProperty(
                self.audioFileID,
                property.code,
                size,
                value),
            message: "An error occurred while setting property '\(property.shortDescription)' to value '\(value)'.")
    }
    
    public func deferSizeUpdates(deferUpdates: Bool) throws {
        var shouldDefer: UInt32 = deferUpdates ? 1 : 0
        let size = UInt32(sizeof(UInt32))
        try property(.DeferSizeUpdates, value: &shouldDefer, size: size)
    }
    
    public func id3Tag(tag: NSData) throws {
        let size = UInt32(tag.length)
        try property(.ID3Tag, value: tag.bytes, size: size)
    }
    
    public func magicCookieData(data: NSData) throws {
        let size = UInt32(data.length)
        try property(.MagicCookieData, value: data.bytes, size: size)
    }
    
    public func packetTableInfo(packetTable: AudioFilePacketTableInfo) throws {
        let size = UInt32(sizeof(AudioFilePacketTableInfo))
        try property(.PacketTableInfo, value: [packetTable], size: size)
    }
    
    public func reserveDuration(duration: Double) throws {
        let size = UInt32(sizeof(Double))
        try property(.ReserveDuration, value: [duration], size: size)
    }
    
    public func useAudioTrack(track: UInt32) throws {
        let size = UInt32(sizeof(UInt32))
        try property(.UseAudioTrack, value: [track], size: size)
    }
}