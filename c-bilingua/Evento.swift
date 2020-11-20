//
//  Evento.swift
//  c-bilingua
//
//  Created by user182115 on 11/19/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class Evento: NSObject {
    let evento : String
    var dia : String
    
    init(evento: String, dia: String) {
        self.evento = evento
        self.dia = dia
    }
}
