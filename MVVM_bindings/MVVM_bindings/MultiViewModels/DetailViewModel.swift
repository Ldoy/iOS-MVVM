//
//  DetailViewModel.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/11/03.
//

import Foundation

protocol DetailViewModelInputInterface {
    // func OnTouchSaveButton()
}

protocol DetailViewModelOutputInterface {
    var team: Team { get set }
}

protocol DetailViewModelable: ObservableObject {
    var input: DetailViewModelInputInterface { get }
    var output: DetailViewModelOutputInterface { get }
}

class DetailViewModel: DetailViewModelable {
    var input: DetailViewModelInputInterface { return self }
    var output: DetailViewModelOutputInterface { return self }

    @Published var team: Team
    
    init(team: Team) {
        self.team = team
    }
}

extension DetailViewModel: DetailViewModelInputInterface {
 
}

extension DetailViewModel: DetailViewModelOutputInterface {
   
}
