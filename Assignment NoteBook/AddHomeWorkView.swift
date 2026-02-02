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
    static let priorities = ["Math", "Science", "Einglish", "Other"]
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                    Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New To-Do Item", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                if priority.count > 0, description.count > 0 {
                    let item = Assignment_NoteBook.toDoHomework(priority: priority, description: description, dueDate: dueDate)
                    toDoHomework.items.append(item)
                    dismiss()
                }
            })
            }
        }
    }



