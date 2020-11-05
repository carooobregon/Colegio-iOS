//
//  CuotaPendiente.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class CuotaPendiente: NSObject {
    var id : Int
    var informacion: String
    var cantidad : Double
    var cantidadAdeudo : Double
    var fechaLimite : NSDate

      
    override init() {
        self.id = 1
        self.informacion = "pago colegiatura concha"
        self.cantidad = 800.5
        self.cantidadAdeudo = 90.4
        self.fechaLimite = NSDate.init()
    }

}
