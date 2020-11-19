//
//  IntroCalificacionesViewController.swift
//  CBMT
//
//  Created by Caro Obregon on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class AlCalificacionesViewCell: UITableViewCell {
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var alNombre: UILabel!
    @IBOutlet weak var alGrado: UILabel!
    @IBOutlet weak var alMaestra: UILabel!
    
}

class IntroCalificacionesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //DatabaseManager.shared.getAlumnos("dDG9eowRcs7KSNP3GaRh")
    @IBOutlet weak var tableView: UITableView!
    
   
    
    var listaAlumnos = [Alumno]()
//        Alumno(fName: "Gaby Corona"),
//        Alumno(nombre: "Caro Obregon"),
//        Alumno(nombre: "Lucia Cantu")
    //]
//    @IBOutlet weak var tableView: UITableView!
    
    let cellColors = ["222B45","AC4040","FFC700", "11A05B", "FFB110"];
    var selectedIndexPath: NSIndexPath = NSIndexPath()
    let styleHelper = StyleHelperLib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        tableView.delegate = self
        tableView.dataSource = self
       getInfo()
        // Do any additional setup after loading the view.
    }
//    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController!.isNavigationBarHidden = false;
//    }
    func getInfo(){
        DatabaseManager.shared.getAlumnos{ (alumnos) in
            self.listaAlumnos = alumnos
            self.tableView.reloadData()
        }
        for i in listaAlumnos{
            print(i.fName)
            print("hola")
        }
    }

//    MARK: - Metodos de protocolo Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAlumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! AlCalificacionesViewCell
        if(listaAlumnos[indexPath.row].genero){
            celda.imagen.image = UIImage(named: "girlpng")
        }
        celda.alNombre.text = listaAlumnos[indexPath.row].fName
        celda.alGrado.text = String(listaAlumnos[indexPath.row].grado) + "° de " + listaAlumnos[indexPath.row].nivel
//        celda.alMaestra.text = listaAlumnos[indexPath.row].maestra
        celda.contentView.backgroundColor = styleHelper.hexStringToUIColor(hex: cellColors[indexPath.row % cellColors.count])

        return celda
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showCalif", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ("showCalif" == segue.identifier){
            let indexPath = tableView.indexPathForSelectedRow
            let vistaDetalle  = segue.destination as! CalificacionesViewController
            vistaDetalle.currAlumno = listaAlumnos[indexPath!.row]
        }
    }
    
//    func performSegue(withIdentifier identifier: String, sender: IndexPath) {
//        let vistaDetalle  = segue.destination as! CalificacionesViewController
//        vistaDetalle.currAlumno = listaAlumnos[sender.row]
//    }


}
