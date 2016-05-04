//
//  AudioFileCreationTests.swift
//  Tests
//
//  Created by doof nugget on 5/4/16.
//
//

import XCTest
import LVGSwiftAudioFileServices

class AudioFileCreationTests: XCTestCase {

    var audioFile: AudioFile!
    
    let frog = NSURL(fileURLWithPath: "/System/Library/Sounds/Frog.aiff")

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testAudioFileIDIs0OnInit() {
        let audioFile = AudioFile()
        XCTAssertEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was not 0 on init.")
    }
    
    func testAudioFileIDIsNot0AfterOpenURL() {
    
        let audioFile = AudioFile()
        
        do {
            
            try audioFile.open(frog, permissions: .ReadPermission, fileTypeHint: .AIFF)
            XCTAssertNotEqual(audioFile.audioFileID.hashValue, 0, "audioFileID's hashValue was 0 after opening URL.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
}