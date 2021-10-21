//
//  ListViewController.swift
//  Lululemon
//
//  Created by Minseok Choi on 10/13/21.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var sortControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchDataAndReloadTable()
        
    }
    
    @IBAction func toAddGarmentView(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddGarmentViewController") as? AddGarmentViewController else { return }
            vc.completionHandler = {
            self.fetchDataAndReloadTable()
            }
        self.present(vc, animated: true)
    }
    
    @IBAction func switchSortOrder(_ sender: UISegmentedControl) {
        fetchDataAndReloadTable()
    }
    
    func fetchDataAndReloadTable() {
        viewModel.fetchGarmentFromDB(sortIndex: sortControl.selectedSegmentIndex)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.nib, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
    }
    
}

extension ListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getGarmentsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as? CustomTableViewCell
        cell?.garment = viewModel.getGarment(index: indexPath.row)
        cell?.setupCell()
        return cell ?? CustomTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            self.viewModel.deleteGarmentFromDB(index: indexPath.row)
            
            self.fetchDataAndReloadTable()
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    

}
