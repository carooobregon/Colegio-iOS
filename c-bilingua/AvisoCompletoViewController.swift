//
//  AvisoCompletoViewController.swift
//  c-bilingua
//
//  Created by Caro Obregon on 05/11/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class AvisoCompletoViewController: UIViewController {
    var tituloAviso : String = ""
    var descripcionAviso : String = ""
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titulo.text = tituloAviso
        body.text = descripcionAviso
        // Do any additional setup after loading the view.
    }

    // todo: implement scroll view for large texts

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
