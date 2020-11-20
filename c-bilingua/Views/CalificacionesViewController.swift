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
    @IBOutlet weak var lblnombreMaestra: UILabel!
    
}



class CalificacionesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // TODO: agregar back buttons y arreglar promedio general
    @IBOutlet weak var promedioView: UIView!
    @IBOutlet weak var promedioAlumno: UILabel!
    @IBOutlet weak var nombreAlumno: UILabel!
    @IBOutlet weak var gradoAlumno: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var listaCalifs = [String]()
    var listaMaterias : [String] = []
    var materiasDeAlumno = [Materias]()
    var calificacionesBD = [Calificacion]()
    
    var fnAlumno : String = ""
    var lnAlumno : String = ""
    var gradoA : String = ""
    var nivelA : String = ""
    
    var promedio : Double = 0.0
    
    let styleHelper = StyleHelperLib()
    
    let cellColors = ["222B45","AC4040","FFC700", "11A05B", "FFB110"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = false;
        getInfo()
        
        getPromedio()
        nombreAlumno.text = fnAlumno + lnAlumno
        gradoAlumno.text = buildGrade()
        
        promedioAlumno.text = String(93)
    }
    // MARK: - Table view data source

    func getPromedio(){
        DatabaseManager.shared.getCalificaciones{ (calificaciones) in
           
            for c in calificaciones{
                if(self.listaCalifs.contains(c.id)){
                    self.calificacionesBD.append(c)
                }
            }
            
            self.tableView.reloadData()
        }

    }
    
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
        celda.lblnombreMaestra.text = buildProf(prof: materiasDeAlumno[indexPath.row].nombreMaestra)
        celda.contentView.backgroundColor = styleHelper.hexStringToUIColor(hex: cellColors[indexPath.row % cellColors.count])

        return celda
    }

    func calculateAverage(agosto: Int, sept: Int, oct: Int ) -> String{
        return String((agosto + sept + oct)/3)
    }
    
    func buildGrade() -> String{
        return String(gradoA) + " de " + nivelA
    }
    
    func buildProf(prof: String) -> String{
        return "Profesor " + prof
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indice = tableView.indexPathForSelectedRow!
        let vistaCalifs = segue.destination as! TVCCalificacionesUser
        
        vistaCalifs.idMateria = materiasDeAlumno[indice.row].id
        vistaCalifs.nombreMateria = materiasDeAlumno[indice.row].nombreMateria
        vistaCalifs.califsAlumno = listaCalifs
    }
    

}
