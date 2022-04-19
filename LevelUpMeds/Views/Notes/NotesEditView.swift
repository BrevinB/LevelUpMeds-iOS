//
//  NotesEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct NotesEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var noteVM = notesViewModel()
    @State private var noteTitle: String = ""
    @State private var text: String = ""
    var note: Notes
    
    init(note: Notes) {
        self.note = note
    }
    
    var body: some View {
       
        ScrollView() {
            Spacer()
            Spacer()
            VStack(spacing: 50) {

              
                VStack(alignment: .leading) {
                    Text("Title:")
                        .font(.title2)
                        .fontWeight(.bold)
                        
                    TextField ("Enter Title", text: $noteTitle)
                        .padding()
                        .frame(width: 360, height: 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("Bright Orange"), lineWidth: 2)
                    )
                }
                    
                
                VStack(alignment: .leading) {
                    Text("Note:")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    TextEditor(text: $text)
                        .padding()
                        .frame(width: 350, height: 350)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("Bright Orange"), lineWidth: 2)
                        )
                    .submitLabel(.return)
                }
                
            
                
                ButtonView(title: "Submit Note") {
                    noteVM.updateData(title: noteTitle, note: text, time: Date.now, profileID: note.profileID, ID: note.documentID)
                    self.presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 250, height: 50)

            }
        }
        .onTapGesture {
            self.hideKeyboard()
          }
        .foregroundColor(.black)
        .onAppear() {
            setData()
        }
            
        
    }
    
    func setData() {
        noteTitle = note.title
        text = note.note
        
    }
}

struct NotesEditView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testNote: Notes = Notes(documentID: "", title: "Note Title", note: "This is the note", profileID: "", time: Date.now)
        
        NotesEditView(note: testNote)
    }
}
