//
//  EstadosViewController.swift
//  c-bilingua
//
//  Created by user182115 on 11/19/20.
//  Copyright © 2020 cbmt. All rights reserved.
//

import UIKit

class EstadosViewController: UIViewController {

    @IBOutlet weak var viewEst: UIView!
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll.contentSize = viewEst.frame.size
        // Do any additional setup after loading the view.
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
