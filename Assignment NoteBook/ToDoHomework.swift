//
//  ToDoHomework.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import Foundation

@Observable
class AssignmentList {
    var items = [ToDoHomework(priority: "easy", description: "Finish Swift project", dueDate: Date()),
                 ToDoHomework(priority: "Medium", description: "Do Math homework", dueDate: Date()),
                 ToDoHomework(priority: "Hard", description: "Finish history homework", dueDate: Date())]
 }
 
