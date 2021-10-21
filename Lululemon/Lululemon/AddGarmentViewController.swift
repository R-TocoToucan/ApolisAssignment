//
//  AddGarmentViewController.swift
//  Lululemon
//
//  Created by Minseok Choi on 10/13/21.
//

import UIKit

class AddGarmentViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var txtField: UITextField!
    
    var viewModel = ListViewModel()
    var completionHandler : (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func saveBtnClicked(_ sender: UIBarButtonItem) {
        let name = txtField.text ?? ""
        if name.count == 0 {
            self.dismiss(animated: true)
        } else {
            viewModel.db.saveData(name: name)
            completionHandler?()
            self.dismiss(animated: true)
        }
    
    }
}
