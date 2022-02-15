//
//  userViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 1/19/22.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class profileViewModel: ObservableObject {
    
    @Published var profile = [Profile]()
    @Published var ID: String = ""
    var filteredProfiles: [Profile] {
        profile.filter { profile in
            profile.uid == Auth.auth().currentUser?.uid
        }
    }
    
    @Published var isCreated = false
    
    private var db = Firestore.firestore()
    
    init() {
        self.fetchData()
    }
    
    //get data from database
    func fetchData() {
        
        db.collection("Profiles").getDocuments { snapshot, error in

            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.profile = snapshot.documents.map { p in
                            let document = p.documentID
                            let fname = p["fname"] as? String ?? ""
                            let lname = p["lname"] as? String ?? ""
                            let initial = p["initial"] as? String ?? ""
                            //let accountID = p["accountID"] as? String ?? ""
                            let uid = p["uid"] as? String ?? ""
                            return Profile(documentID: "/Profiles/\(document)", fname: fname, lname: lname, initial: initial.lowercased(), uid: uid)
                      }
                    }
                }
            } else {
                //Handle error
            }
        }
        
    }
    
    //add document into database
    func addData(fname: String, lname: String) {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let str = fname
        let initial = Array(str)[0]
        
        
        db.collection("Profiles").addDocument(data: ["fname": fname, "lname": lname, "initial": initial.lowercased(), "uid": uid])

        self.isCreated = true
        
    }
    
    //get profileID for newly added user
    func getProfileID(fname: String, lname: String) {
        self.fetchData()
        var profileID: String = ""
        for profile in filteredProfiles {
            if profile.fname == fname && profile.lname == lname {
                profileID = profile.documentID
                print("\(profileID) this is in the loop")
                break
            }
        }
        
        self.ID = profileID
    }
}


