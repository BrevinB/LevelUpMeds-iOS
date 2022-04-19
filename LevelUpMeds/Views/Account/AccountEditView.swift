//
//  AccountEditView.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 2/26/22.
//

import FirebaseAuth
import SwiftUI

struct AccountEditView: View {
    
    @StateObject private var accountVM = accountViewModel()
    @State private var resetPassword = false

    init() {
        //accountVM.fetchData()
    }
    
    var body: some View {
        VStack {
            List {
                Text("Email: \(accountVM.currAccount.email)")
                Text("First Name: \(accountVM.currAccount.fname)")
                Text("Last Name: \(accountVM.currAccount.lname)")
            }
            .onAppear() {
                accountVM.fetchData()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {  accountVM.getAccount() }
               
        }
            
            ButtonView(title: "Change Password", handler: {
                resetPassword.toggle()
            }).sheet(isPresented: $resetPassword, content: {
                ForgotPasswordView()
            })
        }
        
    }
    
}

struct AccountEditView_Previews: PreviewProvider {
    static var previews: some View {
        AccountEditView()
    }
}


