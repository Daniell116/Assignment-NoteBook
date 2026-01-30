//
//  ToDoHomework.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import Foundation

@Observable
class ToDoHomework {
    var items = [toDoHomework(priority: "easy", description: "Finish Swift project", dueDate: Date()),
                 toDoHomework(priority: "Medium", description: "Do Math homework", dueDate: Date()),
                 toDoHomework(priority: "Hard", description: "Finish history homework", dueDate: Date())]
 }
 
