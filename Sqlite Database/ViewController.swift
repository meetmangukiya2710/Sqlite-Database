//
//  ViewController.swift
//  Sqlite Database
//
//  Created by R92 on 09/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sarnameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SqliteHelper.creatFile()
    }

    @IBAction func addDataButtonAction(_ sender: Any) {
        SqliteHelper.addData(grid: (Int(gridTextField.text ?? "") ?? 0), name: nameTextField.text ?? "", surName: sarnameTextField.text ?? "")
    }
    
    @IBAction func getDataButtonAction(_ sender: Any) {
        SqliteHelper.getData()
    }
    
    @IBAction func updateDataButtonAction(_ sender: Any) {
        SqliteHelper.updateData(grid:Int(gridTextField.text ?? "") ?? 0, name: nameTextField.text ?? "", surname: sarnameTextField.text ?? "")
    }
    
    @IBAction func deleteDataButtonAction(_ sender: Any) {
        SqliteHelper.deleteData(grid: Int(gridTextField.text ?? "") ?? 0)
    }
    
}

