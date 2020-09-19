//
//  ContactListViewControllerTests.swift
//  ContactsListTests
//
//  Created by Kairzhan Kural on 9/19/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import XCTest
@testable import ContactsList

class ContactListViewControllerTests: XCTestCase {
    
    var sut: ContactListViewController!

    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ContactListViewController") as? ContactListViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        
        super.tearDown()
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is ContactListDataSource)
    }

}
