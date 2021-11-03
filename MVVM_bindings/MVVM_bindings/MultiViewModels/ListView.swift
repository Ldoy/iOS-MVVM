//
//  ListView.swift
//  MVVM_bindings
//
//  Created by Do Yi Lee on 2021/11/03.
//

import SwiftUI

//MARK: - 구현1
struct ListView<T: MainViewModel>: View {
    @ObservedObject var viewModel: T
    
    var body: some View {
        ForEach(viewModel.output.teams) { element in
            List {
                Section(header: Text(element.teamName)) {
                }
            }.onTapGesture {
                viewModel.input.OnTouchButton()
            }.sheet(isPresented: $viewModel.isSheetPresented) {
                viewModel.input.OnDismissSheet()
            } content: {
                DetailView(team: DetailViewModel(team: element))
            }
        }
    }
}

struct DetailView<T: DetailViewModel>: View {
    @ObservedObject var team: T
    @State var text: String = ""
    var body: some View {
        VStack {
            List {
                TextField(team.output.team.teamName, text: $text)
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: MainViewModel())
    }
}
