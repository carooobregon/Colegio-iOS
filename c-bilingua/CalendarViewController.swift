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
    
    var listaEventos = [Eventos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        getInfo()
        // Do any additional setup after loading the view.
    }
    
    func getInfo(){
        DatabaseManager.shared.getEventos{(eventos) in
            self.listaEventos = eventos
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaEventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda") as! EventoViewCell
        print(listaEventos.count)
        cell.lbDia.text = String(listaEventos[indexPath.row].dia)
        cell.lbEvento.text = listaEventos[indexPath.row].titulo
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }


}
