//
//  ViewController.swift
//  CBMT
//
//  Created by Caro Obregon on 12/10/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {


    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.isNavigationBarHidden = true;
        //DatabaseManager.shared.getAlumnos()
        //DatabaseManager.shared.deleteUser(id: "cXcPjoVbcb2rrJWXvLVM")
        //DatabaseManager.shared.editUser(id: "dDG9eowRcs7KSNP3GaRh", fName: "gabriela")
        
        
       // DatabaseManager.shared.createUser(fName: "Adriana", lName: "Corona Garza", direccion: "Avenida Santa maria #116", email: "adriana@colegiobilinguemarktwain.com", telefono: "8182662203", isPadre: true, isAdmin: true, isMaestro: false)
        
        
        
        
//        DatabaseManager.shared.getUsuarios{ (usuarios) in
//            for i in usuarios{
//                print(i.id)
//
//            }
//
//        }
        // Do any additional setup after loading the view.
    }

    @IBAction func ingresarAction(_ sender: Any) {
        if self.txtUsuario.text == "" || self.txtContrasena.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        
        } else {
            
            Auth.auth().signIn(withEmail: self.txtUsuario.text!, password: self.txtContrasena.text!) { (user, error) in
                
                if error == nil {
                    
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        if txtUsuario.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        
        } else {
            Auth.auth().createUser(withEmail: txtUsuario.text!, password: txtContrasena.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    }
    
}
