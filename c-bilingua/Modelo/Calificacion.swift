//
//  Calificacion.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Calificacion: Codable {
    var id : String = ""
    var mes : String = ""
    var calificacion : Double = 0.0
    var faltas : Int = 0
    var retardos : Int = 0
    var idMateria : String = ""
}
