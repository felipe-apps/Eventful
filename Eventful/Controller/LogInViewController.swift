//
//  LogInViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 31/05/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleTextField(emailTextField)
        
        Utilities.styleTextField(senhaTextField)
    }
    
    func validateFields() -> String? {
        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           senhaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Por favor preencha todos os campos!"
        }
        
        return nil
    }

    @IBAction func logInButtonTapped(_ sender: UIButton) {
        let erro = validateFields()
        
        if erro != nil {
            let alert = UIAlertController(title: "Erro", message: erro, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        } else {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let senha = senhaTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: senha) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                    let alert = UIAlertController(title: "Erro", message: "Senha ou e-mail incorretos!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                } else {
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
