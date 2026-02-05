//
//  ContentView.swift
//  Assignment NoteBook
//
//  Created by daniell Escareno on 1/27/26.
//

import SwiftUI

struct ContentView: View {
  @State private var assigmentHomeworks = Assigment()
    @State private var  addingNewHomework = false
    var body: some View {
        NavigationView {
                List {
                    ForEach(assigmentHomeworks.homework) { work in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(work.course).font(.headline)
                                    .foregroundColor(.black)
                                Text(work.description)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            Text(work.date, style: .date)
                                .foregroundColor(.red)
                        }
                        .listRowBackground(Color.black.opacity(0.2))
                    }
                    .onMove(perform: { homeworklist, list in
                        assigmentHomeworks.homework.move(fromOffsets: homeworklist, toOffset: list)
                    })
                    .onDelete(perform: { removeHomework in
                        assigmentHomeworks.homework.remove(atOffsets: removeHomework)
                    })
                }
                .background(Color(.systemTeal))
                .scrollContentBackground(.hidden)
                .sheet(isPresented: $addingNewHomework) {
                    AssignmentView()
                        .environment(assigmentHomeworks)
                }
                .navigationBarTitle("Homework", displayMode: .inline)
                .navigationBarItems(leading: EditButton(),
                                    trailing: Button(action: {
                    addingNewHomework = true
                }, label: {
                    Image(systemName: "plus")
                }))
                
        }
    }
}

#Preview {
    ContentView()
}
struct assigmentHomework: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var date = Date()
    
}
