// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AudioKit
import XCTest

class AKAutoWahTests: XCTestCase {

    func testAmplitude() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKAutoWah(input, wah: 0.123, amplitude: 0.789)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testBypass() {
        let engine = AudioEngine()
        let input = Oscillator()
        let wah = AKAutoWah(input, wah: 0.123, amplitude: 0.789)
        wah.bypass()
        engine.output = wah
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testDefault() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKAutoWah(input)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testMix() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKAutoWah(input, wah: 0.123, mix: 0.456)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testParamters() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKAutoWah(input, wah: 0.123, mix: 0.456, amplitude: 0.789)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

    func testWah() {
        let engine = AudioEngine()
        let input = Oscillator()
        engine.output = AKAutoWah(input, wah: 0.123)
        input.start()
        let audio = engine.startTest(totalDuration: 1.0)
        audio.append(engine.render(duration: 1.0))
        testMD5(audio)
    }

}
