//
//  notesViewModel.swift
//  LevelUpMeds
//
//  Created by Brevin Blalock on 4/5/22.
//

import Foundation
import FirebaseFirestore

class notesViewModel: ObservableObject {
    
    @Published var notes: [Notes] = []
    @Published var profileID = ""
    var filteredNotes: [Notes] {
        notes.filter { n in
            n.profileID == profileID
        }
    }
    @Published var allNotes: [Notes] = []
    
    
    init() {
        self.fetchData()
    }
    
    
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("Notes").getDocuments { snapshot, error in
            
            if error == nil {
                //no error
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.notes = snapshot.documents.map { n in
                            let documentID = n.documentID
                            let title = n["title"] as? String ?? ""
                            let note = n["note"] as? String ?? ""
                            let profileID = n["profileID"] as? String ?? ""
                            let time = n["time"] as? Date ?? Date.now
                            return Notes(documentID: documentID,
                                         title: title,
                                         note: note,
                                         profileID: profileID,
                                         time: time)
                        }
                    }
                }
            } else {
                //Handle error
            }
        }
    }
    
    func getNotesForProfile(profileID: String) {
        for n in notes {
            if n.profileID == "/Profiles/\(profileID)" {
                allNotes.append(n)
            }
        }
    }
    
    func addData(title: String, note: String, time: Date, profileID: String) {
        
        db.collection("Notes").addDocument(data: ["title": title,
                                                  "note": note,
                                                  "time": time,
                                                  "profileID": profileID])
    }
    
    func deleteNote(note: Notes) {
        db.collection("Notes").document(note.documentID).delete() { err in
            
            if let err = err {
                print(err)
            } else {
                print("Note removed")
            }
        }
    }
    
    func updateData(title: String, note: String, time: Date, profileID: String, ID: String) {
        db.collection("Notes").document(ID).updateData(["title": title,
                                                        "note": note,
                                                        "time": time])
    }
}
