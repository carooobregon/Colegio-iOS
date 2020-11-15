//
//  AvisosViewController.swift
//  c-bilingua
//
//  Created by Caro Obregon on 05/11/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class AvisosViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var verMasBtn: UIButton!
    
}
class AvisosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listaAvisos = [
        Aviso(titulo: "Posada", body: "Lorem ipsum dolor sit amet, conse ctet uradi piscing elit, sed do eiusmod tempor incididunt"),
        Aviso(titulo: "Salida de clases", body: "Lorem ipsum dolor sit amet, conse ctet uradi piscing elit, sed do eiusmod tempor incididunt"),
        Aviso(titulo: "Semana de Examenes", body: "Lorem ipsum dolor sit amet, conse ctet uradi piscing elit, sed do eiusmod tempor incididunt"),
        Aviso(titulo: "Modalidad virtual", body: "Lorem ipsum dolor sit amet, conse ctet uradi piscing elit, sed do eiusmod tempor incididunt")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAvisos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda") as! AvisosViewCell
        cell.titulo.text = listaAvisos[indexPath.row].titulo
        cell.body.text = listaAvisos[indexPath.row].body
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaAvisosCompleto = segue.destination as! AvisoCompletoViewController
        let indice = tableView.indexPathForSelectedRow
        
        vistaAvisosCompleto.currAviso = listaAvisos[indice!.row]
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
