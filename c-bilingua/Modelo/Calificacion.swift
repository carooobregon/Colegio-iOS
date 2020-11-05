//
//  Calificacion.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Calificacion: NSObject {
    var id : Int
    var fecha : NSDate
    var calificacion : Double
    var faltas : Int
    var retardos : Int
    
    override init() {
        self.id = 1
        self.fecha = NSDate.init()
        self.calificacion = 92.3
        self.faltas = 0
        self.retardos = 4
    }

}
