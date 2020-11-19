//
//  VCAddAviso.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/18/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class VCAddAviso: UIViewController {

    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var tfTitulo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Aviso"

        // Do any additional setup after loading the view.
    }
    @IBAction func addAviso(_ sender: Any) {
        DatabaseManager.shared.createAviso(titulo: tfTitulo.text!, descripcion: tfDesc.text!)
        
        let alert = UIAlertController(title: "Aviso Agregado", message: "Aviso Agregado Correctamente.", preferredStyle: .alert)
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
