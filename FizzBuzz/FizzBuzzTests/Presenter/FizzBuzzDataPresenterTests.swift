//
//  FizzBuzzDataPresenterTests.swift
//  FizzBuzzTests
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import XCTest
import FizzBuzz

class FizzBuzzDataPresenterTests: XCTestCase {

    func testDidCalculPassesMessageToOutput() {
        let output = OutputSpy()
        let sut = FizzBuzzPresenter(output: output)

        XCTAssertEqual(output.messages.count, 0)

        sut.didCalcul(FizzBuzzData(value: "Fizz"))
        XCTAssertEqual(output.messages, [FizzBuzzViewModel(value: "Fizz")])
    }

    private class OutputSpy: FizzBuzzPresenterOutput {
        typealias Message = (FizzBuzzViewModel)

        var messages = [Message]()

        func present(_ fizzBuzz: FizzBuzzViewModel) {
            messages.append(fizzBuzz)
        }
    }
}
