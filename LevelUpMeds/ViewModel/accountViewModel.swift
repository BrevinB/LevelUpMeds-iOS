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
                let password = data["password"] as? String ?? ""
                return Account(email: email, fname: fname, lname: lname, password: password)
                
                
            }
            
            //self.account = documents.
        }
    }
    
    func addData(fname: String, lname: String, email: String, password: String) {
        
        do {
            _ = try db.collection("Accounts").addDocument(data: ["fname": fname, "lname": lname, "email": email, "password": password])
        }
        catch {
            print(error.localizedDescription)
        }
      
    }
    
}



