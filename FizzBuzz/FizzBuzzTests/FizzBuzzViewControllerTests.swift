//
//  FizzBuzzViewControllerTests.swift
//  FizzBuzzTests
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzViewControllerTest: XCTestCase {
    private let sb = UIStoryboard(name: "Main", bundle: nil)

    func testCanCreateFromStoryboard() {
        let sut = sb.instantiateInitialViewController()

        XCTAssertTrue(sut is FizzBuzzViewController)
    }

    func testLabelOutletIsConnected() {
        XCTAssertNotNil(makeSUT().label)
    }

    func testTextFieldIsConnected() {
        XCTAssertNotNil(makeSUT().textField)
    }

    func testReloadButtonIsConnected() {
        XCTAssertNotNil(makeSUT().reloadButton)
    }

    func testReloadButtonTapTriggersReloadDataClosure() {
        let sut = makeSUT()

        var callCount = 0
        sut.reloadData = { _ in callCount += 1 }

        XCTAssertEqual(callCount, 0)

        sut.reloadButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(callCount, 1)

        sut.reloadButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(callCount, 2)
    }

    func testViewWillAppearTriggersReloadDataClosure() {
        let sut = makeSUT()

        var callCount = 0
        sut.reloadData = { _ in callCount += 1 }

        XCTAssertEqual(callCount, 0)

        sut.viewWillAppear(false)
        XCTAssertEqual(callCount, 1)

        sut.viewWillAppear(false)
        XCTAssertEqual(callCount, 2)
    }

    func testPresentFizzBuzzViewModelUpdatesLabel() {
        let sut = makeSUT()

        sut.present(FizzBuzzViewModel(value: "Fizz"))

        XCTAssertEqual(sut.label.text, "Fizz")
    }

    private func makeSUT() -> FizzBuzzViewController {
        let sut = sb.instantiateInitialViewController() as! FizzBuzzViewController
        sut.loadViewIfNeeded()
        return sut
    }
}
