//
//  CalendarViewController.swift
//  c-bilingua
//
//  Created by user182115 on 11/19/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit
class EventoViewCell : UITableViewCell{
    @IBOutlet weak var lbDia: UILabel!
    @IBOutlet weak var lbEvento: UILabel!
}

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var listaEventos = [
        Evento(evento: "No hay clase", dia: "16 -"),
        Evento(evento: "Posada navidad", dia: "28 -"),
        Evento(evento: "Entrega de calificaciones", dia: "30 -")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda") as! EventoViewCell
        cell.lbDia.text = listaEventos[indexPath.row].dia
        cell.lbEvento.text = listaEventos[indexPath.row].evento
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }


}
