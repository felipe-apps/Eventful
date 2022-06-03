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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.delegate = self
        
        editarPerfilButton.backgroundColor = .systemBlue
        
        logOutButton.backgroundColor = .systemPink
        
        let db = Firestore.firestore()
        let user = Auth.auth().currentUser!
        
        // Recuperando dados do usuário e passando para a view
        db.collection("usuarios").getDocuments() { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let currentUserDoc = snapshot?.documents.first(where: { ($0["uid"] as? String) == user.uid}) {
                    let nome = currentUserDoc["nome"] as! String
                    let sobrenome = currentUserDoc["sobrenome"] as! String
                    self.nomeSobrenomeLabel.text = ("\(nome) \(sobrenome)")
                    self.emailLabel.text = user.email
                }
            }
        }
    }
    
    // TODO: Botão para editar o perfil do usuário
    @IBAction func editarPerfilTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Editando", message: "Editando usuário", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    // TODO: Botão para sair da conta logada
    @IBAction func logOutTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Saindo", message: "Deseja mesmo sair?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
