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
    
    var ref:DatabaseReference!
    var databaseHandle:DatabaseHandle?
    
    //var eventos = [Evento]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        databaseHandle = ref.child("Eventos").observe(.value) { snapshot in
            for case let child as DataSnapshot in snapshot.children {
                guard let data = child.value as? [String:Any] else {
                    print("error")
                    return
                }
                print(data)
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
