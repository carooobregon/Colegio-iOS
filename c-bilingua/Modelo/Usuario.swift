//
//  Usuario.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit


class Usuario: Codable {
    var id: String = ""
    var fName : String = ""
    var lName : String  = ""
    var email : String = ""
    var role : Int = 0

    var telefono : String = ""
    var direccion : String  = ""
    var alumnos : [String] = []
    
}
