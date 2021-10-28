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
struct test {
    
}

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

class BoundTextField: UITextField {
    var changedClosure: (() -> ())?
    //편집변경, 그니까 텍스트 필드의 글자가 변경되면 호출 할 속성. 왜?
    
    //
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

/*
 1. Observable값이면 어떤 것이던 저장하도록
 */
