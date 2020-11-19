//
//  VCAddMateria.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/18/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class VCAddMateria: UIViewController {

    @IBOutlet weak var tfNombreMaestra: UITextField!
    @IBOutlet weak var tfNombreMateria: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Materia"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddMateria(_ sender: Any) {
        DatabaseManager.shared.createMateria(nombreMaestra: tfNombreMaestra.text!, nombreMateria: tfNombreMateria.text!)
        
        let alert = UIAlertController(title: "Materia Agregada", message: "Materia Agregada Correctamente.", preferredStyle: .alert)
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
