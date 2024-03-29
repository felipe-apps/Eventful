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
    var descricao: String
    var valor: Double
    var imagem: UIImage
    var eventoId: Int
    
    init(titulo: String, horario: String, local: String, descricao: String, valor: Double, imagem: UIImage, eventoId: Int){
        self.titulo = titulo
        self.horario = horario
        self.local = local
        self.descricao = descricao
        self.valor = valor
        self.imagem = imagem
        self.eventoId = eventoId
    }
}
