//
//  Calificacion.swift
//  CBMT
//
//  Created by Caro Obregon on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Aviso: NSObject {
    let titulo : String
    var body : String
    
    init(titulo: String, body: String) {
        self.titulo = titulo
        self.body = body
    }
}
