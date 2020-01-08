//
//  TodoRouter.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//

import Foundation
import UIKit

final class TodoRouter: RouterInterface {

    weak var presenter: TodoPresenterRouterInterface!

    weak var viewController: UIViewController?
}

extension TodoRouter: TodoRouterPresenterInterface {

}
