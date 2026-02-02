//
//  ToDoHomework.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import Foundation

@Observable
class ToDoHomework {
    var items = [toDoHomework(priority: "math", description: "Finish algebra homework", dueDate: Date()),
                 toDoHomework(priority: "science", description: "finish biology project", dueDate: Date()),
                 toDoHomework(priority: "english", description: "Finish reading", dueDate: Date()),
                 toDoHomework(priority: "other", description: "", dueDate: Date())]
 }
 
