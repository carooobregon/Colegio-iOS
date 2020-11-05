//
//  Avisos.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Avisos: NSObject {
    var id : Int
    var titulo: String
    var descripcion: String
    //var fecha : NSDate
    
    override init() {
        self.id = 1
        self.titulo = "titulo nuevo"
        self.descripcion = "descripción"
    }
    
    func crearAviso(titulo: String, descripcion: String){
        print("Creando Aviso")
    }
    
}
