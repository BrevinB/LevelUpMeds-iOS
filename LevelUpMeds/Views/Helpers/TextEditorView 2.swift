//
//  TextEditorView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/25/22.
//

import SwiftUI

struct TextEditorView: View {
    
    @State var text: String
    
    var body: some View {
        
            TextEditor(text: $text)
                .padding()
                .border(Color("Bright Orange"), width: 2)
                .foregroundColor(Color.black)
                .frame(width: 350, height: 250)
//                .cornerRadius(10)
                
    }
}

struct TextEditorView_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorView(text: "Enter Text")
    }
}
