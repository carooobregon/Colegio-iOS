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
    
    // MARK: - GetAll DB Records
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
    
    func getCalificaciones(completion:@escaping([Calificacion])-> Void){
        firestore.collection("Calificacion").getDocuments{( snapshot,error ) in
 
            if( error == nil){
                var calificaciones : [Calificacion] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    
                    //print(dict)
                    
                    let calificacion = try? self.decoder.decode(Calificacion.self, from: data)
                    calificaciones.append(calificacion ?? Calificacion())
                }
                completion(calificaciones)
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
    
    func getEventos(completion:@escaping([Eventos])-> Void){
        firestore.collection("Eventos").getDocuments{( snapshot,error ) in
            if( error == nil){
                var eventos : [Eventos] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    let evento = try? self.decoder.decode(Eventos.self, from: data)
                    eventos.append(evento ?? Eventos())
                }
                
                completion(eventos)
            }
            else{
                completion([])
            }
        }
    }
    
    func getAvisos(completion:@escaping([Avisos])-> Void){
        firestore.collection("Avisos").getDocuments{( snapshot,error ) in
            if( error == nil){
                var avisos : [Avisos] = []
                for document in snapshot?.documents ?? []{
                    var dict = document.data()
                    dict["id"] = document.documentID
                    guard let data = try? JSONSerialization.data(withJSONObject: dict, options: []) else {return}
                    let aviso = try? self.decoder.decode(Avisos.self, from: data)
                    avisos.append(aviso ?? Avisos())
                }
                
                completion(avisos)
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
    
    // MARK: - Create DB Records
    
    func createUser(fName:String, lName:String, direccion:String, email:String, telefono:String, role:Int,alumnos:[String]){
        firestore.collection("Usuarios").addDocument(data:["fName":fName, "lName":lName, "direccion":direccion, "email":email, "telefono":telefono, "role": role, "alumnos":alumnos ])
    }
   
    func createAlumno(fName:String, lName:String, email:String, genero:Bool, grado:Int,  nivel:String, materias:[String], calificaciones:[String]){
        firestore.collection("Alumnos").addDocument(data:["fName":fName, "lName":lName, "email":email, "genero":genero, "grado": grado,"nivel":nivel, "materias":materias, "calificaiones":calificaciones ])
    }
    
    func createMateria(nombreMaestra:String, nombreMateria:String){
        firestore.collection("Materias").addDocument(data:["nombreMaestra":nombreMaestra, "nombreMateria":nombreMateria])
    }
    
    func createEvento(titulo:String, descripcion:String, dia: Int){
        firestore.collection("Eventos").addDocument(data:["titulo":titulo, "descripcion":descripcion, "dia": dia])
    }
    
    func createAviso(titulo:String, descripcion:String){
        firestore.collection("Avisos").addDocument(data:["titulo":titulo, "descripcion":descripcion])
    }
    
    
    
    // MARK: - Edit DB Records
    func editUser(id:String, alumnos:[String]){
        firestore.collection("Usuarios").document(id).updateData(["alumnos": alumnos])
    }
    
    func editAlumno(id:String, materias:[String]){
        firestore.collection("Alumnos").document(id).updateData(["materias": materias])
    }
    
    // MARK: - Delete DB Records
    func deleteUser(id:String){
        firestore.collection("Usuarios").document(id).delete()
    }
    

    
}
