//
//  AddHomeWorkView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/29/26.
//

import SwiftUI

struct AddHomeWorkView: View {
    @Environment(ToDoHomework.self) var toDoHomework
    @Environment(\.dismiss) var dismiss
    static let prorities = ["Low", "Medium", "High"]
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
        Form {
            Picker("Priority", selection: $priority) {
                ForEach(Self.prorities, id: \.self) { priority in
                    Text(priority)
                }
            }
        }
        TextField("Description", text: $description)
        DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
    }
    .navigationBarTitle("Add  new Homework", displayMode: .inline)
    .navigationBarItems(trailing: Button("Save") {
        if priority.count > 0, description.count > 0 {
            let item = ToDoHomework(priority: priority, description: description, dueDate: dueDate)
            toDoHomework.items.append(item)
            dismiss()
        }
    })
    }
}


