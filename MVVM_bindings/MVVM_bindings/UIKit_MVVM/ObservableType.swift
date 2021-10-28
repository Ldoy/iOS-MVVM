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

class Observable<ObservedType> {
    private var _value: ObservedType?
    var valueChanged: Observing<ObservedType>?
    
    public var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value is now \(newValue)")
    }
    
    init(_ value: ObservedType) {
        _value = value
    }
}

class BoundTextField: UITextField {
    private var changedClosure: (() -> ())?

    @objc func valueChanged() {
        changedClosure?()
    }
    
    func bind(to observable: Observable<String>) {
        addTarget(self,
                  action: #selector(valueChanged),
                  for: .editingChanged)
 
        self.changedClosure = { [weak self] in
            observable.bindingChanged(to: self?.text ?? "")
        }
        
        observable.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}
