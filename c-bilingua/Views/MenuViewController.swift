//
//  MenuViewController.swift
//  CBMT
//
//  Created by martha.salinas on 18/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var btnCalif: CustomButton!
    @IBOutlet weak var btnAvisos: CustomButton!
    @IBOutlet weak var btnCalendario: CustomButton!
    @IBOutlet weak var btnEstado: CustomButton!
    
    let styleHelper = StyleHelperLib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        btnCalif.shadowLayer.fillColor = UIColor.systemBlue.cgColor
//        assignButtonColors()
        // Do any additional setup after loading the view.
        
    }
    override func viewDidAppear(_ animated: Bool) {
        assignButtonColors()
        assignEstadoTitle()
        //        self.btnCalif.applyGradient(colours: [hexStringToUIColor(hex: "222B45"), .black])
    }
    
    func assignButtonColors(){
        btnCalif.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "222B45"))
        btnCalendario.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "AC4040"))
        btnAvisos.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "FFB110"))
        btnEstado.changeColor(newColor: styleHelper.hexStringToCGColor(hex: "11A05B"))
    }
    
    func assignEstadoTitle(){
        let para = NSMutableParagraphStyle()
        para.alignment = .natural
        para.lineBreakMode = .byWordWrapping
        let s = NSAttributedString(
            string: "Estado de Cuenta", attributes: [.paragraphStyle : para])
        self.btnEstado.setAttributedTitle(s, for: .normal)
        self.btnEstado.titleLabel?.numberOfLines = 0
        self.btnEstado.titleLabel?.font = UIFont(name: "Gilroy-Bold", size: 22.0)
        self.btnEstado.titleLabel?.textColor = UIColor.white
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        self.navigationController!.isNavigationBarHidden = true;
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
