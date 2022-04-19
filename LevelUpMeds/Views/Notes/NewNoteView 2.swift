//
//  NewNoteView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 12/9/21.
//

import SwiftUI

struct NewNoteView: View {
    @State private var noteTitle: String = ""
    @State private var text: String = ""
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

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
