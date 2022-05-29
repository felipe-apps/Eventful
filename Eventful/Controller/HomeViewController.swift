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
    @IBOutlet var tituloLabel: UILabel!
    @IBOutlet var localLabel: UILabel!
    @IBOutlet var horarioLabel: UILabel!
    @IBOutlet var imagemView: UIImageView!

    //var eventos = ["Festa universitária", "Confraternização da empresa", "Happy hour"]
    var eventos = [Evento(titulo: "Festa universitaria", horario: "HOJE 14:00", local: "São Paulo, SP", imagem: UIImage(imageLiteralResourceName: "IMG_1065")),
                   Evento(titulo: "Confraternização da empresa blahblahblahblahblahblahblahblah", horario: "03/06 16:00", local: "Belo Horizonte, MG", imagem: UIImage(imageLiteralResourceName: "IMG_1066")),
                   Evento(titulo: "Happy hour", horario: "05/06 19:00", local: "Curitiba, PR", imagem: UIImage(imageLiteralResourceName: "IMG_1067"))
    
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "EventoTableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: "EventoTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0;//Choose your custom row height
    }
    
}
