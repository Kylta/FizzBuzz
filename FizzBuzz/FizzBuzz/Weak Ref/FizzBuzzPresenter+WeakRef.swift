//
//  FizzBuzzPresenter+WeakRef.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 17/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import Foundation

extension WeakRef: FizzBuzzPresenterOutput where T: FizzBuzzPresenterOutput {
    public func present(_ weather: FizzBuzzViewModel) {
        object?.present(weather)
    }
}
