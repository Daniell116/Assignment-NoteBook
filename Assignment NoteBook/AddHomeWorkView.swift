//
//  AddHomeWorkView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/29/26.
//

import SwiftUI

struct AddHomeWorkView: View {
    @State private var priority = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(AssignmentList.self) var toDoHomework
    @Environment(\.dismiss) var dismiss
    static let prorities = ["Low", "Medium", "High"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Priority", selection: $priority) {
                    ForEach(Self.prorities, id: \.self) { priority in
                        Text(priority)
                    }
                }
            }
        }
    }
}


