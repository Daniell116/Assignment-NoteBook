//
//  AddHomeWorkView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/29/26.
//

import SwiftUI

struct AssignmentView: View {
    @Environment(Assigment.self) var assigmentHomeworks
    @Environment(\.dismiss) var homeworkDismiss
    static let subject = ["Math", "Science", "Einglish", "Other"]
    @State private var course = ""
    @State private var homeworkList = ""
    @State private var date = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Subject", selection: $course) {
                    ForEach(Self.subject, id: \.self) { subjects in
                    Text(subjects)
                    }
                }
                TextField("Assigment", text: $homeworkList)
                DatePicker("Date", selection: $date, displayedComponents: .date)
            }
            .scrollContentBackground(.hidden)
            .background(Color.cyan.opacity(0.2))
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save Assignemnts") {
                if homeworkList.count > 0, homeworkList.count > 0 {
                    let homework = assigmentHomework(course: course, homeworkList: homeworkList, date: date)
                    assigmentHomeworks.homework.append(homework)
                    homeworkDismiss()
                }
            })
            }
        }
    }



