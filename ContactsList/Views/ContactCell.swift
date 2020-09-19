//
//  ContactCell.swift
//  ContactsList
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    
    func configure(with person: Person) {
        nameLabel.text = person.name
    }
}
