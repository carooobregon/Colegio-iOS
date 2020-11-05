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
    
   
    
    var listaAlumnos = [Alumno]()
//        Alumno(fName: "Gaby Corona"),
//        Alumno(nombre: "Caro Obregon"),
//        Alumno(nombre: "Lucia Cantu")
    //]
    
    let cellColors = ["222B45","AC4040","FFC700", "11A05B", "FFB110"];
    let colors = UIColor.systemRed
    override func viewDidLoad() {
        super.viewDidLoad()
       getInfo()
        // Do any additional setup after loading the view.
    }
    func getInfo(){
        DatabaseManager.shared.getAlumnos{ (alumnos) in
            for i in alumnos{
                self.listaAlumnos.append(i)
                
            }
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
        //celda.alMaestra.text = listaAlumnos[indexPath.row].maestra
        celda.contentView.backgroundColor = hexStringToUIColor(hex: cellColors[indexPath.row % cellColors.count])

        return celda
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    // MARK: Helper methods
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TAP")
        self.performSegue(withIdentifier: "showCalif", sender: indexPath)
    }
    
    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: IndexPath) {
        if (segue.identifier == "showCalif"){
            let vistaDetalle  = segue.destination as! CalificacionesViewController
            vistaDetalle.currAlumno = listaAlumnos[sender.row]
        }
    }


}
