//
//  Evento.swift
//  Eventful
//
//  Created by Felipe Ferreira on 29/05/22.
//

import Foundation
import UIKit

struct Evento {
    var titulo: String
    var horario: String
    var local: String
    var descricao: String?
    var valor: Double?
    var imagem: UIImage?
    
    init(titulo: String, horario: String, local: String, imagem: UIImage){
        self.titulo = titulo
        self.horario = horario
        self.local = local
        self.imagem = imagem
    }
}
