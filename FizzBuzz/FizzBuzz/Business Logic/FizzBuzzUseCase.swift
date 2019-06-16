//
//  FizzBuzzUseCase.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import Foundation

public struct FizzBuzzData {
    public let formattedValue: String

    public init(value: String) {
        self.formattedValue = value
    }
}

public protocol FizzBuzzOutput {
    func didCalcul(_ fizzBuzz: FizzBuzzData)
}

public final class FizzBuzzUseCase {
    private let output: FizzBuzzOutput

    public init(output: FizzBuzzOutput) {
        self.output = output
    }

    public func calcul(_ value: Int) {
        var formattedValue = ""
        switch value {
        case value where value % 15 == 0:
            formattedValue = "FizzBuzz"
        case value where value % 3 == 0:
            formattedValue = "Fizz"
        case value where value % 5 == 0:
            formattedValue = "Buzz"
        default:
            formattedValue = "There are no Fizz, no Buzz, so no FizzBuzz!"
        }
        output.didCalcul(FizzBuzzData(value: formattedValue))
    }
}
