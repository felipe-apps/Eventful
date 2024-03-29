//
//  EventoViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 30/05/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseCore

class EventoDetailViewController: UIViewController {

    @IBOutlet weak var imagemEvento: UIImageView!
    @IBOutlet weak var tituloEvento: UILabel!
    @IBOutlet weak var localEvento: UILabel!
    @IBOutlet weak var horarioEvento: UILabel!
    @IBOutlet weak var descricaoEvento: UILabel!
    @IBOutlet weak var valorEvento: UILabel!
    
    let botaoFechar = BotoesFlutuantes.closeButton
    let botaoCompartilhar = BotoesFlutuantes.shareButton
    let botaoComprar = BotoesFlutuantes.buyButton
    
    var evento: Evento?
    var eventoId: Int = 0
    var imagemNome: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Recebendo dados do objeto evento que foi selecionado na TableView
        imagemEvento.image = evento?.imagem
        tituloEvento.text = evento?.titulo
        localEvento.text = evento?.local
        horarioEvento.text = evento?.horario
        descricaoEvento.text = evento?.descricao
        if evento?.valor == 0 {
            valorEvento.text = "Gratuito"
            valorEvento.textColor = .green
        } else {
            valorEvento.text = "Valor: R$\(String(format: "%.2f", evento!.valor))"
        }
        
        eventoId = evento!.eventoId
        
        // Adicionando botões flutuantes na View
        view.addSubview(botaoComprar)
        view.addSubview(botaoFechar)
        view.addSubview(botaoCompartilhar)
        botaoFechar.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        botaoCompartilhar.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        botaoComprar.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    // Usa-se esse método para configurar a posição e o tamanho dos botões adicionados
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        botaoCompartilhar.frame = CGRect(x: view.frame.size.width - 50, y: 10, width: 40, height: 40)
        botaoComprar.frame = CGRect(x: view.frame.size.width - 210, y: view.frame.size.height - 100 , width: 200, height: 60)
    }
    
    // Ao clicar no botão comprar, adiciona-se um novo registro á tabela "ingressos" no banco de dados Firebase
    // Esse registro contém dados que foram puxados do evento selecionado
    
    @objc private func buyButtonTapped() {
        let alert = UIAlertController(title: "Compra", message: "Ingresso comprado!", preferredStyle: .alert)
        
        
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            let user = Auth.auth().currentUser!
            let db = Firestore.firestore()
            db.collection("ingressos").document("\(String(describing: self.eventoId))_\(user.uid)").setData([
            
                "titulo" : self.evento?.titulo as Any,
                "local" : self.evento?.local as Any,
                "horario" : self.evento?.horario as Any,
                "descricao" : self.evento?.descricao as Any,
                "valor" : self.evento?.valor as Any,
                "uid" : user.uid as Any
                //"imagem" : self.evento?.imagem as Any
                
            ]) { err in
                if let err = err {
                    print("Error writing doument \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancelar", style: .destructive, handler: nil))
        present(alert, animated: true)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc private func shareButtonTapped() {
        let alert = UIAlertController(title: "Compartilhar", message: "Ingresso compartilhado!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}
