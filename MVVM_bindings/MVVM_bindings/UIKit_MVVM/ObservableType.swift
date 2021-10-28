//
//  ObservableType.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/10/27.
//

import UIKit

typealias Observing<ObservedType> = (ObservedType?) -> ()

struct User {
    var name: Observable<String>
}

// viewmodel
class Observable<ObservedType> {
    //1
    private var _value: ObservedType?

    //3
    var valueChanged: Observing<ObservedType>?
    
    //5
    public var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    // 4
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
    
    // 2
    init(_ value: ObservedType) {
        _value = value
    }
}
//var user = User(name: Observable("Tacocat"))
//viewModel
class BoundTextField: UITextField {
    private var changedClosure: (() -> ())?

    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self,
                  action: #selector(valueChanged),
                  for: .editingChanged)
        
        //observable.bindingChanged(to: self.text ?? "")
        //바뀐 값을 모델에 반영
        self.changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
        
        //모델을 뷰에 반영
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}

/*
 1. Observable값이면 어떤 것이던 저장하도록
 */
