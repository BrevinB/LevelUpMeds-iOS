//
//  NotesEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/6/21.
//

import SwiftUI

struct NotesEditView: View {
    @State private var noteTitle: String = "12/09/2021"
    @State private var text: String = "Alex's doctor's appointement was rescheduled to tomorrow at 10am"
    var body: some View {
        ZStack {
            BackgroundColor(color: "Creamy Blue")
            
            VStack {
               
                Spacer()
                
                TextField ("Enter Title", text: $noteTitle)
                    .frame(width: 360, height: 60)
                    .border(Color.black)
                    .background(.white)
                
                TextEditor(text: $text)
                    .frame(width: 360, height: 400)
                    .border(Color.black)
                
                Spacer()
                
                Button(action: {
                    print("SUBMIT")
                }, label: {
                    Text("Submit Note")
                        .frame(width: 200, height: 50)
                        .background(Color("Bright Orange"))
                        .cornerRadius(20)
                        .padding()
                        .font(.title)
                })

            }
            .foregroundColor(.black)
        }
    }
}

struct NotesEditView_Previews: PreviewProvider {
    static var previews: some View {
        NotesEditView()
    }
}
