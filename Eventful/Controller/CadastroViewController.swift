//
//  CadastroViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 31/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class CadastroViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBOutlet weak var registroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleTextField(nomeTextField)
        
        Utilities.styleTextField(sobrenomeTextField)
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(senhaTextField)
        
    }
    
    func validateFields() -> String? {
        if nomeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           sobrenomeTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           senhaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Por favor preencha todos os campos!"
        }
        
        let senhaValida = senhaTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(senhaValida) == false {
            return "A senha precisa ter no mínimo 8 caracteres, conter pelo menos 1 digito e um caractere especial!"
        }
        
        return nil
    }

    @IBAction func registroButtonTapped(_ sender: UIButton) {
        let erro = validateFields()
        
        if erro != nil {
            let alert = UIAlertController(title: "Erro", message: erro, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            
            let nome = nomeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let sobrenome = sobrenomeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let senha = senhaTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: senha) { result, err in
                if err != nil {
                    print("Erro ao criar usuário")
                } else {
                    
                    let db = Firestore.firestore()
                    db.collection("usuarios").addDocument(data: ["nome":nome, "sobrenome":sobrenome, "uid":result!.user.uid]) { error in
                        
                        if error != nil {
                            print("Não foi possível recuperar dados do usuário")
                        }
                    }
                    
                    
                    self.transitionToView()
                }
                
            }
        }
    }
    
    func transitionToView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        view.window?.rootViewController = tabBarVC
        view.window?.makeKeyAndVisible()
        
    }
    
}
