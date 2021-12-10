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
                            Text(" 06 ")
                            Text(" 07  ")
                            Text(" 08  ")
                            ZStack {
                               Circle()
                                    .stroke(Color("Bright Orange"), lineWidth: 4)
                                Text(" 09  ")
                            }
                            .frame(width: 30, height: 30)
                            Text(" 10  ")
                            Text(" 11  ")
                            Text(" 12  ")
                           
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding([.bottom], 10)
                    .background(Color("Calm Grey"))
                    
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text("Medication")
                                .padding()
                                .font(.title)
                            
                            NavigationLink(destination: MedicationInfo(), label: {
                                DashCardView(type: "Medication",
                                             time: "2:30 PM",
                                             nameIcon: "a.circle.fill",
                                             medication: "Benadryl")
                            })
                            
                            NavigationLink(destination: MedicationInfo(), label: {
                                DashCardView(type: "Medication",
                                             time: "3:30 PM",
                                             nameIcon: "b.circle.fill",
                                             medication: "Creatine")
                            })
                          
                        }
                        
                        
                        VStack(alignment: .leading) {
                            Text("Appointments")
                                .padding()
                                .font(.title)
                            
                            NavigationLink(destination: AppointementDetailView(), label: {
                                DashCardView(type: "Appointement",
                                             time: "10:00 AM",
                                             nameIcon: "h.circle.fill",
                                             medication: "")
                            })
                        }
                                        
                    }
                    
                }
                    
            }
            .navigationTitle("DashBoard")
            .navigationBarTitleDisplayMode(.inline)
        }
       

    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

struct DashCardView: View {

    var type: String
    var time: String
    var nameIcon: String
    var medication: String
    @State private var takeMed: Bool = false
    @State private var skipMed: Bool = false
    
    
    
    var body: some View {
        
       
        ZStack() {
            RoundedRectangle(cornerRadius: 0)
                .fill(.white)
                .frame(width: 360, height: 135)
                .shadow(color: .gray, radius: 25, x: -10, y: 10)
            
            
            
            VStack() {
                
                
                if type == "Medication" {
                    MedicationDashCardView(type: type,
                                           time: time,
                                           nameIcon: nameIcon,
                                           medication: medication)
                } else if type == "Appointement" {
                    AppointementDashCardView(type: type,
                                             time: time,
                                             nameIcon: nameIcon,
                                             addExtension: true)
                }
                    
                
               
            }
            .padding()
            .foregroundColor(.black)
        }
       
    }
 }

struct AppointementDashCardView: View {
    
    var type: String
    var time: String
    var nameIcon: String
    var addExtension: Bool = false
    @State private var takeMed: Bool = false
    @State private var skipMed: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: nameIcon)
                    .padding(.leading, 10)
                Spacer()
                Text(time)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(width: 360, height: 30)
            .background(Color("Dark Grey"))
            .foregroundColor(.white)
            
                
            HStack() {
                
                
                VStack {
                    Image(systemName: "calendar.badge.clock")
                        .padding([.trailing], 40)
                        .padding(.horizontal)
                }
                
                VStack {
                  
                    Text("Doctor Appointement with John Doe")
                        .font(.title3)
                    Text("1234 Appointment Drive")
                   
                    
                }
                
                Spacer()
                
                if addExtension == true {
                    Image(systemName: "arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .padding()
                }
                
                
            }
            
            
           
            HStack {
                Text("")
                    .frame(width: 180, height: 15)
                    .background(.white)
            }
        
            
        
        }
    }
}

struct MedicationDashCardView: View {
    
    var type: String
    var time: String
    var nameIcon: String
    var medication: String
    @State private var takeMed: Bool = false
    @State private var skipMed: Bool = false
    
    var body: some View {
        
        VStack {
            HStack {
                Image(systemName: nameIcon)
                    .padding(.leading, 10)
                Spacer()
                Text(time)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(width: 360, height: 30)
            .background(Color("Dark Grey"))
            .foregroundColor(.white)
            
                
            HStack(spacing: 20) {
                
                
                VStack {
                    Image(systemName: "pills.fill")
                        .padding([.trailing], 40)
                        .padding(.horizontal)
                }
                
                VStack {
                  
                    Text(medication)
                    Text("1 Pill")
                   
                    
                }
                
                Spacer()
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .padding()
               
                
            }
            
            if type == "Medication" {
                HStack {
                    
                    if !takeMed && !skipMed {
                        Button(action: {
                            takeMed.toggle()
                        }, label: {
                            Text("Take")
                                .frame(width: 180, height: 30)
                                .background(Color("Bright Orange"))
                        })
                        
                        Button(action: {
                            skipMed.toggle()
                        }, label: {
                            Text("Forgot/Skip")
                                .frame(width: 170, height: 30)
                                .background(Color("Calm Grey"))
                        })
                    } else if takeMed {
                       
                        Text("Med Taken at \(Date(), style: .time)")
                            .frame(width: 360, height: 30)
                            .background(Color("Bright Orange"))
                    
                    } else if skipMed{
                        Text("Med Skipped at \(Date(), style: .time)")
                            .frame(width: 360, height: 30)
                            .background(Color("Calm Grey"))
                    }
                    
                   
                }
                .background(Color("Bright Orange"))
            }
        }
        
    }
}
