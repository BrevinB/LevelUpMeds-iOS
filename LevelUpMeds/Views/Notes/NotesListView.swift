//
//  NotesListView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct NotesListView: View {
    
    @ObservedObject var noteVM = notesViewModel()
    @State private var isNewNotePresented: Bool = false
    var profileID: String
    
    init(profileID: String) {
        self.profileID = profileID
        noteVM.profileID = profileID
    }
    
    var body: some View {
        
    
        VStack {
           
            List {
                ForEach(noteVM.filteredNotes) { n in
                    NotesCardView(note: n)
                }
                .onDelete(perform: deleteNote)
            }
            
           
            
            Spacer()
            
            ButtonView(title: "Add Note") {
                isNewNotePresented.toggle()
            }.sheet(isPresented: $isNewNotePresented, onDismiss: {
                noteVM.fetchData()
            }, content: {
                NewNoteView(profileID: profileID)
            }).frame(width: 350, height: 50)
            

        }
        .onAppear() {
            noteVM.fetchData()
        }
    }


    func deleteNote(at offsets: IndexSet) {
        
        for item in offsets {
            let note = noteVM.filteredNotes[item]
            
            noteVM.deleteNote(note: note)
        }
        noteVM.fetchData()
    }
    
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView(profileID: "")
    }
}


struct NotePreview: View {
    
    var date: String = ""
    var notePreview: String = ""
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 100)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            VStack {
                Text(date)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(notePreview)
                    .fontWeight(.medium)
                    .frame(width: 320)

            }
        }
    }
}
