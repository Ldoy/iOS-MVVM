//
//  ViewController.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var textField: MyTexyField!
    let button = UIButton()
    var userSecond = UserSecond(name: MyObservableSecond(observableObjects: "HOHO"))
    var user = User(name: Observable("Tacocat"))
    let game = EmojiMemoryGame()

    @IBSegueAction func show(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ContentView(viewmodel: game))
    }
    @IBSegueAction func showViewModels(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: ListView(viewModel: MainViewModel()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.bind(to: userSecond.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        }
    }
    
    @IBOutlet weak var circleImage: UIImageView!
    var isTabButton: Bool = false
    
    @IBAction func didTabButton() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            if !self.isTabButton {
                self.circleImage.transform = CGAffineTransform(rotationAngle: (.pi / 4))
            } else {
                
                self.circleImage.transform = CGAffineTransform(rotationAngle: (.pi / 4))
            }
            self.isTabButton = !self.isTabButton

        } completion: { [weak self] finish in
            guard let self = self else { return }
         }
    }

}

