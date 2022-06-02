//
//  PerfilViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 29/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore

class PerfilViewController: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var nomeSobrenomeLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editarPerfilButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    var teste: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.delegate = self
        
        editarPerfilButton.backgroundColor = .systemBlue
        
        logOutButton.backgroundColor = .systemPink
        
        let db = Firestore.firestore()
        let userId = Auth.auth().currentUser!.uid
        db.collection("usuarios").getDocuments() { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let currentUserDoc = snapshot?.documents.first(where: { ($0["uid"] as? String) == userId}) {
                    let nome = currentUserDoc["nome"] as! String
                    let sobrenome = currentUserDoc["sobrenome"] as! String
                    self.nomeSobrenomeLabel.text = ("\(nome) \(sobrenome)")
                    self.teste.append(nome)
                }
            }
        }
    }
    
    @IBAction func editarPerfilTapped(_ sender: UIButton) {
    }
    
    @IBAction func logOutTapped(_ sender: UIButton) {
    }
}
