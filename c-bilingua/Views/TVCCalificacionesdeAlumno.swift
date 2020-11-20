//
//  TVCCalificacionesdeAlumno.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/19/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class TVCCalificacionesdeAlumno: UITableViewController {

    var idMateria : String = ""
    var nombreMateria : String = ""
    var califsAlumno : [String] = []
    
    var califsdeAlumno = [Calificacion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;

        self.title = "Calificaciones de " + nombreMateria
        for c in califsAlumno{
            print(c)
        }
        getInfo()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    func getInfo(){
        DatabaseManager.shared.getCalificaciones{ (calificaciones) in
//            for l in self.califsAlumno{
//                self.califsdeAlumno =
//                    calificaciones.filter({$0.id == l})
//                //print(self.alumnosDeUser)
//            }
            self.califsdeAlumno = calificaciones
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
        return califsdeAlumno.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        print( califsdeAlumno.count)
        celda.textLabel?.text = String(califsdeAlumno[indexPath.row].calificacion)
        celda.detailTextLabel?.text = califsdeAlumno[indexPath.row].mes
        


        // Configure the cell...

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
