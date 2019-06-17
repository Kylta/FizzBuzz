//
//  AppdelegateTests.swift
//  FizzBuzzTests
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class AppDelegateTests: XCTestCase {

    func testDidFinishLaunchingConfiguresFizzBuzzViewController() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        XCTAssertNil(vc.reloadData)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])
        
        XCTAssertNotNil(vc.reloadData)
    }

    func testFizzBuzzViewControllerReloadDataShouldUpdateLabelWithFizzBuzz() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])

        let initialValue = vc.label.text

        vc.reloadData?(15)

        XCTAssertNotEqual(vc.label.text, initialValue)
        XCTAssertEqual(vc.label.text, "FizzBuzz")
    }

    func testFizzBuzzViewControllerReloadDataShouldUpdateLabelWithFizz() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])

        let initialValue = vc.label.text

        vc.reloadData?(3)

        XCTAssertNotEqual(vc.label.text, initialValue)
        XCTAssertEqual(vc.label.text, "Fizz")
    }

    func testFizzBuzzViewControllerReloadDataShouldUpdateLabelWithBuzz() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])

        let initialValue = vc.label.text

        vc.reloadData?(5)

        XCTAssertNotEqual(vc.label.text, initialValue)
        XCTAssertEqual(vc.label.text, "Buzz")
    }

    func testFizzBuzzViewControllerReloadDataShouldUpdateLabelWithUnmatchNumber() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])

        let initialValue = vc.label.text

        vc.reloadData?(2)

        XCTAssertNotEqual(vc.label.text, initialValue)
        XCTAssertEqual(vc.label.text, "There are no Fizz, no Buzz, so no FizzBuzz!")
    }

    private func makeSUT(withRoot vc: UIViewController) -> AppDelegate {
        let sut = AppDelegate()
        sut.window = UIWindow()
        sut.window?.rootViewController = vc
        trackMemoryLeaks(sut)
        return sut
    }

    private func makeFizzBuzzViewController(file: StaticString = #file, line: UInt = #line) -> FizzBuzzViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! FizzBuzzViewController
        vc.loadViewIfNeeded()
        return vc
    }
}


extension XCTestCase {
    func trackMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leaks", file: file, line: line)
        }
    }
}

