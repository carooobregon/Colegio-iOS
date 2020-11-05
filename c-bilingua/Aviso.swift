//
//  Aviso.swift
//  c-bilingua
//
//  Created by user182115 on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class Aviso: NSObject {
    var titulo : String
    var detalle : String
    
    init(titulo: String, detalle: String){
        self.titulo = titulo
        self.detalle = detalle
    }
}
