//
//  ViewController.swift
//  SecondCEP
//
//  Created by The App Experts on 05/01/2021.
//  Copyright © 2021 The App Experts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet var viewModel: ViewModel!
    private let identifier:String = "AccountsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.delegate = self
        self.table.dataSource = self
        
        self.registerCell()
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.table.register(customCell, forCellReuseIdentifier: identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AccountsCell {
            
            return cell
        }
        return UITableViewCell()
    }
    
    
}
