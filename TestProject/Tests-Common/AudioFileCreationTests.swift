//
//  AudioFileCreationTests.swift
//  Tests
//
//  Created by doof nugget on 5/4/16.
//
//

import XCTest
@testable
import LVGSwiftAudioFileServices
import AudioToolbox

let readProc: AudioFile_ReadProc = {
    inClientData, inPosition, requestCount, buffer, actualCount in
    return 0
}

let writeProc: AudioFile_WriteProc = {
    inClientData, inPosition, requestCount, buffer, actualCount in
    return 0
}

class AudioFileCreationTests: XCTestCase {

    var audioFile: AudioFile!
    
    let frog = URL(fileURLWithPath: "/System/Library/Sounds/Frog.aiff")
    
    func testOpenFromURL() {
        
        do {
            let _ = try AudioFile(openAtURL: frog, permissions: AudioFilePermissions.readPermission)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func testCreateAtURL() {
        let fileManager = FileManager.default
        let baseURL = fileManager.temporaryDirectory
        let url = baseURL.appendingPathComponent("tmp.caf")
        var desc = AudioStreamBasicDescription()
        desc.mFormatFlags = kAudioFormatFlagIsBigEndian |
            kAudioFormatFlagIsSignedInteger | kAudioFormatFlagIsPacked
        desc.mSampleRate = 441000
        desc.mFormatID = kAudioFormatLinearPCM
        desc.mBitsPerChannel = 16
        desc.mChannelsPerFrame = 1
        desc.mFramesPerPacket = 1
        desc.mBytesPerFrame = 2
        desc.mBytesPerPacket = 2
        
        do {
            
            let _ = try AudioFile(createAtURL: url, fileType: .caf, format: &desc, flags: [AudioFileFlags.eraseFile])
            
            defer {
                
                
                do {
                    try fileManager.removeItem(at: url)
                } catch {
                    print("\(error)")
                }
            }
        } catch {
            XCTFail("\(error)")
        }
    }

//    override func setUp() {
//        super.setUp()
//        audioFile = AudioFile()
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//        _ = try? audioFile.close()
//        audioFile = nil
//    }
//
//    func testAudioFileIDIs0OnInit() {
//        XCTAssertEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was not 0 on init.")
//    }
//    
//    func testAudioFileIDIsNot0AfterOpenURL() {
//        
//        do {
//            
//            try audioFile.open(frog, permissions: .readPermission, fileTypeHint: .aiff)
//            
//            XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after opening URL.")
//        } catch {
//            print("\(error)")
//            XCTFail("Error thrown.")
//        }
//    }
//    
//    func testAudioFileInitFromAudioFileIDIsNot0AfterInit() {
//        var audioFileID: AudioFileID? = nil
//        let status = AudioFileOpenURL(frog, .readPermission, AudioFileType.aiff.code, &audioFileID)
//        if status != 0 { XCTFail() }
//        
//        let audioFile = AudioFile(audioFileID: audioFileID)
//        
//        XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after initializing from AudioFileID.")
//    }
//    
//    func testAudioFileCloseDoesNotThrowError() {
//        
//        do {
//            
//            try audioFile.open(frog, permissions: .readPermission, fileTypeHint: .aiff)
//            try audioFile.close()
//            
//            XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after opening URL and then closing.")
//        } catch {
//            print("\(error)")
//            XCTFail("Error thrown.")
//        }
//    }
//    
//    func testInfoDictionary() {
//        do {
//            try audioFile.open(frog, permissions: .readPermission, fileTypeHint: .aiff)
//            _ = try audioFile.infoDictionary()
//        } catch {
//            print("\(error)")
//            XCTFail("Could not access infoDictionary property.")
//        }
//    }
}
