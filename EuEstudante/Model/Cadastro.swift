//
//  Cadastro.swift
//  EuEstudante
//
//  Created by admin on 31/03/16.
//  Copyright © 2016 Emerson Raniere. All rights reserved.
//

import Foundation

class Cadastro {
    
    var lista: Array<Materia>
    let arquivo: String
    
    init(){
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        self.arquivo = "\(path)/dados"
        
        if let obj = NSKeyedUnarchiver.unarchiveObjectWithFile(self.arquivo){
            self.lista = obj as! Array<Materia>
        }else {
            self.lista = Array<Materia>()
        }
    }
    
    func add(nova:Materia){
        self.lista.append(nova)
        NSKeyedArchiver.archiveRootObject(self.lista, toFile: self.arquivo)
    }
    
    func get(index:Int) -> Materia{
        return self.lista[index]
    }
    
    func remove(index: Int) {
        self.lista.removeAtIndex(index)
        NSKeyedArchiver.archiveRootObject(self.lista, toFile: self.arquivo)
    }
    func quantidade() -> Int{
        return self.lista.count
    }
}