//
//  ViewController.swift
//  FizzBuzz
//
//  Created by Christophe Bugnon on 16/06/2019.
//  Copyright © 2019 Christophe Bugnon. All rights reserved.
//

import UIKit

final class FizzBuzzViewController: UIViewController, FizzBuzzPresenterOutput {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var textField: UITextField!

    var reloaData: ((Int) -> Void)?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        reload()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reloaData?(Int(textField.text!)!)
    }

    @IBAction private func reload() {
        reloaData?(Int(textField.text!)!)
    }
}

extension FizzBuzzViewController {
    func present(_ fizzBuzz: FizzBuzzViewModel) {
        label.text = fizzBuzz.value
    }
}
