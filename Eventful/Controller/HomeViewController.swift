//
//  HomeViewController.swift
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

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var eventos = [Evento]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let db = Firestore.firestore()
        db.collection("eventos").getDocuments() { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in snapshot!.documents {
                    let titulo = document["titulo"] as! String
                    let horario = document["horario"] as! String
                    let local = document["local"] as! String
                    self.eventos = [Evento(titulo: titulo, horario: horario, local: local, imagem: UIImage(imageLiteralResourceName: "IMG_1067"))]
                    
                }
                self.tableView.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventoCell", for: indexPath) as! EventoTableViewCell
        
        cell.tituloLabel?.text = eventos[indexPath.row].titulo
        cell.localLabel?.text = eventos[indexPath.row].local
        cell.horarioLabel?.text = eventos[indexPath.row].horario
        cell.imagemView?.image = eventos[indexPath.row].imagem
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventoViewController") as? EventoViewController
        vc?.titulo = eventos[indexPath.row].titulo
        vc?.local = eventos[indexPath.row].local
        vc?.horario = eventos[indexPath.row].horario
        vc?.imagem = eventos[indexPath.row].imagem!
        self.navigationController?.present(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;
    }
    
}
