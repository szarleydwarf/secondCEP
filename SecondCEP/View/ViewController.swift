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
        
        let lfh = LocalFileHelper()
        viewModel = ViewModel(localFileHelper: lfh, file: "Accounts.json")
        
        self.registerCell()
    }
    
    func registerCell() {
        let customCell = UINib(nibName: identifier, bundle: nil)
        self.table.register(customCell, forCellReuseIdentifier: identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.accountsList?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let accountsList = viewModel.accountsList else {return UITableViewCell()}
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? AccountsCell {
            let model = accountsList[indexPath.row] as Account
            updateCell(cell, with: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func updateCell(_ cell: AccountsCell, with account: Account) {
        cell.titleAndKind.text = viewModel.prepareString(from: [account.title, account.kind])
        cell.currencyAndBalance.text = "\(account.balance)"
        cell.accountNumber.text = account.number
    }
}
