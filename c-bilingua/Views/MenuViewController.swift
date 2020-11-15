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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignButtonColors()
        // Do any additional setup after loading the view.
        
    }
    
    func assignButtonColors(){
        btnCalif.shadowLayer.fillColor = UIColor.lightGray.cgColor

        btnAvisos.shadowLayer.fillColor = UIColor.lightGray.cgColor

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
