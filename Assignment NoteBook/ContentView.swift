//
//  ContentView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import SwiftUI

struct ContentView: View {
  @State private var toDoHomework = ToDoHomework()
    @State private var  showingAddHomeworkView = false
    var body: some View {
        NavigationView {
            List {
                ForEach(toDoHomework.items) { work in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(work.priority).font(.headline)
                            Text(work.description)
                        }
                        Spacer()
                        Text(work.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    toDoHomework.items.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { IndexSet in
                    toDoHomework.items.remove(atOffsets: IndexSet)
                })
            }
            .sheet(isPresented: $showingAddHomeworkView) {
                AddHomeWorkView()
                    .environment(toDoHomework)
            }
            .navigationBarTitle("Homework", displayMode: .inline)
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                showingAddHomeworkView = true
            }, label: {
                Image(systemName: "plus")
            }))
        }
    }
}

#Preview {
    ContentView()
}
struct toDoHomework: Identifiable, Codable {
    var id = UUID()
    var priority = String()
    var description = String()
    var dueDate = Date()
    
}
