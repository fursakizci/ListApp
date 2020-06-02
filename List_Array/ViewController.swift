//
//  ViewController.swift
//  List_Array
//
//  Created by Furkan sakızcı on 31.07.2019.
//  Copyright © 2019 Furkan sakızcı. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var listTable: UITableView!
   
    var arrTitle = [String]()
    var arrSubtitle = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        listTable.dataSource = self
        listTable.delegate = self
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrSubtitle.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "ViewCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = arrTitle[indexPath.row]
        cell.subtitleLabel.text = arrSubtitle[indexPath.row]
        return cell
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        var textFieldTitle = UITextField()
        var textFieldSubtitle = UITextField()
        let alert = UIAlertController(title: "Ekle", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Tamam", style: .default) { (action) in
            
            
            if textFieldTitle.text!.count != 0 || textFieldSubtitle.text!.count != 0 {
            self.arrTitle.append(textFieldTitle.text!)
            self.arrSubtitle.append(textFieldSubtitle.text!)
            self.listTable.reloadData()
            }else{
                return
            }
        }
        alert.addTextField { (alertTextFieldTitle) in
            
            alertTextFieldTitle.placeholder = "Baslik ekleyin."
            textFieldTitle = alertTextFieldTitle
            
            }
        alert.addTextField { (alertTextFieldSubtitle) in
            alertTextFieldSubtitle.placeholder="Alt baslik ekleyin."
            textFieldSubtitle = alertTextFieldSubtitle
            
        }
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        arrTitle.remove(at: indexPath.row)
        arrSubtitle.remove(at: indexPath.row)
        listTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTable.deselectRow(at: indexPath, animated: true)
    }
    
}

