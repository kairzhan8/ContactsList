//
//  Person.swift
//  ContactsList
//
//  Created by Kairzhan Kural on 9/18/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

struct Person {
    var name: String
    var phone: String
    var surname: String?
    private(set) var date: Date?
    var imageData: Data?
    
    init(name: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.phone = phone
        self.imageData = imageData
        date = Date()
    }
    
    init(name: String, surname: String, phone: String, imageData: Data? = nil) {
        self.name = name
        self.surname = surname
        self.phone = phone
        self.imageData = imageData
        date = Date()
    }
}
