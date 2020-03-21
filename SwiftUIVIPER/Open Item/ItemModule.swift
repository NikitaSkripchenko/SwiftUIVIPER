//
//  ItemModule.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 19.03.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import UIKit
import SwiftUI
import Combine


// MARK: - router
protocol TodoItemRouterPresenterInterface: RouterPresenterInterface {

}

// MARK: - presenter
protocol TodoItemPresenterRouterInterface: PresenterRouterInterface {

}

protocol TodoItemPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol TodoItemPresenterViewInterface: PresenterViewInterface {
    func fetch()
    func newTodo(with title: String)
    func delete(at offsets: IndexSet)
    func toggle(todo: TodoEntity)
    func open(todo : TodoEntity)
}

protocol TodoItemInteractorPresenterInterface: InteractorPresenterInterface {
    func requestPublisher() -> AnyPublisher<[TodoEntity], HTTP.Error>
}

final class TodoItemModule: ModuleInterface {
    typealias View = TodoView
    typealias Presenter = TodoPresenter
    typealias Router = TodoRouter
    typealias Interactor = TodoInteractor

    func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        let viewModel = TodoViewModel()
        let view = View(presenter: presenter, viewModel: viewModel)
            .environmentObject(TodoEnvironment())
        presenter.viewModel = viewModel

        self.assemble(interactor: interactor, presenter: presenter, router: router)

        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        return viewController
    }
}

