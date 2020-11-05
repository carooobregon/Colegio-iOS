//
//  AvisosViewController.swift
//  c-bilingua
//
//  Created by user182115 on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class AvisosViewCell : UITableViewCell {
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDetalle: UILabel!
}

class AvisosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var listaAvisos = [
        Aviso(titulo: "Fecha Limite de Pago", detalle: "La fecha del limite de pago es el siguiente viernes 6 de Noviembre."),
        Aviso(titulo: "Entrega de calificaciones", detalle: "Las calificaciones seran entregadas el 18 de Noviembre.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAvisos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! AvisosViewCell
        
        celda.lblTitulo.text = listaAvisos[indexPath.row].titulo
        celda.lblDetalle.text = listaAvisos[indexPath.row].detalle
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAP")
        self.performSegue(withIdentifier: "showAviso", sender: indexPath)
    }

    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: IndexPath) {
        if (segue.identifier == "showAviso"){
            let vistaDetalle  = segue.destination as! AvisoViewController
            vistaDetalle.currAviso = listaAvisos[sender.row]
        }
    }
    

}
