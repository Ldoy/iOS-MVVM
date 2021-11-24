////
////  ListView.swift
////  MVVM_bindings
////
////  Created by Do Yi Lee on 2021/11/03.
////
//
//import SwiftUI
//
//struct ListViewTwo<T: MainViewModel>: View {
//    @ObservedObject var viewModel: T
//
//    var body: some View {
//
//        NavigationView {
//            List {
//                ForEach(viewModel.output.teams) { element in
//                    NavigationLink(element.teamName) {
////                        DetailViewTwo(team: element)
//                    }
//                }
//            }
//        }
//
//    }
//}
//
//struct DetailViewTwo: View {
//    @Binding var team: Team
//    @State var text: String = ""
//    var body: some View {
//        VStack {
//            List {
//                TextField(team.teamName, text: $text) {
//                    team.teamName = text
//
//                }
//            }
//        }
//    }
//}
//
//struct ListViewTwo_Previews: PreviewProvider {
//    static var previews: some View {
//        ListViewTwo(viewModel: MainViewModel())
//    }
//}
