//
//  Alumno.swift
//  CBMT
//
//  Created by Caro Obregon on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Alumno: NSObject {

    var nombre : String
    var grado : Int
    var nivel : String
    var maestra : String
    var genero : Bool
    
    init(nombre: String){
        self.nombre = nombre
        self.grado = 3
        self.nivel = "Primaria"
        self.maestra = "Yolanda Martinez"
        self.genero = true
    }
    
}
