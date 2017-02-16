//
//  AudioFileGlobalPropertyGetterTests.swift
//  Tests
//
//  Created by doof nugget on 5/8/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import AudioToolbox

class AudioFileGlobalPropertyGetterTests: XCTestCase {

    func testPropertySize() {
        do {
            let size = try AudioFile.globalPropertySize(.allExtensions)
            XCTAssertNotEqual(size, UInt32.max, "Size not returned.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAllExtensions() {
        do {
            let extensions = try AudioFile.allExtensions()
            XCTAssertFalse(extensions.isEmpty, "Array was empty.")
            XCTAssertTrue(extensions.contains("caf"), "Extensions does not include 'caf', a known extensions.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAllHFSTypeCodes() {
        do {
            let codes = try AudioFile.allExtensions()
            XCTAssertFalse(codes.isEmpty, "Array was empty.")
            XCTAssertTrue(codes.contains("caf"), "Array does not include 'caf', a known type.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAllMIMETypes() {
        do {
            let codes = try AudioFile.allMIMETypes()
            XCTAssertFalse(codes.isEmpty, "Array was empty.")
            XCTAssertTrue(codes.contains("audio/aiff"), "Array does not include 'audio/aiff', a known type.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAllUTIs() {
        do {
            let codes = try AudioFile.allUTIs()
            XCTAssertFalse(codes.isEmpty, "Array was empty.")
            XCTAssertTrue(codes.contains("public.mpeg-4"), "Array does not include 'public.mpeg-4', a known type.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAvailableStreamDescriptions() {
        do {
            let format = AudioFileTypeAndFormatID(mFileType: AudioFileType.aiff.code, mFormatID: kAudioFormatLinearPCM)
            
            let descs = try AudioFile.availableStreamDescriptionsForFormat(format)
            XCTAssertFalse(descs.isEmpty, "Array was empty.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testAvailableFormatIDs() {
        do {
            let codes = try AudioFile.availableFormatIDs(.caf)
            XCTAssertFalse(codes.isEmpty, "Array was empty.")
            XCTAssertTrue(codes.contains(where: { $0.codeString! == "aac " }), "Array does not include 'aac ', a known type.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
    
    func testExtensionsForType() {
        guard let extensions = try? AudioFile.extensionsForType(.caf) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        XCTAssertFalse(extensions.isEmpty, "Array was empty.")
        XCTAssertTrue(extensions.contains("caf"), "Array does not include 'caf', a known type.")
    }
    
    func testFileTypeName() {
        guard let name = try? AudioFile.fileTypeName(.caf) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        print(name)
        XCTAssertFalse(name.isEmpty, "Array was empty.")
        XCTAssertEqual(name, "CAF", "Wrong name returned.")
    }
    
    func testHFSTypeCodesForType() {
        guard let types = try? AudioFile.HFSTypeCodesForType(.mp3) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        print(types.map { $0.codeString })
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "MPG3" }), "Array does not include 'MPG3', a known type.")
    }
    
    func testMIMETypesForType() {
        guard let types = try? AudioFile.MIMETypesForType(.mp3) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains("audio/mp3"), "Array does not include 'audio/mp3', a known type.")
    }
    
    func testReadableTypes() {
        guard let types = try? AudioFile.readableTypes() else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "AIFF" }), "Array does not include 'AIFF', a known type.")
    }
    
    func testTypesForExtension() {
        guard let types = try? AudioFile.typesForExtension("caf") else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "caff" }), "Array does not include 'caff', a known type.")
    }
    
    func testTypesForHFSTypeCode() {
        guard let code = "MPG3".propertyCode(),
            let types = try? AudioFile.typesForHFSTypeCode(code) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "MPG3" }), "Array does not include 'MPG3', a known type.")
    }
    
    func testTypesForMIMEType() {
        guard let types = try? AudioFile.typesForMIMEType("audio/mp3") else {
                XCTFail("Failed to retrieve the global property.")
                return
        }
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "MPG3" }), "Array does not include 'MPG3', a known type.")
    }
    
    func testTypesForUTI() {
        guard let types = try? AudioFile.typesForUTI("public.mpeg-4") else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        print(types.map { $0.codeString })
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "mp4f" }), "Array does not include 'mp4f', a known type.")
    }
    
    func testUTIsForType() {
        guard let types = try? AudioFile.UTIsForType(.mpeg4) else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        print(types)
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains("public.mpeg-4" ), "Array does not include 'public.mpeg-4', a known type.")
    }
    
    func testWritableTypes() {
        guard let types = try? AudioFile.writableTypes() else {
            XCTFail("Failed to retrieve the global property.")
            return
        }
        print(types)
        XCTAssertFalse(types.isEmpty, "Array was empty.")
        XCTAssertTrue(types.contains(where: { $0.codeString == "caff" }), "Array does not include 'caff', a known type.")
    }
}
