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
                    let descricao = document["descricao"] as! String
                    let valor = document["valor"] as! Double
                    let imagemNome = document["imagem"] as! String
                    let eventoId = document["eventoId"] as! Int
                    
                    let evento = Evento(titulo: titulo, horario: horario, local: local, descricao: descricao, valor: valor, imagem: UIImage(imageLiteralResourceName: imagemNome), eventoId: eventoId)
                    self.eventos.append(evento)
                    
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
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "EventoDetailViewController") as? EventoDetailViewController
        vc?.evento = Evento(titulo: eventos[indexPath.row].titulo, horario: eventos[indexPath.row].horario, local: eventos[indexPath.row].local, descricao: eventos[indexPath.row].descricao, valor: eventos[indexPath.row].valor, imagem: eventos[indexPath.row].imagem, eventoId: eventos[indexPath.row].eventoId)
        self.navigationController?.present(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
