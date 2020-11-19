//
//  VCAddEvento.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/18/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class VCAddEvento: UIViewController {

    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var tfTitulo: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Evento"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addEvento(_ sender: Any) {
        DatabaseManager.shared.createEvento(titulo: tfTitulo.text!, descripcion: tfDesc.text!)
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
