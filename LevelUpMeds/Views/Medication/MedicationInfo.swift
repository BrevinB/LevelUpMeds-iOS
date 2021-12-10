//
//  MedicationInfo.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI

struct MedicationInfo: View {
    
    @State private var text: String = "Take 1 tablet every 4 to 6 hours"
    @State private var noteTitle: String = "Benadryl Notes"
    
    var body: some View {
        
    
            ZStack {
                BackgroundColor(color: "Creamy Blue")
                Spacer()

                VStack {
                    MedicationCardView(time: "2:30", medication: "Benadryl")
                    
                    HStack {
                        Button(action: {
                            print("take")
                        }, label: {
                            Text("Take")
                                .frame(width: 180, height: 50)
                                .background(Color("Bright Orange"))
                                .cornerRadius(20)
                    })
                        
                        Button(action: {
                           print("skip")
                        }, label: {
                            Text("Forgot/Skip")
                                .frame(width: 170, height: 50)
                                .background(Color("Calm Grey"))
                                .cornerRadius(20)
                        })
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    TextField ("Enter Title", text: $noteTitle)
                        .frame(width: 360, height: 60)
                        .border(Color.black)
                        .background(.white)
                    
                    TextEditor(text: $text)
                        .frame(width: 360, height: 400)
                        .border(Color.black)
                   
                }

            }
        
        
        
    }
}

struct MedicationInfo_Previews: PreviewProvider {
    static var previews: some View {
        MedicationInfo()
    }
}



