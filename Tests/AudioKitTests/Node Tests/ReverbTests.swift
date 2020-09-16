// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit
import XCTest

class AKReverbTests: XCTestCase {

    func testBypass() {
        let engine = AudioEngine()
        let input = Oscillator()
        let reverb = AKReverb(input)
        reverb.bypass()
        engine.output = reverb

        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    #if os(iOS)

    func testCathedral() {
        let engine = AudioEngine()
        let input = Oscillator()
        let effect = AKReverb(input)
        engine.output = effect
        effect.loadFactoryPreset(.cathedral)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testDefault() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKReverb(input)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testSmallRoom() {
        let effect = AKReverb(input)
        engine.output = effect
        effect.loadFactoryPreset(.smallRoom)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }
    #endif

}
