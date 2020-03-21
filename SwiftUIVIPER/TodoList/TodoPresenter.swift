//
//  TodoPresenter.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import Combine

final class TodoPresenter: PresenterInterface {

    var router: TodoRouterPresenterInterface!
    var interactor: TodoInteractorPresenterInterface!
    weak var viewModel: TodoViewModel!
    
    var request: AnyCancellable?
}

extension TodoPresenter: TodoPresenterRouterInterface {

}

extension TodoPresenter: TodoPresenterInteractorInterface {

}

extension TodoPresenter: TodoPresenterViewInterface {

    func fetch() {
        self.request = self.interactor.requestPublisher()
        .on(queue: .main)
        .on(success: { [weak self] data in
            self?.viewModel.todos = data
        }, failure: { [weak self] error in
            self?.viewModel.error = true
        })
    }

    func newTodo(with title: String) {
        let newTodo = TodoEntity(id: self.viewModel.todos.count, title: title, completed: false)
        self.viewModel.todos.insert(newTodo, at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        self.viewModel.todos.remove(atOffsets: offsets)
    }
    
    func toggle(todo: TodoEntity) {
        guard let index = self.viewModel.todos.firstIndex(where: { $0.id == todo.id}) else {
            return
        }
        let newTodo = TodoEntity(id: todo.id, title: todo.title, completed: !todo.completed)
        self.viewModel.todos[index] = newTodo
    }
    
    func open(todo: TodoEntity) {
         print(1)
    }

}
