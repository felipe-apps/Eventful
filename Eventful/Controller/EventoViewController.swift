//
//  EventoViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 30/05/22.
//

import UIKit

class EventoViewController: UIViewController {

    @IBOutlet weak var imagemEvento: UIImageView!
    @IBOutlet weak var tituloEvento: UILabel!
    @IBOutlet weak var localEvento: UILabel!
    @IBOutlet weak var horarioEvento: UILabel!
    
    var imagem = UIImage()
    var titulo = ""
    var local = ""
    var horario = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagemEvento.image = imagem
        tituloEvento.text = titulo
        localEvento.text = local
        horarioEvento.text = horario
    }
    
    @IBAction func quitTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
