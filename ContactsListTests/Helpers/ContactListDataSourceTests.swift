//
//  ContactListDataSourceTests.swift
//  ContactsListTests
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import XCTest
@testable import ContactsList

class ContactListDataSourceTests: XCTestCase {
    
    var dataSource: ContactListDataSource!
    var mockTableView: MockTableView!
    var contactListVC: ContactListViewController!
    var person: Person!

    override func setUpWithError() throws {
        super.setUp()
        dataSource = ContactListDataSource()
        dataSource.contactManager = ContactManager()
        
        mockTableView = MockTableView.mockTableView(with: dataSource)
        person = Person(name: "Foo", phone: "Bar")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        contactListVC = storyboard.instantiateViewController(identifier: "ContactListViewController") as? ContactListViewController
        
        contactListVC.loadViewIfNeeded()
        
    }

    override func tearDownWithError() throws {
        dataSource = nil
        mockTableView = nil
        contactListVC = nil
        person = nil
        super.tearDown()
    }
    
    func testHasOneSection() {
        let numberOfSections =  mockTableView.numberOfSections
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfRowsEqualsContactListCount() {
        dataSource.contactManager?.add(person: person)
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 1)
         
        dataSource.contactManager?.add(person: Person(name: "Baz", phone: "Foo"))
        mockTableView.reloadData()
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsContactCell() {
        dataSource.contactManager?.add(person: person)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ContactCell)
    }
    
    //check is work reuseable row in table view
    func testCellForRowDequeuesCellFromTableView() {
        dataSource.contactManager?.add(person: person)
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockContactCell
        
        XCTAssert(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigureCell() {
        dataSource.contactManager?.add(person: person)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockContactCell
        
        XCTAssertEqual(cell.person, person)
    }
    

}

extension ContactListDataSourceTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        static func mockTableView(with dataSource: UITableViewDataSource) -> MockTableView {
            let mockTableView = MockTableView()
            mockTableView.dataSource = dataSource
            mockTableView.register(MockContactCell.self, forCellReuseIdentifier: "Cell")
            return mockTableView
        }
    }
    
    class MockContactCell: ContactCell {
        var person: Person?
        
        override func configure(with person: Person) {
            self.person = person
        }
    }
}


