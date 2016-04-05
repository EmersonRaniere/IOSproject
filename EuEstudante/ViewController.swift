//
//  ViewController.swift
//  EuEstudante
//
//  Created by admin on 31/03/16.
//  Copyright © 2016 Emerson Raniere. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var tfDiaSemana: UITextField!
    @IBOutlet weak var tfNomeMateria: UITextField!
    @IBOutlet weak var tvObservacoes: UITextView!
    
    var delegate: CadastroMateria!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Nova Materia"
        
        let btDir = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Save, target: self, action: "salvar")
        self.navigationItem.rightBarButtonItem = btDir
        
        
    }
    
    
    func salvar(){
        let materia = Materia(nomeMateria: self.tfNomeMateria.text!,
            diaSemana: self.tfDiaSemana.text!,
            observacoes: self.tvObservacoes.text)
        self.delegate.add(materia)
        self.navigationController?.popViewControllerAnimated(true)
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }


}

