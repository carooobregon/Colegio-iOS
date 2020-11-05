//
//  ViewControllerAddUser.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class ViewControllerAddUser: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var telefono: UITextField!
    @IBOutlet weak var direccion: UITextField!
    @IBOutlet weak var rolSwitcher: UISegmentedControl!
    
    var rol: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // DatabaseManager.shared.createUser(fName: "Adriana", lName: "Corona Garza", direccion: "Avenida Santa maria #116", email: "adriana@colegiobilinguemarktwain.com", telefono: "8182662203", isPadre: true, isAdmin: true, isMaestro: false)
         
        // Do any additional setup after loading the view.
    }

    
    @IBAction func rolChanged(_ sender: Any) {
        switch rolSwitcher.selectedSegmentIndex{
            case 0:
                rol =  0
            case 1:
                rol = 1
            case 2:
                rol = 2
            default:
                break
        }
    }
    
    
    @IBAction func addAlumno(_ sender: Any) {
        if(rol == 0){
            DatabaseManager.shared.createUser(fName: fName.text!, lName: lName.text!, direccion: direccion.text!, email: email.text!, telefono: telefono.text!, isPadre: false, isAdmin: true, isMaestro: false)
        }else if(rol == 1){
            DatabaseManager.shared.createUser(fName: fName.text!, lName: lName.text!, direccion: direccion.text!, email: email.text!, telefono: telefono.text!, isPadre: false, isAdmin: false, isMaestro: true)
        }else if( rol == 2){
            DatabaseManager.shared.createUser(fName: fName.text!, lName: lName.text!, direccion: direccion.text!, email: email.text!, telefono: telefono.text!, isPadre: true, isAdmin: false, isMaestro: false)
        }
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
