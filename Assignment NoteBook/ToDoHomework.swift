//
//  ToDoHomework.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import Foundation

@Observable
class ToDoHomework {
    var items : [toDoHomework] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        }
    }
    init() {
        if let data = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try? JSONDecoder().decode([toDoHomework].self, from: data) {
                items = decodedData
                return
            }
        }
        items = []
    }
 }
 
 
