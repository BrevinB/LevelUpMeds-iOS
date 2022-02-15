//
//  AddProfileView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/30/22.
//

import SwiftUI

struct AddProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var userVM = profileViewModel()
    @State private var fname = ""
    @State private var lname = ""
    @State private var presentMedication = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 15) {
                VStack {
                    
                    InputTextFieldView(text: $fname, placeholder: "First Name", keyboardType: .default, sfSymbol: nil)
                    InputTextFieldView(text: $lname, placeholder: "Last Name", keyboardType: .default, sfSymbol: nil)

                }
                
                ButtonView(title: "Submit") {
                    //TODO: Add user
                    userVM.addData(fname: fname, lname: lname)
                    userVM.fetchData()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        userVM.getProfileID(fname: fname, lname: lname)
                        presentMedication.toggle()
                    }
                    
                   
                    
                    

                }
                .fullScreenCover(isPresented: $presentMedication, onDismiss: {
                    self.presentationMode.wrappedValue.dismiss()
                },
                content: {
                   
                    MedicationEditView(profileID: userVM.ID)
                })
                .padding()
            }
        }
    }
}

struct AddProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfileView()
    }
}
