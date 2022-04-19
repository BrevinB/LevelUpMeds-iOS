//
//  MedicationInfo.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 11/9/21.
//

import SwiftUI
import FirebaseFirestore

struct MedicationInfo: View {
    
    @StateObject private var medHistoryVM = medHistoryViewModel()
    @State private var text: String = ""
    @State private var noteTitle: String = ""
    @State private var isTaken: Bool = false
    @State private var isSkipped: Bool = false
    @State private var timeTaken = Date()
    @State private var timeSkipped = Date()
    @State private var medicationDate = Date()
    private let dateFormatter = DateFormatter()
    var medication: Medication
    
    init(medication: Medication) {
        self.medication = medication
        dateFormatter.dateFormat = "hh:mm a"
    }
    
    var body: some View {
        

                VStack {
                   
                    MedicationCardView(medication: medication, showAdditional: false, currDate: Date())
                        .padding()
                    
                    HStack {
                        
                        if !isSkipped && !isTaken {
                            Button(action: {
                                medHistoryVM.takeMed(medication: medication, date: Date())
                            }, label: {
                                Text("Take")
                                    .frame(width: 180, height: 50)
                                    .background(Color("Bright Orange"))
                                    .cornerRadius(20)
                        })

                            Button(action: {
                                medHistoryVM.skipMed(medication: medication, date: Date())
                            }, label: {
                                Text("Forgot/Skip")
                                    .frame(width: 170, height: 50)
                                    .background(Color("Calm Grey"))
                                    .cornerRadius(20)
                            })

                        } else if isSkipped && !isTaken {
                            Text("Medication Skipped at \(dateFormatter.string(from:timeSkipped))")
                                .frame(width: 350, height: 35)
                                .background(.gray)
                                .cornerRadius(20)
                        } else {
                            Text("Medication Taken at \(dateFormatter.string(from: timeTaken))")
                                .frame(width: 350, height: 35)
                                .background(Color("Bright Orange"))
                                .cornerRadius(20)
                                
                        }
                        
                    }
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(noteTitle)
                        .font(.title)
                        
                
                    
                    TextEditor(text: .constant(text))
                        .frame(width: 360, height: 400)
                        .border(Color.black)
                    
                   
                }
                .onAppear {
                    setData()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        
                        checkMedicationState()
                    }
                }

    }
    
    
    private func setData() {
        noteTitle = medication.name + " " + "Notes"
        text = medication.notes
    }
    
    private func checkMedicationState() {
        let history = medHistoryVM.getMedHistory(med: medication)
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyy-MM-dd"
        
        //print(currDate)
        
        for val in history.times {
            
                let data = (val["time"]! as AnyObject).dateValue()
          
            if dateFormatter2.string(from: data) == dateFormatter2.string(from: Date()) {
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
}

struct MedicationInfo_Previews: PreviewProvider {
    static var previews: some View {
        
        let testMedication = Medication(documentID: "",
                                        amount: "6 pills",
                                        days: ["f":true, "m":true, "t":false, "w":true, "r":false, "u":false, "s":false],
                                        name: "Creatine",
                                        notes: "Take 6 a day",
                                        notificationsEnabled: true,
                                        profileID: "/Profiles/k2f4OJeJS8JUs0kShO3O", time: Date())
        
        MedicationInfo(medication: testMedication)
    }
}



