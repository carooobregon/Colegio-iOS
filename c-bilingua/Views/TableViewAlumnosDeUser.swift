//
//  TableViewAlumnosDeUser.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/14/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class GetAlumnosCell : UITableViewCell {
    @IBOutlet weak var lblFname: UILabel!
    @IBOutlet weak var lblLname: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblGrado: UILabel!
    @IBOutlet weak var lblNivel: UILabel!
    
}


class TableViewAlumnosDeUser: UITableViewController {
    var listaAlumnos = [String]()
    var alumnosDeUser = [Alumno]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        title = "Alumnos"
        getInfo()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getInfo(){
        DatabaseManager.shared.getAlumnos{ (alumnos) in
            for l in self.listaAlumnos{
                self.alumnosDeUser =
                    alumnos.filter({$0.id == l})
                //print(self.alumnosDeUser)
            }
            
            self.tableView.reloadData()
        }
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnosDeUser.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! GetAlumnosCell
        
        var genero = ""
        switch alumnosDeUser[indexPath.row].genero {
        case true:
            genero = "Masculino"
        case false:
            genero = "Femenino"
        }
        let grado = alumnosDeUser[indexPath.row].grado
        
        
        celda.lblFname.text = alumnosDeUser[indexPath.row].fName
        celda.lblLname.text = alumnosDeUser[indexPath.row].lName
        celda.lblEmail.text = alumnosDeUser[indexPath.row].email
        celda.lblGenero.text = genero
        celda.lblGrado.text = String(grado)
        celda.lblNivel.text = alumnosDeUser[indexPath.row].nivel

        return celda
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indice = tableView.indexPathForSelectedRow!
        let vistaMaterias = segue.destination as! TableViewMaterias
        vistaMaterias.listaMaterias = alumnosDeUser[indice.row].materias
      
        vistaMaterias.listaCalifs = alumnosDeUser[indice.row].calificaciones
    }
    

}
