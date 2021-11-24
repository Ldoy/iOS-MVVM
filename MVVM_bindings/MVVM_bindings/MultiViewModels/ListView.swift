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
        NavigationView {
            List {
                ForEach(viewModel.output.teams) { element in
//                    NavigationLink(element.teamName) {
//                        DetailView(viewModel: DetailViewModel(team: element))
//                    }
                }
            }
        }
    }
}

struct DetailView<T: DetailViewModel>: View {
    @ObservedObject var viewModel: T
    @State var text: String = ""
    var body: some View {
        VStack {
            List {
                TextField(viewModel.output.team.teamName, text: $text) {
                    viewModel.input.onCommit(text)
                    
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(viewModel: MainViewModel())
    }
}
