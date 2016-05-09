//
//  AudioFilePropertyTests.swift
//  Tests
//
//  Created by doof nugget on 5/8/16.
//
//

import XCTest
import LVGSwiftAudioFileServices
import AudioToolbox

class AudioFilePropertyTests: XCTestCase {

    func testCodeInit() {
        XCTAssertEqual(kAudioFilePropertyFileFormat, AudioFileProperty(code: kAudioFilePropertyFileFormat)?.code)
        XCTAssertEqual(kAudioFilePropertyDataFormat, AudioFileProperty(code: kAudioFilePropertyDataFormat)?.code)
        XCTAssertEqual(kAudioFilePropertyFormatList, AudioFileProperty(code: kAudioFilePropertyFormatList)?.code)
        XCTAssertEqual(kAudioFilePropertyIsOptimized, AudioFileProperty(code: kAudioFilePropertyIsOptimized)?.code)
        XCTAssertEqual(kAudioFilePropertyMagicCookieData, AudioFileProperty(code: kAudioFilePropertyMagicCookieData)?.code)
        XCTAssertEqual(kAudioFilePropertyAudioDataByteCount, AudioFileProperty(code: kAudioFilePropertyAudioDataByteCount)?.code)
        XCTAssertEqual(kAudioFilePropertyAudioDataPacketCount, AudioFileProperty(code: kAudioFilePropertyAudioDataPacketCount)?.code)
        XCTAssertEqual(kAudioFilePropertyMaximumPacketSize, AudioFileProperty(code: kAudioFilePropertyMaximumPacketSize)?.code)
        XCTAssertEqual(kAudioFilePropertyDataOffset, AudioFileProperty(code: kAudioFilePropertyDataOffset)?.code)
        XCTAssertEqual(kAudioFilePropertyChannelLayout, AudioFileProperty(code: kAudioFilePropertyChannelLayout)?.code)
        XCTAssertEqual(kAudioFilePropertyDeferSizeUpdates, AudioFileProperty(code: kAudioFilePropertyDeferSizeUpdates)?.code)
        XCTAssertEqual(kAudioFilePropertyMarkerList, AudioFileProperty(code: kAudioFilePropertyMarkerList)?.code)
        XCTAssertEqual(kAudioFilePropertyRegionList, AudioFileProperty(code: kAudioFilePropertyRegionList)?.code)
        XCTAssertEqual(kAudioFilePropertyPacketToFrame, AudioFileProperty(code: kAudioFilePropertyPacketToFrame)?.code)
        XCTAssertEqual(kAudioFilePropertyFrameToPacket, AudioFileProperty(code: kAudioFilePropertyFrameToPacket)?.code)
        XCTAssertEqual(kAudioFilePropertyPacketToByte, AudioFileProperty(code: kAudioFilePropertyPacketToByte)?.code)
        XCTAssertEqual(kAudioFilePropertyByteToPacket, AudioFileProperty(code: kAudioFilePropertyByteToPacket)?.code)
        XCTAssertEqual(kAudioFilePropertyChunkIDs, AudioFileProperty(code: kAudioFilePropertyChunkIDs)?.code)
        XCTAssertEqual(kAudioFilePropertyPacketTableInfo, AudioFileProperty(code: kAudioFilePropertyPacketTableInfo)?.code)
        XCTAssertEqual(kAudioFilePropertyPacketSizeUpperBound, AudioFileProperty(code: kAudioFilePropertyPacketSizeUpperBound)?.code)
        XCTAssertEqual(kAudioFilePropertyInfoDictionary, AudioFileProperty(code: kAudioFilePropertyInfoDictionary)?.code)
        XCTAssertEqual(kAudioFilePropertyAlbumArtwork, AudioFileProperty(code: kAudioFilePropertyAlbumArtwork)?.code)
        XCTAssertEqual(kAudioFilePropertyReserveDuration, AudioFileProperty(code: kAudioFilePropertyReserveDuration)?.code)
        XCTAssertEqual(kAudioFilePropertyEstimatedDuration, AudioFileProperty(code: kAudioFilePropertyEstimatedDuration)?.code)
        XCTAssertEqual(kAudioFilePropertyBitRate, AudioFileProperty(code: kAudioFilePropertyBitRate)?.code)
        XCTAssertEqual(kAudioFilePropertyID3Tag, AudioFileProperty(code: kAudioFilePropertyID3Tag)?.code)
        XCTAssertEqual(kAudioFilePropertySourceBitDepth, AudioFileProperty(code: kAudioFilePropertySourceBitDepth)?.code)
        XCTAssertEqual(kAudioFilePropertyAudioTrackCount, AudioFileProperty(code: kAudioFilePropertyAudioTrackCount)?.code)
        XCTAssertEqual(kAudioFilePropertyUseAudioTrack, AudioFileProperty(code: kAudioFilePropertyUseAudioTrack)?.code)
        XCTAssertNil(AudioFileProperty(code: UInt32.max))
    }
}
