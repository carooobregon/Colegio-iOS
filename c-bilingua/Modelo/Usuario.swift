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
    var isAdmin : Bool = false
    var isMaestro : Bool = false
    var isPadre : Bool = false
    
    var telefono : String = ""
    var direccion : String  = ""
    //var alumno : Alumno
    
}
