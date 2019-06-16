//
//  FizzBuzzUseCase.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import Foundation

public struct FizzBuzzData {
    let value: Int
}

public protocol CalculFizzBuzzOutput {
    func didCalcul(_ fizzBuzz: FizzBuzzData)
}

public final class CalculFizzBuzzUseCase {
    private let output: CalculFizzBuzzOutput

    public init(output: CalculFizzBuzzOutput) {
        self.output = output
    }

    public func calcul(_ value: Int) {
        output.didCalcul(FizzBuzzData(value: value))
    }
}
