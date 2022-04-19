//
//  accountViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/29/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth



class accountViewModel: ObservableObject {
    
    @Published var account = [Account]()
    @Published var currAccount: Account = Account(email: "", fname: "", lname: "", uid: "")
    
    var filteredAccounts: [Account] {
        account.filter { account in
            account.uid == Auth.auth().currentUser?.uid
        }
    }
    init() {
        self.fetchData()
        self.getAccount()
    }

    private var db = Firestore.firestore()

    func fetchData() {

        db.collection("Accounts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.account = documents.map { (queryDocumentSnapshot) -> Account in
                let data = queryDocumentSnapshot.data()
                let fname = data["fname"] as? String ?? ""
                let lname = data["lname"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let uid = data["uid"] as? String ?? ""
                return Account(email: email, fname: fname, lname: lname, uid: uid)
                
                
            }
            
        }
    }
    
    func addData(fname: String, lname: String, email: String, uid: String) {
     
        
        
        print(uid)
        
        //db.collection("Accounts").addDocument(data: ["fname": fname, "lname": lname, "email": email, "uid": uid ?? ""])
        do {
                  _ = try db.collection("Accounts").addDocument(data: ["fname": fname, "lname": lname, "email": email, "uid": uid ?? ""])
              }
              catch {
                  print(error.localizedDescription)
              }
        
    }
    
   func getAccount() {
       
        if filteredAccounts.isEmpty {
            print("No accounts")
        } else {
            currAccount = filteredAccounts[0]
        }
    }
    
  
    
}



