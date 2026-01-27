//
//  ContentView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import SwiftUI

struct ContentView: View {
    @State private var dueDate = Date()
    @State private var description = ""
    @State private var  toDoHomework =
    [ToDoHomework(priority: "Math", description: "Linear", dueDate: Date()),
     ToDoHomework(priority: "History", description: "Study test", dueDate: Date()),
     ToDoHomework(priority: "English", description: "Do reading", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoHomework) { homework in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(homework.priority).font(.headline)
                            Text(homework.description)
                        }
                        Spacer()
                        Text(homework.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoHomework.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    toDoHomework.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Homework", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
struct ToDoHomework: Identifiable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
    
}
