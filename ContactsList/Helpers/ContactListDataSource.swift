//
//  ContactListDataSource.swift
//  ContactsList
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ContactListDataSource: NSObject {
    
    var contactManager: ContactManager?
    
}

extension ContactListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactManager?.contactsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactCell
        
        if let person = contactManager?.person(at: indexPath.row) {
            cell.configure(with: person)
        }
        return cell
    }
    
    
}
