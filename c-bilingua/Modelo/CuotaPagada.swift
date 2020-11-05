//
//  CuotaPagada.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class CuotaPagada: NSObject {
    var id : Int
    var informacion: String
    var cantidad : Double
    var cantidadAdeudo : Double
    var fechaPagada : NSDate

    
    override init() {
        self.id = 1
        self.informacion = "pago colegiatura concha"
        self.cantidad = 800.5
        self.cantidadAdeudo = 90.4
        self.fechaPagada = NSDate.init()
    }
}
