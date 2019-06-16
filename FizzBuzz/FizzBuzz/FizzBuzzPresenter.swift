//
//  FizzBuzzPresenter.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import Foundation

public struct FizzBuzzViewModel: Equatable {
    public let value: String

    public init(value: String) {
        self.value = value
    }
}

public protocol FizzBuzzPresenterOutput {
    func present(_ fizzBuzz: FizzBuzzViewModel)
}

public final class FizzBuzzPresenter: CalculFizzBuzzOutput {
    private let output: FizzBuzzPresenterOutput

    public init(output: FizzBuzzPresenterOutput) {
        self.output = output
    }

    public func didCalcul(_ fizzBuzz: FizzBuzzData) {
        output.present(FizzBuzzViewModel(value: fizzBuzz.formattedValue))
    }
}
