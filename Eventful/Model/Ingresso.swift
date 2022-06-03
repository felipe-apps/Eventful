//
//  Ingresso.swift
//  Eventful
//
//  Created by Felipe Ferreira on 03/06/22.
//

import Foundation
import UIKit

struct Ingresso {
    var titulo: String
    var horario: String
    var local: String
    var descricao: String
    var valor: Double
    
    init(titulo: String, horario: String, local: String, descricao: String, valor: Double){
        self.titulo = titulo
        self.horario = horario
        self.local = local
        self.descricao = descricao
        self.valor = valor
    }
}
