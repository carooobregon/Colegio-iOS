//
//  Usuario.swift
//  CBMT
//
//  Created by Gaby Corona on 10/18/20.
//  Copyright © 2020 carooobregon. All rights reserved.
//

import UIKit


class Usuario: Codable {

    var fName : String = ""
    var lName : String  = ""
    var email : String = ""
    var isAdmin : Bool = false
    var isMaestro : Bool = false
    var isPadre : Bool = false
    
    var telefono : String = ""
    var direccion : String  = ""
    
    
    
    
   
//    init(){
//        self.id = 1
//        self.fName = "Gabriela"
//        self.lName = "Corona Garza"
//        self.email = "gabriela.corona03@gmail.com"
//        self.isAdmin = true
//        self.isMaestro = false
//        self.isPadre = false
//        self.telefono = "81-1013-4528"
//        self.direccion = " Avenida Santa maria #116  los rodriguez santiago "
//    }
//
//    func crearUsuario(fName: String, lName: String, email: String, isAdmin: Bool, isMaestro: Bool,  isPadre: Bool, telefono: String, direccion: String){
//        print("creating user")
//    }
//
//    func editarUsuario(id:Int, isAdmin:Bool){
//        print("Editando Usuario")
//    }
//
//    func borrarUsuario(id:Int, isAdmin:Bool){
//        print("borrando usuario")
//    }
}
