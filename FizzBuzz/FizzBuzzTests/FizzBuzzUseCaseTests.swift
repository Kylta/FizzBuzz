//
//  FizzBuzzUseCaseTests.swift
//  FizzBuzzTests
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import XCTest
import FizzBuzz

class FizzBuzzUseCaseTests: XCTestCase {

    func testCalculSendsFizzBuzzDataOutput() {
        let output = OutputSpy()
        let sut = CalculFizzBuzzUseCase(output: output)

        XCTAssertEqual(output.message.count, 0)

        sut.calcul(1)
        XCTAssertEqual(output.message.count, 1)
    }

    private class OutputSpy: CalculFizzBuzzOutput {
        typealias Message = (FizzBuzzData)

        var message = [Message]()

        func didCalcul(_ fizzBuzz: FizzBuzzData) {
            message.append(fizzBuzz)
        }
    }
}
