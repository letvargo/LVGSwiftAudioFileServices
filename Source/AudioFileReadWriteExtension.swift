//
//  AudioFileReadWriteExtension.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import AudioToolbox

extension AudioFile {

    // MARK: Reading and Writing Data

    public func readBytes(
        _ numBytes: Int,
        startingByte: Int,
        buffer: UnsafeMutableRawPointer,
        useCache: Bool = false) throws -> Int {

        let inStartingByte = Int64(startingByte)
        var ioNumBytes = UInt32(numBytes)
        
        try Error.check(
            AudioFileReadBytes(
                self.audioFileID,
                useCache,
                inStartingByte,
                &ioNumBytes,
                buffer)
        , message: "Failed to read bytes.")
        
        return Int(ioNumBytes)
    }

    public func writeBytes(
        _ numBytes: Int,
        startingByte: Int,
        buffer: UnsafeRawPointer,
        useCache: Bool = false) throws -> Int {
        
        var ioNumBytes = UInt32(numBytes)
        let inStartingByte = Int64(startingByte)

        try Error.check(
            AudioFileWriteBytes(
                self.audioFileID,
                useCache,
                inStartingByte,
                &ioNumBytes,
                buffer),
            message: "Failed to write bytes.")
        
        return Int(ioNumBytes)
    }

    public func readPacketData(
        _ numBytes: Int,
        numPackets: Int,
        startingPacket: Int,
        packetDescriptions: UnsafeMutablePointer<AudioStreamPacketDescription>,
        buffer: UnsafeMutableRawPointer,
        useCache: Bool = false) throws -> (bytesRead: Int, packetsRead: Int) {
        
        var ioNumBytes = UInt32(numBytes)
        var ioNumPackets = UInt32(numPackets)
        let inStartingPacket = Int64(startingPacket)
        
        try Error.check(
            AudioFileReadPacketData(
                self.audioFileID,
                useCache,
                &ioNumBytes,
                packetDescriptions,
                inStartingPacket,
                &ioNumPackets,
                buffer)
            , message: "Failed to read packet data.")
        
        return (Int(ioNumBytes), Int(ioNumPackets))
    }

    public func writePackets(
        _ numBytes: Int,
        numPackets: Int,
        startingPacket: Int,
        packetDescriptions: UnsafePointer<AudioStreamPacketDescription>,
        buffer: UnsafeRawPointer,
        useCache: Bool = false) throws -> Int {
        
        let inNumBytes = UInt32(numBytes)
        var ioNumPackets = UInt32(numPackets)
        let inStartingPacket = Int64(startingPacket)

        try Error.check(
            AudioFileWritePackets(
                self.audioFileID
                , useCache
                , inNumBytes
                , packetDescriptions
                , inStartingPacket
                , &ioNumPackets
                , buffer)
            , message: "Failed to write packets.")
        
        return (Int(ioNumPackets))
    }
}
