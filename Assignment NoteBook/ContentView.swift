//
//  ContentView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import SwiftUI

struct ContentView: View {
  @State private var assignmentList = ToDoHomework()
    var body: some View {
        NavigationView {
            List {
                ForEach(AssignmentList.items) { homework in
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
                    AssignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { IndexSet in
                    AssignmentList.items.remove(atOffsets: IndexSet)
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
