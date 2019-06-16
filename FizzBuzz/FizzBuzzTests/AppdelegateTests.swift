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

        XCTAssertNil(vc.reloaData)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])
        
        XCTAssertNotNil(vc.reloaData)
    }

    func testFizzBuzzViewControllerReloadDataShouldUpdateLabel() {
        let vc = makeFizzBuzzViewController()
        let sut = makeSUT(withRoot: vc)

        _ = sut.application(.shared, didFinishLaunchingWithOptions: [:])

        let initialValue = vc.label.text

        vc.reloaData?(15)

        XCTAssertNotEqual(vc.label.text, initialValue)
        XCTAssertEqual(vc.label.text, "FizzBuzz")
    }

    private func makeSUT(withRoot vc: UIViewController) -> AppDelegate {
        let sut = AppDelegate()
        sut.window = UIWindow()
        sut.window?.rootViewController = vc
        return sut
    }

    private func makeFizzBuzzViewController() -> FizzBuzzViewController {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut = sb.instantiateInitialViewController() as! FizzBuzzViewController
        sut.loadViewIfNeeded()
        return sut
    }
}
