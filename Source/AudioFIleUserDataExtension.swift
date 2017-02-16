//
//  AudioFIleUserDataExtension.swift
//  Pods
//
//  Created by doof nugget on 5/7/16.
//
//

import AudioToolbox

extension AudioFile {
    
    public func countUserData(_ userDataID: UInt32) throws -> UInt32 {
        var count = UInt32.max
        try Error.check(
            AudioFileCountUserData(
                self.audioFileID,
                userDataID,
                &count),
            message: "An error occurred while retrieving the user data count for userDataID '\(userDataID)'")
        return count
    }
    
    public func userDataSize(_ userDataID: UInt32, index: UInt32) throws -> UInt32 {
        var size = UInt32.max
        try Error.check(
            AudioFileGetUserDataSize(
                self.audioFileID,
                userDataID,
                index,
                &size),
            message: "An error occurred while retrieving the user data size for userDataID '\(userDataID)', index '\(index)'")
        return size
    }
    
    public func removeUserData(_ userDataID: UInt32, index: UInt32) throws {
        try Error.check(
            AudioFileRemoveUserData(
                self.audioFileID,
                userDataID,
                index)
        , message: "An error occurred while removing the user data for userDataID '\(userDataID)', index '\(index)'")
    }
    
    public func setUserData(_ userDataID: UInt32, index: UInt32, size: UInt32, userData: UnsafeRawPointer) throws {
        try Error.check(
            AudioFileSetUserData(
                self.audioFileID,
                userDataID,
                index,
                size,
                userData),
        message: "An error occurred while setting the user data for userDataID '\(userDataID)', index '\(index)'")
    }
    
    public func getUserData(_ userDataID: UInt32, index: UInt32, size: inout UInt32, buffer: UnsafeMutableRawPointer) throws {
        try Error.check(
            AudioFileGetUserData(
                self.audioFileID,
                userDataID,
                index,
                &size,
                buffer),
            message: "An error occurred while getting the user data for userDataID '\(userDataID)', index '\(index)'")
    }
}
