//
//  CalificacionesViewController.swift
//  CBMT
//
//  Created by Caro Obregon on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//
import UIKit

class MateriaViewCell: UITableViewCell {
    
    @IBOutlet weak var materia: UILabel!
    @IBOutlet weak var califAgo: UILabel!
    @IBOutlet weak var califSept: UILabel!
    @IBOutlet weak var califOct: UILabel!
    @IBOutlet weak var promedio: UILabel!
    
}

class FakeCalificacion: NSObject {
    let materia : String
    var nota : [Int] = []
    
    init(materia: String, nota: [Int]) {
        self.materia = materia
        self.nota.append(contentsOf: nota)
    }
    
}

class CalificacionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // TODO: agregar back buttons y arreglar promedio general
    @IBOutlet weak var promedioView: UIView!
    var currAlumno : Alumno?
    @IBOutlet weak var promedioAlumno: UILabel!
    @IBOutlet weak var nombreAlumno: UILabel!
    @IBOutlet weak var grado: UILabel!
    @IBOutlet weak var maestra: UILabel!
    let cellColors = ["222B45","AC4040","FFC700", "11A05B", "FFB110"]
    let boleta = [FakeCalificacion(materia: "Matematicas", nota: [100,94,98]),FakeCalificacion(materia: "Matematicas", nota: [100,94,98]), FakeCalificacion(materia: "Matematicas", nota: [100,94,98])]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        nombreAlumno.text = currAlumno?.fName
        grado.text = buildGrade()
        maestra.text = buildMaestra()
        promedioAlumno.text = String(93)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boleta.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! MateriaViewCell
        let currBoleta = boleta

        celda.materia.text = currBoleta[indexPath.row].materia
        celda.califAgo.text = String(currBoleta[indexPath.row].nota[0])
        celda.califSept.text = String(currBoleta[indexPath.row].nota[1])
        celda.califOct.text = String(currBoleta[indexPath.row].nota[2])
        celda.promedio.text = calculateAverage(agosto: currBoleta[indexPath.row].nota[0], sept: currBoleta[indexPath.row].nota[1], oct: currBoleta[indexPath.row].nota[2])
        celda.contentView.backgroundColor = hexStringToUIColor(hex: cellColors[indexPath.row % cellColors.count])

        return celda
    }

    func calculateAverage(agosto: Int, sept: Int, oct: Int ) -> String{
        return String((agosto + sept + oct)/3)
    }
    
    func buildGrade() -> String{
        return String(currAlumno!.grado) + " de " + currAlumno!.nivel
    }
    
    func buildMaestra() -> String{
        return "Maestra: " + "Alicia Martinez"
    }
    
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

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
