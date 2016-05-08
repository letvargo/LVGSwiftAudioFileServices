//
//  AudioFileGlobalPropertyTests.swift
//  Tests
//
//  Created by doof nugget on 5/8/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import AudioToolbox

class AudioFileGlobalPropertyTests: XCTestCase {
    
    func testAllExtensions() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AllExtensions), "Code error.")
    }
    
    func testAllHFSTypeCodes() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AllHFSTypeCodes), "Code error.")
    }
    
    func testAllMIMETypes() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AllMIMETypes), "Code error.")
    }
    
    func testAllUTIs() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AllUTIs), "Code error.")
    }
    
    func testAvailableFormatIDs() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AvailableFormatIDs), "Code error.")
    }
    
    func testAvailableStreamDescriptions() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_AvailableStreamDescriptionsForFormat), "Code error.")
    }
    
    func testExtensionsForType() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_ExtensionsForType), "Code error.")
    }
    
    func testFileTypeName() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_FileTypeName), "Code error.")
    }
    
    func testHFSTypeCodesForType() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_HFSTypeCodesForType), "Code error.")
    }
    
    func testMIMETypesForType() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_MIMETypesForType), "Code error.")
    }
    
    func testReadableTypes() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_ReadableTypes), "Code error.")
    }
    
    func testTypesForExtension() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_TypesForExtension), "Code error.")
    }
    
    func testTypesForHFSTypeCodes() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_TypesForHFSTypeCode), "Code error.")
    }
    
    func testTypesForMIMEType() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_TypesForMIMEType), "Code error.")
    }
    
    func testTypesForUTI() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_TypesForUTI), "Code error.")
    }
    
    func testUTIsForType() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_UTIsForType), "Code error.")
    }
    
    func testWritableTypes() {
        XCTAssertTrue(checkCode(kAudioFileGlobalInfo_TypesForMIMEType), "Code error.")
    }
    
    func checkCode(code: UInt32) -> Bool {
        guard let property = AudioFileGlobalProperty(code: code) else { return false }
        return property.code == code
    }
}
