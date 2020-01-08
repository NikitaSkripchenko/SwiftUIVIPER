//
//  TodoListItemView.swift
//  SwiftUIVIPER
//
//  Created by Trexoz MCL on 08.01.2020.
//  Copyright © 2020 nktskr. All rights reserved.
//
import Foundation
import SwiftUI

struct TodoListItemView: View {

    @EnvironmentObject var env: TodoEnvironment

    let todo: TodoEntity

    var body: some View {
        VStack(alignment: .leading) {
            Text(self.todo.title).font(.headline)
            if self.todo.completed {
                Text("Completed")
                    .foregroundColor(.green)
            }
            else {
                Text("NOT Completed").font(.body)
                    .foregroundColor(.red)
            }
        }
    }
}
