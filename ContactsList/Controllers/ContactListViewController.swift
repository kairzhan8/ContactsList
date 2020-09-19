//
//  ContactListViewController.swift
//  ContactsList
//
//  Created by Kairzhan Kural on 9/18/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: ContactListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }


}

