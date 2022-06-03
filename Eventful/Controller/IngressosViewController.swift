//
//  IngressosViewController.swift
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

class IngressosViewController: UIViewController, UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ingressos = [Ingresso]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tabBarController?.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let user = Auth.auth().currentUser!
        let db = Firestore.firestore()
        
        // Recuperando dados da tabela "ingressos" do banco de dados
        db.collection("ingressos").whereField("uid", isEqualTo: "\(user.uid)").getDocuments() { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let titulo = document["titulo"] as! String
                    let horario = document["horario"] as! String
                    let local = document["local"] as! String
                    let descricao = document["descricao"] as! String
                    let valor = document["valor"] as! Double
                    
                    let ingresso = Ingresso(titulo: titulo, horario: horario, local: local, descricao: descricao, valor: valor)
                    self.ingressos.append(ingresso)
                }
               
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingressos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingressoCell", for: indexPath) as! IngressoTableViewCell
        
        cell.tituloLabel?.text = ingressos[indexPath.row].titulo
        cell.localLabel?.text = ingressos[indexPath.row].local
        cell.horarioLabel?.text = ingressos[indexPath.row].horario
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "IngressoDetailViewController") as? IngressoDetailViewController
        vc?.ingresso = Ingresso(titulo: ingressos[indexPath.row].titulo, horario: ingressos[indexPath.row].horario, local: ingressos[indexPath.row].local, descricao: ingressos[indexPath.row].descricao, valor: ingressos[indexPath.row].valor)
        self.navigationController?.present(vc!, animated: true)
    }
    
    // Setando o tamanho da célula do TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
