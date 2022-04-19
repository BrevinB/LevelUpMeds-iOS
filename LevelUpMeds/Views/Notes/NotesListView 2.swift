//
//  NotesListView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct NotesListView: View {
    
    @State private var isNewNotePresented: Bool = false
    var body: some View {
        
        NavigationView {
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                
                VStack {
                    
                   
                    NotePreview(date: "Monday Oct 11th 2021 9am",
                                notePreview: "Alex's doctor's appointement was rescheduled to tomorrow at 10am" )
                            .padding()
                    
                    NotePreview(date: "Monday Oct 11th 2021 11am",
                                notePreview: "Alex fell down and hurt her arm this morning." )
                            .padding()
                    
                    NotePreview(date: "Monday Oct 11th 2021 1pm",
                                notePreview: "Alex had a very restless night and has been tired most of the day today" )
                            .padding()
                    
                   
                    
                    Spacer()
                    
                    Button(action: {
                        self.isNewNotePresented.toggle()
                    }) {
                        Text("Add Note")
                            .frame(width: 200, height: 50)
                            .background(Color("Bright Orange"))
                            .cornerRadius(20)
                            .padding()
                            .font(.title)
                    }.sheet(isPresented: $isNewNotePresented) {
                        NewNoteView()
                    }
                    

                }
                .foregroundColor(.black)
            }

        }
    }
}

struct NotesListView_Previews: PreviewProvider {
    static var previews: some View {
        NotesListView()
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
