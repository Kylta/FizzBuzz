//
//  AppDelegate.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if let vc = window?.rootViewController as? FizzBuzzViewController {
            let presenter = FizzBuzzPresenter(output: vc)
            let fizzBuzzCalculate = CalculFizzBuzzUseCase(output: presenter)
            vc.reloaData = fizzBuzzCalculate.calcul
        }

        return true
    }
}

