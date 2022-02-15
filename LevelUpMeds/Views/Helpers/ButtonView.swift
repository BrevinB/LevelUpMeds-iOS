//
//  ButtonComponentView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/23/22.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    //let width: CGFloat
    let maxHeight: CGFloat
    private let cornerRadius: CGFloat = 10
    
    internal init(title: String,
                  background: Color  = Color("Bright Orange"),
                  //width: CGFloat = 350,
                  foreground: Color  = .white,
                  border: Color      = .clear,
                  maxHeight: CGFloat = 50,
                  handler: @escaping ButtonView.ActionHandler) {
        
        self.title       = title
        self.background  = background
        self.foreground  = foreground
        self.border      = border
        self.handler     = handler
        self.maxHeight   = maxHeight
       // self.width       = width
        
    }
    
    var body: some View {
       
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: maxHeight)
        })
            .background(background)
            .foregroundColor(foreground)
            .font(.system(size: 16, weight: .bold))
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(border, lineWidth: 2)
            )
        
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonView(title: "Primary Button") { }
            .preview(with: "Primary Button View")
            
            ButtonView(title: "Secondary Button",
                       background: .clear,
                       foreground: Color("Bright Orange"),
                       border: Color("Bright Orange")) { }
            .preview(with: "Secondary Button View")
        }
        
    }
}
