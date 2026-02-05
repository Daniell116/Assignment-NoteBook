//
//  ToDoHomework.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import Foundation

@Observable
class Assigment {
    var  homework : [assigmentHomework] {
        didSet {
            if let encodedData = try? JSONEncoder().encode(homework) {
                UserDefaults.standard.set(encodedData, forKey: "data")
            }
        }
    }
    init() {
        if let List = UserDefaults.standard.data(forKey: "data") {
            if let decodedData = try? JSONDecoder().decode([assigmentHomework].self, from: List) {
                homework = decodedData
                return
            }
        }
        homework = []
    }
 }
 
 
