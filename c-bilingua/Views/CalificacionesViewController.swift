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
    @IBOutlet weak var califSep: UILabel!
    @IBOutlet weak var califOct: UILabel!
    @IBOutlet weak var lblnombreMaestra: UILabel!
    
}



class CalificacionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // TODO: agregar back buttons y arreglar promedio general
    @IBOutlet weak var promedioView: UIView!
    @IBOutlet weak var promedioAlumno: UILabel!
    @IBOutlet weak var nombreAlumno: UILabel!
    @IBOutlet weak var gradoAlumno: UILabel!
    @IBOutlet weak var maestra: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var listaMaterias : [String] = []
    var materiasDeAlumno = [Materias]()
    var fnAlumno : String = ""
    var lnAlumno : String = ""
    var gradoA : String = ""
    var nivelA : String = ""
    
    let styleHelper = StyleHelperLib()
    
    let cellColors = ["222B45","AC4040","FFC700", "11A05B", "FFB110"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        getInfo()
        nombreAlumno.text = fnAlumno + lnAlumno
        gradoAlumno.text = buildGrade()
        maestra.text = buildMaestra()
        promedioAlumno.text = String(93)
    }
    // MARK: - Table view data source

    func getInfo(){
        DatabaseManager.shared.getMaterias{(materias) in
            for m in materias{
                if(self.listaMaterias.contains(m.id)){
                    self.materiasDeAlumno.append(m)
                }
            }
            self.tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiasDeAlumno.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! MateriaViewCell
        
        celda.materia.text = materiasDeAlumno[indexPath.row].nombreMateria
        celda.lblnombreMaestra.text = materiasDeAlumno[indexPath.row].nombreMaestra
//        celda.califAgo.text = String(currBoleta[indexPath.row].nota[0])
//        celda.califSep.text = String(currBoleta[indexPath.row].nota[1])
//        celda.califOct.text = String(currBoleta[indexPath.row].nota[2])
//        celda.promedio.text = calculateAverage(agosto: currBoleta[indexPath.row].nota[0], sept: currBoleta[indexPath.row].nota[1], oct: currBoleta[indexPath.row].nota[2])
        celda.contentView.backgroundColor = styleHelper.hexStringToUIColor(hex: cellColors[indexPath.row % cellColors.count])

        return celda
    }

    func calculateAverage(agosto: Int, sept: Int, oct: Int ) -> String{
        return String((agosto + sept + oct)/3)
    }
    
    func buildGrade() -> String{
        return String(gradoA) + " de " + nivelA
    }
    
    func buildMaestra() -> String{
        return "Maestra: " + "Alicia Martinez"
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
