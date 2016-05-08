//
//  AudioFileInfoKeyTests.swift
//  Tests
//
//  Created by doof nugget on 5/8/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import AudioToolbox

class AudioFileInfoKeyTests: XCTestCase {

    func testInfoKeyValues() {
        XCTAssertEqual(AudioFileInfoKey.Artist.code, kAFInfoDictionary_Artist)
        XCTAssertEqual(AudioFileInfoKey.Album.code, kAFInfoDictionary_Album)
        XCTAssertEqual(AudioFileInfoKey.Tempo.code, kAFInfoDictionary_Tempo)
        XCTAssertEqual(AudioFileInfoKey.KeySignature.code, kAFInfoDictionary_KeySignature)
        XCTAssertEqual(AudioFileInfoKey.TimeSignature.code, kAFInfoDictionary_TimeSignature)
        XCTAssertEqual(AudioFileInfoKey.TrackNumber.code, kAFInfoDictionary_TrackNumber)
        XCTAssertEqual(AudioFileInfoKey.Year.code, kAFInfoDictionary_Year)
        XCTAssertEqual(AudioFileInfoKey.Composer.code, kAFInfoDictionary_Composer)
        XCTAssertEqual(AudioFileInfoKey.Lyricist.code, kAFInfoDictionary_Lyricist)
        XCTAssertEqual(AudioFileInfoKey.Genre.code, kAFInfoDictionary_Genre)
        XCTAssertEqual(AudioFileInfoKey.Title.code, kAFInfoDictionary_Title)
        XCTAssertEqual(AudioFileInfoKey.RecordedDate.code, kAFInfoDictionary_RecordedDate)
        XCTAssertEqual(AudioFileInfoKey.Comments.code, kAFInfoDictionary_Comments)
        XCTAssertEqual(AudioFileInfoKey.Copyright.code, kAFInfoDictionary_Copyright)
        XCTAssertEqual(AudioFileInfoKey.SourceEncoder.code, kAFInfoDictionary_SourceEncoder)
        XCTAssertEqual(AudioFileInfoKey.EncodingApplication.code, kAFInfoDictionary_EncodingApplication)
        XCTAssertEqual(AudioFileInfoKey.NominalBitRate.code, kAFInfoDictionary_NominalBitRate)
        XCTAssertEqual(AudioFileInfoKey.ChannelLayout.code, kAFInfoDictionary_ChannelLayout)
        XCTAssertEqual(AudioFileInfoKey.ApproximateDurationInSeconds.code, kAFInfoDictionary_ApproximateDurationInSeconds)
        XCTAssertEqual(AudioFileInfoKey.SourceBitDepth.code, kAFInfoDictionary_SourceBitDepth)
        XCTAssertEqual(AudioFileInfoKey.ISRC.code, kAFInfoDictionary_ISRC)
        XCTAssertEqual(AudioFileInfoKey.Subtitle.code, kAFInfoDictionary_SubTitle)
    }
    
    func testApproximateDurationInSeconds() {
        do {
            let audioFile = AudioFile()
            try audioFile.open(NSURL(fileURLWithPath: "/System/Library/Sounds/Frog.aiff"), permissions: .ReadPermission)
            if let value = try audioFile.infoForKey(.ApproximateDurationInSeconds),
                let duration = Double(value) {
                XCTAssertNotEqual(duration, 0.0, "Duration was zero")
            } else {
                XCTFail("Duration was nil.")
            }
            
        } catch {
            print("\(error)")
            XCTFail("Error thrown.")
        }
    }
}
