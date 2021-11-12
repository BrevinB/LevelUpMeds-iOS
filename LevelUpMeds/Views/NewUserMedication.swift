//
//  NewUserMedication.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI

struct NewUserMedication: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthday = Date()
    
    var body: some View {
        NavigationView {
            VStack() {
                Spacer()
                HStack (alignment: .center, spacing: 10) {
                    TextField ("First Name", text: $firstName)
                        .frame(height: 60)
                }
                .padding([.top,.bottom], 2)
                .padding(.leading, 5)
                .background(Color.white, alignment: .center)
                .cornerRadius(10)
                .frame(width: 300)
                .padding(20)
            
                HStack (alignment: .center, spacing: 10) {
                    TextField ("Last Name", text: $lastName)
                        .frame(height: 60)
                }
                .padding([.top,.bottom], 2)
                .padding(.leading, 5)
                .background(Color.white, alignment: .center)
                .cornerRadius(10)
                .frame(width: 300)
                .padding(20)
                
                
                HStack {
                    Image(systemName: "calendar")
                    DatePicker("Birthday:", selection: $birthday, in: ...Date(), displayedComponents: .date)
                    
                }
                .padding([.top,.bottom], 2)
                .padding(.leading, 5)
                .background(Color.white, alignment: .center)
                .cornerRadius(10)
                .frame(width: 300)
                .padding(50)
                
                Spacer()
                Spacer()
                
                NavigationLink(destination: MedicationInfo()) {
                    HStack {
                        Spacer()
                        ZStack(alignment: .trailing) {
                            Text("Next")
                                .padding(10)
                                .frame(width: 100, alignment: .leading)
                                .background(Color("Bright Orange"))
                                .cornerRadius(20)
                                .foregroundColor(.black)
                               
                                
                            Image(systemName: "arrow.right")
                                .font(.system(size: 25))
                                
                        }
                        .font(.title)
                    }
                    
                }
               
                
            }
            .foregroundColor(.black)
            
        }
    }
}

struct NewUserMedication_Previews: PreviewProvider {
    static var previews: some View {
        NewUserMedication()
    }
}
