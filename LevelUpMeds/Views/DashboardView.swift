//
//  DashboardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/13/21.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            
                ZStack {
                    BackgroundColor(color: "Creamy Blue")
                    ScrollView {
                        
                    VStack {
                    
                        VStack {
                            HStack() {
                                Text("Mon ")
                                Text("Tue ")
                                Text("Wed ")
                                Text("Thu ")
                                Text("Fri ")
                                Text("Sat ")
                                Text("Sun ")
                               
                            }
                            HStack() {
                                ZStack {
                                   Circle()
                                        .stroke(Color("Bright Orange"), lineWidth: 4)
                                    Text("11")
                                }
                                .frame(width: 30, height: 30)
                                Text(" 12  ")
                                Text(" 13  ")
                                Text(" 14  ")
                                Text(" 15  ")
                                Text(" 16  ")
                                Text(" 17  ")
                               
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color("Calm Grey"))
                        .padding(.bottom)
                        
                        Spacer()

                        VStack(alignment: .leading) {
                            Text("Medication")
                                .padding()
                                .font(.title)
                            
//                            Text("6:30 PM")
//                                .frame(width: 349, height: 40)
//                                .background(Color.gray)
                            
                            NavigationLink(destination: MedicationList(), label: {
                                DashCardView()
                            })
                            
                            DashCardView()
                          
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Appointments")
                                .padding()
                                .font(.title)
                            
                            NavigationLink(destination: MedicationList(), label: {
                                DashCardView()
                            })
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .padding()
                                .font(.title)
                            
                            NavigationLink(destination: MedicationList(), label: {
                                DashCardView()
                            })
                            
                        }
                        
                    }
                    
                }
                    
            }
        }

    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct DashCardView: View {

    var body: some View {
        
       
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 350, height: 75)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            
            
            HStack(spacing: 20) {
                
                
                VStack {
                    Image(systemName: "pills.fill")
                        .padding([.trailing], 40)
                        .padding(.horizontal)
                }
                
                VStack {
                    Text("Creatine")
                    Text("3 pills")
                    
                }
                
                Spacer()
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding()
               
                
            }
            
        }
        .padding()
        .foregroundColor(.black)
    }
 }
