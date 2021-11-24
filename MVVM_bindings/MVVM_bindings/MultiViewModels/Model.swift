//
//  Model.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/11/03.
//

import Foundation
/*
 목표 : 뷰와 뷰 사이의 데이터를 뷰모델을 이용해 전달한다.
 설계 : 리스트를 눌렀을 때 리스트에 나타난 정보를 sheet에 나타나도록 한다.
        sheet에서 변경 내용을 리스트에 반영한다.
 구현 순서
 1. 리스트에 나타낼 정보 : 임의 정보 만들기
 2. 프로토콜구현 및 input, ouput 정의하기
 3.
 
 */

struct Team: Identifiable {
    var teamName: String
    var person: [Person]
    var id: UUID
}

struct Person {
    var name: String
}


// Input
protocol MainViewModelInputInterface {
    func OnTouchButton()
    func OnTouchEdit()
    func OnDismissSheet()
    //func onCommit(_ text: String, id: UUID)
}

// Ouput
protocol MainViewModelOutputInterface {
    var teams: [Team] { get set }
    var isSheetPresented: Bool { get set }
    var isEditButtonTouched: Bool { get set }
}

protocol MainViewModelable: ObservableObject {
    var input: MainViewModelInputInterface { get }
    var output: MainViewModelOutputInterface { get }
}

class MainViewModel: MainViewModelable {
    var output: MainViewModelOutputInterface { return self }
    
    var input: MainViewModelInputInterface { return self }
    
    @Published var teams: [Team] = [
        Team(teamName: "Swift", person: [Person(name: "A"),
                                         Person(name: "B"),
                                         Person(name: "C")], id: UUID()),
        Team(teamName: "ObjectC", person: [Person(name: "a"),
                                           Person(name: "b"),
                                           Person(name: "c")], id: UUID())
    ]
    
    @Published var isSheetPresented: Bool = false
    @Published var isEditButtonTouched: Bool = false
}
 
// MARK: - InputInterface
extension MainViewModel: MainViewModelInputInterface {
    func OnTouchEdit() {
        //
    }
    func onCommit(_ text: String) {

    }

    func OnTouchButton() {
        self.isSheetPresented = true
    }
    
    func OnDismissSheet() {
        self.isSheetPresented = false
    }
}

// MARK: - OutputInterface
extension MainViewModel: MainViewModelOutputInterface {

}
