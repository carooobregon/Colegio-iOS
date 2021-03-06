//
//  TVCSelectAlumnotoAdd.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/19/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class TVCSelectAlumnotoAdd: UITableViewController {

    var idUser : String = ""
    var nombreUser : String = ""
    var alumnosActuales : [String] = []
    var alumnosDB = [Alumno]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfo()
        self.title = "Agregar Alumnos a " + nombreUser
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func getInfo(){
        DatabaseManager.shared.getAlumnos{ (alumnos) in
            self.alumnosDB = alumnos
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
        return alumnosDB.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        celda.textLabel?.text = alumnosDB[indexPath.row].fName + " " + alumnosDB[indexPath.row].lName
        celda.detailTextLabel?.text = alumnosDB[indexPath.row].email
        
        return celda
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        alumnosActuales.append(alumnosDB[indexPath.row].id)
        
        DatabaseManager.shared.editUser(id: idUser, alumnos: alumnosActuales)
        
        let alert = UIAlertController(title: "Alumno Agregado", message: "Alumno Agregado a Usuario Correctamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
