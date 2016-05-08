//
//  AudioFileGlobalPropertyGetterTests.swift
//  Tests
//
//  Created by doof nugget on 5/8/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import LVGUtilities

class AudioFileGlobalPropertyGetterTests: XCTestCase {

    func testPropertySize() {
        do {
            let size = try AudioFile.globalPropertySize(.AllExtensions)
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
    
    func testAvailableFormatIDs() {
        do {
            let codes = try AudioFile.availableFormatIDs(.CAF)
            print(codes.flatMap { $0.codeString })
            XCTAssertFalse(codes.isEmpty, "Array was empty.")
            XCTAssertTrue(codes.contains({ $0.codeString! == "aac " }), "Array does not include 'aac ', a known type.")
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
}
