//
//  NotesCardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/5/22.
//

import SwiftUI

struct NotesCardView: View {
    
    @ObservedObject var noteVM = notesViewModel()
    @ObservedObject var calendarModel = CalendarViewModel()
    @State private var isShowingEdit = false
    var note: Notes
    
    init(note: Notes) {
        self.note = note
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(note.title)
                            .font(.title2.bold())
                        
                        Text(note.note)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }
                    .hLeading()
                    
                    Text(note.time.formatted(date: .abbreviated, time: .shortened))
                }
                
                //if calendarModel.isCurrentHour(date: appointment.appointmentDate) {
             
                    HStack(spacing: 0) {
                        

                        Spacer()

                     
                            Button(action: {
                                isShowingEdit.toggle()
                            }, label: {
                                Text("Edit")
                                    .padding(.horizontal)
                            })
                                .sheet(isPresented: $isShowingEdit, onDismiss: {
                                    noteVM.fetchData()
                                }, content: {
                                    NotesEditView(note: note)
                                })
                        
                    }
                    .padding(.top)
                //}
            }
            
                .foregroundColor(calendarModel.isCurrentHour(date: note.time) ? .white : .black )
                //.padding(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 15 : 0)
                .padding(15)
                .hLeading()
    //                .background(colorScheme == .dark ? Color(UIColor.darkGray) : Color.black)
                .background(.black)
                    .cornerRadius(25)
               //.padding(.bottom, calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 0 : 10)
                    .padding(.bottom, 0)
                    //.opacity(calendarModel.isCurrentHour(date: appointment.appointmentDate) ? 1 : 0)
                .opacity(1)
        }
        .padding()
            
    }
}

struct NotesCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let testNote: Notes = Notes(documentID: "", title: "Note Title", note: "This is the note", profileID: "", time: Date.now)
        
        NotesCardView(note: testNote)
    }
}
