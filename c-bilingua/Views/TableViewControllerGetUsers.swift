//
//  TableViewControllerGetUsers.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/5/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell{
    @IBOutlet weak var lblRol: UILabel!
    @IBOutlet weak var lblFName: UILabel!
    @IBOutlet weak var lblLName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblTelefono: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    
    
}

class TableViewControllerGetUsers: UITableViewController {

    var listaUsers = [Usuario]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        self.navigationController!.isNavigationBarHidden = false;

        self.title = "Get Usuarios"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func getInfo(){
        DatabaseManager.shared.getUsuarios{ (usuarios) in
            self.listaUsers = usuarios
            self.tableView.reloadData()
        }
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return listaUsers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! customTableViewCell
        var rol = ""
        switch listaUsers[indexPath.row].role {
            case 0:
                rol = "Admin"
            case 1:
                rol = "Maestro"
            case 2:
                rol = "Padre"
            default:
            break
        }
        
        celda.lblFName.text = listaUsers[indexPath.row].fName
        celda.lblLName.text = listaUsers[indexPath.row].lName
        celda.lblEmail.text = listaUsers[indexPath.row].email
        celda.lblTelefono.text = listaUsers[indexPath.row].telefono
        celda.lblDireccion.text = listaUsers[indexPath.row].direccion
        celda.lblRol.text = rol
        
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
        let vistaAlumnos = segue.destination as! TableViewAlumnosDeUser
        
        vistaAlumnos.listaAlumnos = listaUsers[indice.row].alumnos
     
    }
    

}
