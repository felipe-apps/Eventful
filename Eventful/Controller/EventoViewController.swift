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
    
    private let comprarButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemRed
        button.setTitle("Comprar ingresso", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        
        return button
    }()
    
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
        
        view.addSubview(comprarButton)
        comprarButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        comprarButton.frame = CGRect(x: view.frame.size.width - 210, y: view.frame.size.height - 100 , width: 200, height: 60)
    }
    
    @IBAction func quitTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc private func didTapButton() {
        let alert = UIAlertController(title: "Add Something", message: "Floating button tapped", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}
