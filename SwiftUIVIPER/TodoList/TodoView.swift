//
//  TodoView.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct TodoView: ViewInterface, View {
    var presenter: TodoPresenterViewInterface!
    
    @EnvironmentObject var env: TodoEnvironment
    @ObservedObject var viewModel: TodoViewModel
    @State var name: String = ""

    var body: some View {
        NavigationView {

            VStack(alignment: .center) {
                TextField("Add new item",
                          text: self.$name,
                          onCommit: self.new)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 16)
                
                if self.viewModel.error {
                    Spacer()
                    Text("Something went wrong...")
                    Spacer()
                    Spacer()
                }
                else if self.viewModel.todos.isEmpty {
                    Spacer()
                    Text("Empty list.")
                    Button(action: {
                        self.presenter.fetch()
                    }) {
                        Text("Click to load items.")
                    }
                    Spacer()
                    Spacer()
                }
                else {
                    List {
                        ForEach(self.viewModel.todos) { todo in
                            TodoListItemView(todo: todo)
                            .onTapGesture {
                                //self.presenter.toggle(todo: todo)
                                self.presenter.open(id : todo.id)
                            }
                        }
                        .onDelete(perform: self.delete)
                    }
                }
            }
    
            .navigationBarTitle(Text(self.env.title))
        }
        //.onAppear(perform: self.presenter.fetch)
    }

    func new() {
        self.presenter.newTodo(with: self.name)
        self.name = ""
    }
    
    func delete(at offsets: IndexSet) {
        self.presenter.delete(at: offsets)
    }
}

#if DEBUG
struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        let presenter = TodoPresenter()
        let viewModel = TodoViewModel()
        presenter.viewModel = viewModel
        return TodoView(presenter: presenter,
                        viewModel: viewModel)
        .environmentObject(TodoEnvironment())
    }
}
#endif
