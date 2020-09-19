//
//  ContactManager.swift
//  ContactsList
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class ContactManager {
    
    var contactsCount: Int {
        persons.count
    }
    private var persons: [Person] = []
    
    func add(person: Person) {
        if !persons.contains(person) {
            persons.append(person)
        }
    }
    
    func person(at index: Int) -> Person {
        return persons[index]
    }
    
    
}
