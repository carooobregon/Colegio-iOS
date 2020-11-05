//
//  Calificacion.swift
//  CBMT
//
//  Created by Caro Obregon on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class Calificacion: NSObject {
    let materia : String
    var nota : [Int] = []
    
    init(materia: String, nota: [Int]) {
        self.materia = materia
        self.nota.append(contentsOf: nota)
    }
}
