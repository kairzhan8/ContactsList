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

    override func setUpWithError() throws {
        super.setUp()
    }

    override func tearDownWithError() throws {
        
        super.tearDown()
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "ContactListViewController") as! ContactListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }

}
