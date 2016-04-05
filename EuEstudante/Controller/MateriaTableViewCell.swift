//
//  MateriaTableViewCell.swift
//  EuEstudante
//
//  Created by admin on 05/04/16.
//  Copyright © 2016 Emerson Raniere. All rights reserved.
//

import UIKit

class MateriaTableViewCell: UITableViewCell{
    @IBOutlet weak var lbNomeMateria: UILabel!
    @IBOutlet weak var lbDiaSemana: UILabel!
    
    var tableViewController: ListarTableViewController!
    var materia:Materia!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected){
            let alert = UIAlertController(title: materia.nomeMateria, message: "Obs.: \(materia.observacoes)", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
            tableViewController.materia = materia
        }
    }
   

}
