//
//  DatabaseManager.swift
//  desdeCero
//
//  Created by Gaby Corona on 11/3/20.
//  Copyright © 2020 Gaby Corona. All rights reserved.
//

import Foundation
import Firebase

class DatabaseManager{
    init( ){
        
    }
    let firestore = Firestore.firestore()
    let decoder = JSONDecoder()
    
    static let shared = DatabaseManager()
    
    func getUsuarios(completion:@escaping([Usuario])-> Void){
        firestore.collection("Usuarios").getDocuments{( snapshot,error ) in
            if( error == nil){
                var usuarios : [Usuario] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    let usuario = try? self.decoder.decode(Usuario.self, from: data)
                    usuarios.append(usuario ?? Usuario())
                    
                    
                    //print(dict)
                    
                }
                completion(usuarios)
                
            }
            else{
                completion([])
            }
        }
    }
    
    func getAlumnos(completion:@escaping([Alumno])-> Void){
        firestore.collection("Alumnos").getDocuments{( snapshot,error ) in
            if( error == nil){
                var alumnos : [Alumno] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    let alumno = try? self.decoder.decode(Alumno.self, from: data)
                    alumnos.append(alumno ?? Alumno())
                }
                completion(alumnos)
            }
            else{
                completion([])
            }
        }
    }
    
    func getMaterias(completion:@escaping([Materias])-> Void){
        firestore.collection("Materias").getDocuments{( snapshot,error ) in
            if( error == nil){
                var materias : [Materias] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    let materia = try? self.decoder.decode(Materias.self, from: data)
                    materias.append(materia ?? Materias())
                }
                
                completion(materias)
            }
            else{
                completion([])
            }
        }
    }


//
//
//    func getAdmins(completion:@escaping([Usuario])-> Void){
//
//        firestore.collection("Usuario").whereField("isAdmin",isEqualTo: true).getDocuments{( snapshot,error ) in
//
//            if( error == nil){
//                var usuarios : [Usuario] = []
//
//                for document in snapshot?.documents ?? []{
//                    var dict = document.data()
//                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
//                    let usuario = try? self.decoder.decode(Usuario.self, from: data)
//                    usuarios.append(usuario ?? Usuario())
//
//                }
//                //print(usuarios.count)
//                completion(usuarios)
//
//            }
//            else{
//                completion([])
//            }
//        }
//
//    }
    
    func createUser(fName:String, lName:String, direccion:String, email:String, telefono:String, role:Int,alumnos:[String]){
        firestore.collection("Usuarios").addDocument(data:["fName":fName, "lName":lName, "direccion":direccion, "email":email, "telefono":telefono, "role": role, "alumnos":alumnos ])
    }
    
    func editUser(id:String, fName:String){
        firestore.collection("Usuarios").document(id).updateData(["fName": fName])
    }
    
    func deleteUser(id:String){
        firestore.collection("Usuarios").document(id).delete()
    }
    

    
}
