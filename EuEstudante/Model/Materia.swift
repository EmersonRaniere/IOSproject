//
//  Materia.swift
//  EuEstudante
//
//  Created by admin on 31/03/16.
//  Copyright © 2016 Emerson Raniere. All rights reserved.
//

import Foundation

class Materia: NSObject, NSCoding {
    var nomeMateria: String
    var diaSemana: String
    var observacoes: String
    
    init(nomeMateria:String, diaSemana:String, observacoes:String) {
        self.nomeMateria = nomeMateria
        self.diaSemana = diaSemana
        self.observacoes = observacoes
    }
    
    required init? (coder aDecoder: NSCoder){
        self.nomeMateria = aDecoder.decodeObjectForKey("nomeMateria") as! String
        self.diaSemana = aDecoder.decodeObjectForKey("diaSemana") as! String
        self.observacoes = aDecoder.decodeObjectForKey("observacoes") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.nomeMateria, forKey:  "nomeMateria")
        aCoder.encodeObject(self.diaSemana, forKey:  "diaSemana")
        aCoder.encodeObject(self.observacoes, forKey:  "observacoes")
    }
}