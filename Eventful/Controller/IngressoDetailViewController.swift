//
//  IngressoDetailViewController.swift
//  Eventful
//
//  Created by Felipe Ferreira on 03/06/22.
//

import UIKit
import FirebaseAuth

class IngressoDetailViewController: UIViewController {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var localLabel: UILabel!
    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var valorLabel: UILabel!
    @IBOutlet weak var qrCodeImage: UIImageView!
    
    var filter:CIFilter!
    
    var ingresso: Ingresso?
    let botaoFechar = BotoesFlutuantes.closeButton
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Recebendo dados do objeto evento que foi selecionado na TableView
        tituloLabel.text = ingresso?.titulo
        localLabel.text = ingresso?.local
        horarioLabel.text = ingresso?.horario
        descricaoLabel.text = ingresso?.descricao
        if ingresso?.valor == 0 {
            valorLabel.text = "Gratuito"
            valorLabel.textColor = .green
        } else {
            valorLabel.text = "Valor: R$\(String(format: "%.2f", ingresso!.valor))"
        }
        let user = Auth.auth().currentUser!
        
        let qrCodeData = "\(user.uid)_\(String(describing: ingresso!.titulo))"
        
        generateQRCode(from: qrCodeData)
        
        view.addSubview(botaoFechar)
        botaoFechar.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
    
    func generateQRCode(from string: String) {
//        let data = string.data(using: String.Encoding.ascii)
//
//        if let filter = CIFilter(name: "CIQRCodeGenerator") {
//            filter.setValue(data, forKey: "inputMessage")
//            let transform = CGAffineTransform(scaleX: 3, y: 3)
//
//            if let output = filter.outputImage?.transformed(by: transform) {
//                return UIImage(ciImage: output)
//            }
//        }
//
//        return nil
        let data = string.data(using: .ascii, allowLossyConversion: false)
        
        filter = CIFilter(name: "CIQRCodeGenerator")
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let image = UIImage(ciImage: filter.outputImage!.transformed(by: transform))
        
        qrCodeImage.image = image
    }

}
