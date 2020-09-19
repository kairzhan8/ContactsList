//
//  ContactManagerTests.swift
//  ContactsListTests
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import XCTest
@testable import ContactsList

class ContactManagerTests: XCTestCase {
    
    var contactManager: ContactManager!
    var person: Person!

    override func setUpWithError() throws {
        super.setUp()
        contactManager = ContactManager()
        person = Person(name: "Foo", phone: "Bar")
    }

    override func tearDownWithError() throws {
        contactManager = nil
        person = nil
        super.tearDown()
    }
    
    func testInitContactManagerWithEmptyList() {
        XCTAssertEqual(contactManager.contactsCount, 0)
    }
    
    func testAddPersonIncrementContactsCount() {
        contactManager.add(person: person)
        XCTAssertEqual(contactManager.contactsCount, 1)
    }
    
    func testContactAtIndexIsAddedToPerson() {
        contactManager.add(person: person)
        let returnedPerson = contactManager.person(at: 0)
        XCTAssertEqual(person, returnedPerson)
    }
    
    func testAddingSameObjectDoesNotIncrementContactsCount() {
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        contactManager.add(person: Person(name: "Foo", phone: "Bar"))
        XCTAssertEqual(contactManager.contactsCount, 1)
    }

}
