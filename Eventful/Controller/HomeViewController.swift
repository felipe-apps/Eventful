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

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!

    var eventos = [Evento(titulo: "Festa universitaria", horario: "HOJE 14:00", local: "São Paulo, SP", imagem: UIImage(imageLiteralResourceName: "IMG_1065")),
                   Evento(titulo: "Confraternização da empresa", horario: "03/06 16:00", local: "Belo Horizonte, MG", imagem: UIImage(imageLiteralResourceName: "IMG_1066")),
                   Evento(titulo: "Happy hour", horario: "05/06 19:00", local: "Curitiba, PR", imagem: UIImage(imageLiteralResourceName: "IMG_1067"))
                   
    ]
    
    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    //var eventos = [Evento]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        let ref = Database.database().reference(withPath: "Eventos")
//
//        ref.observe(.value, with: { snapshot in
//            // This is the snapshot of the data at the moment in the Firebase database
//            print(snapshot.value as Any)
//        })

        // Retrieve the events and listen for changes
//        ref.child("Eventos").observe(.value, with: { (snapshot) in
//
//            // Code to execute when a child is added under "Eventos"
//            // Take the value from the snapshot and added it to the eventos array
//
//                // Append the data to the eventos array
//            self.eventos.append(evento)
//
//            self.tableView.reloadData()
//
//        })
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
