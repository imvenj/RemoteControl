//
//  ViewController.swift
//  RemoteControl
//
//  Created by 朱文杰 on 11/2/19.
//  Copyright © 2019 Sukiapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ipField: UITextField!
    @IBOutlet var switchFields: [UISwitch]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func valueChanged(_ sender: UISwitch) {
        let tag = sender.tag
        turn(sender.isOn, switchIndex: tag)
    }

    func turn(_ on: Bool, switchIndex index: Int) {
        guard let ip = ipField?.text else { return }
        let operation = on ? "on" : "off"
        let urlString = "http://\(ip)/relay?op=\(operation)&pin=\(index)"
        guard let url = URL(string: urlString) else { return }
        _ = try? Data(contentsOf: url, options: [])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ipField.resignFirstResponder()
        return true
    }
}
