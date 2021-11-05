//
//  ViewController.swift
//  NYTarticleDemo
//
//  Created by Minseok Choi on 10/15/21.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ArticleViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getDataFromServer(){
            DispatchQueue.main.async {
                self.setup()
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getRowCount()
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        cell?.article = viewModel.getDataArray()[indexPath.row]
        cell?.setupCell()
        return cell ?? CustomTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController {
            
            vc.article = viewModel.getDataArray()[indexPath.row]
            self.present(vc, animated: true)
        }
    
    }
    
        
}
