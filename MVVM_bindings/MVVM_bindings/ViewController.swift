//
//  ViewController.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBSegueAction func show(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

