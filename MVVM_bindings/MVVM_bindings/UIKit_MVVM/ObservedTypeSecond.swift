//
//  ObservedTypeSecond.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/11/24.
//

import UIKit


//step1 : No generic
typealias MyObservableType = (String?) -> ()
class MyObservable {
    private var _value : String?
    private var observableType: MyObservableType?
    var value: String? {
        get {
            return _value
        }
        set {
            _value = newValue
            observableType?(newValue)
        }
    }
    
    func bindChange(value: String) {
        self.value = value
        
    }
    
    init(observableObjects: String) {
        self._value = observableObjects
    }
}

// stpe2 : Generic
typealias ObservingSecond<MyObservedType> = (MyObservedType?) -> ()

class MyObservableSecond<Value> {
    private var _value : Value?
    var observed: ObservingSecond<Value>?
    var value: Value? {
        get {
            return _value
        }
        set {
            _value = newValue
            observed?(newValue)
        }
    }
    
    func bindChange(value: Value) {
        self._value = value
        print("Value is now \(value)")

    }
    
    init(observableObjects: Value?) {
        self._value = observableObjects
    }
}

/// 실행되지 않는 이유 : viewDidLoad이후 runtime 에 실행되어야 하는데 그렇게 하려면 클로저로해당 값을 계속 캡쳐해서 바인드 해주어야 한다. viewDidLoad를 매번 해줄 수 없기 때문
class MyTexyFieldWrong: UITextField {
    func bindEditedText(to newValue: MyObservableSecond<String>) {
        newValue.bindChange(value: self.text ?? "")
        self.text = newValue.value
    }
}

// MARK:- Step3. Bind

class MyTexyField: UITextField {
    // MARK: Closure's rule = Hold code block and execute whenever text edited
    private var captureRuntimeValue: (() -> ())?

    @objc func bindClosure() {
        self.captureRuntimeValue?()
    }
    
    func bind(to newValue: MyObservableSecond<String>) {
        //MARK: 텍스트 필드의 값이 변경될 때 마다 클로저가 실행되도록 함
        addTarget(self,
                  action: #selector(bindClosure),
                  for: .editingChanged)
        
        //MARK: captureRuntimeValue 클로저에 런타임에 실행할 코드 블럭을 할당 해 주고 있음. 새로운 값이 할당 될 때 마다 set블럭의 observed클로저 실행됨
        self.captureRuntimeValue = { [weak self] in
            newValue.bindChange(value: self?.text ?? "")
        }
        
        //MARK: bindChange 메소드로 실행될 클로저에 텍스트필드에 보여줄 값을 할당하고 있음. 
        newValue.observed = { [weak self] newText in
            self?.text = newText
        }
     }
}

