//
//  WeakRef.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 17/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import Foundation

public final class WeakRef<T: AnyObject> {
    public weak var object: T?

    public init(_ object: T) {
        self.object = object
    }
}
