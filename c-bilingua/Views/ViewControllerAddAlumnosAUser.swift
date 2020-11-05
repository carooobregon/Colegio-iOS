//
//  ViewControllerAddAlumnosAUser.swift
//  c-bilingua
//
//  Created by Gaby Corona on 11/4/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class ViewControllerAddAlumnosAUser: UIViewController {

    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var gradoEscolar: UITextField!
    @IBOutlet weak var generoSwitcher: UISegmentedControl!
    @IBOutlet weak var fechaNacimiento: UIDatePicker!
    
    var genero : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func generoAction(_ sender: Any) {
        switch generoSwitcher.selectedSegmentIndex{
            case 0:
                genero = false
            case 1:
                genero = true
        default:
            break;
                
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
