//
//  LoadingView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/29/22.
//

import SwiftUI

struct LoadingView: View {
    
    @State var animation = false
    
    var body: some View {
        
        VStack {
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color("Bright Orange"), lineWidth: 7)
                .frame(width: 75, height: 75)
                .rotationEffect(.init(degrees: animation ? 360 : 0))
                .padding(50)
        }
        .background(Color.white)
        .cornerRadius(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.4).ignoresSafeArea(.all, edges: .all))
        .onAppear(perform: {
            
            withAnimation(Animation.linear(duration: 5)) {
                animation.toggle()
            }
        })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(animation: true)
            .preview(with: "Loading Animation")
        
    }
}
