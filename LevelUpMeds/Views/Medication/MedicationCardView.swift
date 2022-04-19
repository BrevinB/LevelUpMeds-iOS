//
//  MedicationCardView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/15/22.
//

import SwiftUI
import FirebaseFirestore

struct MedicationCardView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var calendarModel = CalendarViewModel()
    @ObservedObject var profileVM = profileViewModel()
    @ObservedObject var appointmentVM = appointmentViewModel()
    @ObservedObject var medicationVM = medicationViewModel()
    @ObservedObject var medHistoryVM = medHistoryViewModel()
    var currDate: Date = Date()
    var medication: Medication
    var showAdditional: Bool
    private let dateFormatter = DateFormatter()
    @State private var medicationDate = Date()
    @State private var isTaken = false
    @State private var isSkipped = false
    @State private var isShowingEdit = false
    @State private var timeTaken = Date()
    @State private var timeSkipped = Date()
    
    init(medication: Medication, showAdditional: Bool, currDate: Date) {
        dateFormatter.dateFormat = "hh:mm a"
        self.medication = medication
        self.showAdditional = showAdditional
        self.currDate = currDate
        self.medHistoryVM.fetchData()
        
       
       
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            
            if showAdditional {
              CardLines()
            }
            
            VStack {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 12) {
                        
                        Text(medication.name)
                            .font(.title2.bold())
                        
                        Text(medication.notes)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                        
                        
                    }
                    .hLeading()
                    
                    Text(dateFormatter.string(from: medication.time))
                    
                    
                }
                
                if !showAdditional {
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                           
                                Button(action: {
                                    isShowingEdit.toggle()
                                }, label: {
                                    Text("Edit")
                                        .frame(width: 50, height: 20)
                                })
                                    .sheet(isPresented: $isShowingEdit, onDismiss: {
                                        medicationVM.fetchData()
                                    },
                                    content: {
                                        MedicationEditView(medication: medication)
                                    })
                            
                        }
                       
                    }
                }
                
                if showAdditional {
                    
                    let name = getProfileInitial()
                    let initial = Array(name)[0]
                    
                    VStack() {
                        
                      
                        HStack() {
                                Image(systemName: "\(initial.lowercased()).circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                        .background(

                                            Circle()
                                                .stroke(.white, lineWidth: 5)
                                        )
                                        

                                Text(name)
                                    .padding()
                            
                            Spacer()
                            }
                            .padding(.bottom)
                
                        
                        
                        
                        HStack(spacing: 56) {
                                if isTaken == false && isSkipped == false {
                                    Button(action: {
                                        
                                        medHistoryVM.takeMed(medication: medication,
                                                             date: currDate)
                                        isTaken.toggle()
                                    }, label: {
                                        Text("Take")
                                    })
                                    
                                    
                                    
                                    Button(action: {
                                        
                                        medHistoryVM.skipMed(medication: medication,
                                                             date: currDate)
                                        checkMedicationState()
                                        
                                        isSkipped.toggle()
                                    }, label: {
                                        Text("Forgot/Skip")
                                    })
                                } else if isTaken == true && isSkipped == false {
                                    //TODO: Add more functionality for taking
                                    Text("Taken at \(dateFormatter.string(from: timeTaken))")
                                } else {
                                    //TODO: Add more functionality for skipping
                                    Text("Skipped at \(dateFormatter.string(from: timeSkipped))")
                                }
                            }
                        
                    }
                    .padding()
                    
                }
                
            }
            .foregroundColor(calendarModel.isCurrentHour(date: Date.now) ? .white : .black)
            .padding(calendarModel.isCurrentHour(date: Date.now) ? 15 : 0)
            .padding(.bottom, calendarModel.isCurrentHour(date: Date.now) ? 0 : 10)
            .hLeading()
            .background(
            
                Color(.black)
                    .cornerRadius(25)
                    .opacity(calendarModel.isCurrentHour(date: Date.now) ? 1 : 0)
            
            )
        }
        .onChange(of: calendarModel.currentDay) { newValue in
            if showAdditional {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    checkMedicationState()
                }
            }
            
        }
        .onAppear {
            isTaken = false
            isSkipped = false
            
            if showAdditional {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    
                    checkMedicationState()
                }
            }
        }
      
    }
    
    func checkMedicationState() {
        let history = medHistoryVM.getMedHistory(med: medication)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyy-MM-dd"

        for val in history.times {
            
                let data = (val["time"]! as AnyObject).dateValue()
          
            if dateFormatter2.string(from: data) == dateFormatter2.string(from: currDate) {
                medicationDate = data
                if (val["taken"]! as AnyObject).boolValue == true {
                    isTaken = true
                    timeTaken = medicationDate
                    break
                } else {
                    isSkipped = true
                    timeSkipped = medicationDate
                    break
                }
            } else {
                isTaken = false
                isSkipped = false
            }
            }
            
        }
    
    
    
    func getProfileInitial() -> String {
        
        var name: String = "a"
        
        for prof in profileVM.filteredProfiles {
            
            if medication.profileID == "/Profiles/\(prof.documentID)" {
                name = prof.fname
                break
            }
        }
        
        return name
    }

}
    


struct MedicationCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        let medication: Medication = Medication(documentID: "",
                                                amount: "2 Pills",
                                                days: ["f":true, "m":true, "t":false, "w":true, "r":false, "u":false, "s":false],
                                                name: "Creatine",
                                                notes: "Take 3 in the morning and 3 after a workout",
                                                notificationsEnabled: true,
                                                profileID: "/Profiles/k2f4OJeJS8JUs0kShO3O",
                                                time: Date())
        
        Group {
            MedicationCardView(medication: medication, showAdditional: true, currDate: Date())
                .preview(with: "Showing Options")
            
            MedicationCardView(medication: medication, showAdditional: false, currDate: Date())
                .preview(with: "Not Showing Options")
        }
    }
}
