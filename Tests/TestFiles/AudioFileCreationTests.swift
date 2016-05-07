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
    
    let frog = NSURL(fileURLWithPath: "/System/Library/Sounds/Frog.aiff")

    override func setUp() {
        super.setUp()
        audioFile = AudioFile()
    }
    
    override func tearDown() {
        super.tearDown()
        _ = try? audioFile.close()
        audioFile = nil
    }

    func testAudioFileIDIs0OnInit() {
        XCTAssertEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was not 0 on init.")
    }
    
    func testAudioFileIDIsNot0AfterOpenURL() {
        
        do {
            
            try audioFile.open(frog, permissions: .ReadPermission, fileTypeHint: .AIFF)
            
            XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after opening URL.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAudioFileInitFromAudioFileIDIsNot0AfterInit() {
        var audioFileID: AudioFileID = nil
        let status = AudioFileOpenURL(frog, .ReadPermission, AudioFileType.AIFF.code, &audioFileID)
        if status != 0 { XCTFail() }
        
        let audioFile = AudioFile(audioFileID: audioFileID)
        
        XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after initializing from AudioFileID.")
    }
    
    func testAudioFileCloseDoesNotThrowError() {
        
        do {
            
            try audioFile.open(frog, permissions: .ReadPermission, fileTypeHint: .AIFF)
            try audioFile.close()
            
            XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after opening URL and then closing.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testInfoDictionary() {
        do {
            try audioFile.open(frog, permissions: .ReadPermission, fileTypeHint: .AIFF)
            _ = try audioFile.infoDictionary()
        } catch {
            print("\(error)")
            XCTFail("Could not access infoDictionary property.")
        }
    }
}