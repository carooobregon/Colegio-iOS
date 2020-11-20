//
//  VCAddAlumno.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/18/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class VCAddAlumno: UIViewController {

    
    @IBOutlet weak var pickerNivel: UISegmentedControl!
    @IBOutlet weak var pickerGenero: UISegmentedControl!
    @IBOutlet weak var tfGrado: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfLName: UITextField!
    @IBOutlet weak var tfFName: UITextField!
    
    var genero : Bool = false
    var nivel : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Agregar Alumno"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func nivelChanged(_ sender: UISegmentedControl) {
        switch pickerNivel.selectedSegmentIndex {
        case 0:
            nivel = "Kinder"
        case 1:
            nivel = "Primaria"
        case 2:
            nivel = "Secundaria"
        default:
            break
        }
    }
    
    @IBAction func generoChanged(_ sender: UISegmentedControl) {
        switch pickerGenero.selectedSegmentIndex {
        case 0:
            genero = false
        case 1:
            genero = true
        default:
           break
        }
    }
    
    @IBAction func btnAgregarAlumno(_ sender: Any) {
        let grado = Int(tfGrado.text!) ?? -1
        
        DatabaseManager.shared.createAlumno(fName: tfFName.text!, lName: tfLName.text!, email: tfEmail.text!, genero: genero, grado: grado, nivel: nivel, materias: [],calificaciones: [])
        
        let alert = UIAlertController(title: "Alumno Agregado", message: "Alumno Agregado Correctamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
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
