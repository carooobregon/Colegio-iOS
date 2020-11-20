//
//  InfoYContactoViewController.swift
//  c-bilingua
//
//  Created by Caro Obregon on 19/11/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class InfoYContactoViewController: UIViewController {

    @IBOutlet weak var llamarBtn: CustomButton!
    @IBOutlet weak var emailBtn: CustomButton!
    
    let styleHelper = StyleHelperLib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        assignButtonColors()
    }
    
    func assignButtonColors(){
        llamarBtn.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "FFB110"))
        emailBtn.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "22215B"))
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
