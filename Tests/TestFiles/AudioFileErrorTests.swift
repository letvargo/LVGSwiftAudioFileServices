//
//  AudioFileErrorTests.swift
//  Tests
//
//  Created by doof nugget on 5/7/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import AudioToolbox

class AudioFileErrorTests: XCTestCase {

    func testBadPropertySize() {
        let status = kAudioFileBadPropertySizeError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testDoesNotAllow64BitStorage() {
        let status = kAudioFileDoesNotAllow64BitDataSizeError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testEndOfFile() {
        let status = kAudioFileEndOfFileError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testFileNotFound() {
        let status = kAudioFileFileNotFoundError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testInvalidChunk() {
        let status = kAudioFileInvalidChunkError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testInvalidFile() {
        let status = kAudioFileInvalidFileError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testInvalidPacketOffset() {
        let status = kAudioFileInvalidPacketOffsetError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testNotOpen() {
        let status = kAudioFileNotOpenError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testInvalidNotOptimized() {
        let status = kAudioFileNotOptimizedError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testOperationNotSupported() {
        let status = kAudioFileOperationNotSupportedError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testPermissions() {
        let status = kAudioFilePermissionsError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testPosition() {
        let status = kAudioFilePositionError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testUnspecified() {
        let status = kAudioFileUnspecifiedError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testUnsupportedDataFormat() {
        let status = kAudioFileUnsupportedDataFormatError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testUnsupportedFileType() {
        let status = kAudioFileUnsupportedFileTypeError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testUnsupportedProperty() {
        let status = kAudioFileUnsupportedPropertyError
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func testUndefined() {
        let status = Int32.max
        XCTAssertTrue(checkStatus(status), "Wrong error thrown.")
    }
    
    func checkStatus(_ status: OSStatus) -> Bool {
        do {
            try AudioFileError.check(status, message: "")
            XCTFail("Error not thrown.")
            return false
        } catch let error as AudioFileError {
            return error.code == status
        } catch {
            XCTFail("Wrong error thrown.")
            return false
        }
    }
}
