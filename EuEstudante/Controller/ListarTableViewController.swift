//
//  ListarTableViewController.swift
//  EuEstudante
//
//  Created by admin on 31/03/16.
//  Copyright © 2016 Emerson Raniere. All rights reserved.
//

import UIKit

class ListarTableViewController: UITableViewController, CadastroMateria {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var cadastro = Cadastro()
    var materia: Materia?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lp = UILongPressGestureRecognizer(target: self, action: Selector("toquelongo:"))
        self.view.addGestureRecognizer(lp)

    }
    
    func toquelongo(gr: UIGestureRecognizer){
        if gr.state == UIGestureRecognizerState.Began{
//            var urlString = "Aula de: \(materia!.nomeMateria) nos dias \(materia!.diaSemana)"
//            var urlStringEncoded = urlString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
//            var url  = NSURL(string: "whatsapp://send?text=\(urlStringEncoded!)")
            
            let alert = UIAlertController(title: "Clique Longo", message: "Aqui seria o whatsapp", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
            
            UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        }
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        if self.revealViewController() != nil{
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cadastro.quantidade()
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("materia", forIndexPath: indexPath) as! MateriaTableViewCell

        let materia = self.cadastro.get(indexPath.row)
        cell.materia = materia
        
        cell.lbNomeMateria.text = materia.nomeMateria
        cell.lbDiaSemana.text = materia.diaSemana
        cell.tableViewController = self

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            self.cadastro.remove(indexPath.row)
            self.tableView.reloadData()
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "add_materia"){
            let view = segue.destinationViewController as! ViewController
            view.delegate = self
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    func add (materia:Materia){
        self.cadastro.add(materia)
    }

}
