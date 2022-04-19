//
//  NewNoteView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/9/21.
//

import SwiftUI

struct NewNoteView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var noteVM = notesViewModel()
    @State private var noteTitle: String = ""
    @State private var text: String = ""
    @State var profileID: String
    
    var body: some View {
          
        ScrollView {
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
                    noteVM.addData(title: noteTitle,
                                   note: text,
                                   time: Date.now,
                                   profileID: profileID )
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
                .frame(width: 250, height: 50)

            }
        }
        
            
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(profileID: "")
    }
}
