//
//  AvisoViewController.swift
//  c-bilingua
//
//  Created by user182115 on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class AvisoViewController: UIViewController {

    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDetalle: UILabel!
    var currAviso : Aviso?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitulo.text = currAviso?.titulo
        lblDetalle.text = currAviso?.detalle
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
