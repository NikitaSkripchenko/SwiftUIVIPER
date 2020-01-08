//
//  Viper.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
//interfaces
public protocol RouterPresenterInterface: class {

}

public protocol InteractorPresenterInterface: class {

}

public protocol PresenterRouterInterface: class {

}

public protocol PresenterInteractorInterface: class {

}

public protocol PresenterViewInterface: class {

}

public protocol ViewPresenterInterface: class {

}


public protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter
    
    var presenter: PresenterRouter! { get set }
}


public protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor
    
    var presenter: PresenterInteractor! { get set }
}

public protocol ViewInterface{
    associatedtype PresenterView
    
    var presenter: PresenterView! { get set }
}

public protocol EntityInterface {

}

public protocol PresenterInterface: PresenterInteractorInterface & PresenterRouterInterface & PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    
    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
    
}

//module

public protocol ModuleInterface {
    associatedtype View where View: ViewInterface
    associatedtype Interactor where Interactor: InteractorInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    
    func assemble(interactor: Interactor, presenter: Presenter, router: Router)
}

public extension ModuleInterface {
    func assemble(interactor: Interactor, presenter: Presenter, router: Router) {
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
