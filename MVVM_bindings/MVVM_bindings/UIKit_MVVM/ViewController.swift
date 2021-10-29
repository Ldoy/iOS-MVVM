//
//  ViewController.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var textField: BoundTextField!
    
    var user = User(name: Observable("Tacocat"))
    let game = EmojiMemoryGame()

    @IBSegueAction func show(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView(viewmodel: game))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.bind(to: user.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        }
    }
}

