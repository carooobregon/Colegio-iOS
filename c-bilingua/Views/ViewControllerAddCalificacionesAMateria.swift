//
//  ViewControllerAddCalificacionesAMateria.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class ViewControllerAddCalificacionesAMateria: UIViewController {

    @IBOutlet weak var calificacion: UITextField!
    @IBOutlet weak var faltas: UITextField!
    @IBOutlet weak var retardos: UITextField!
    @IBOutlet weak var fechaCaptura: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func guardarRegistro(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
