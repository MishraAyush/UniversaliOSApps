//
//  UniversaliOSAppTests.swift
//  UniversaliOSAppTests
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import XCTest
@testable import UniversaliOSApp

class UniversaliOSAppTests: XCTestCase {

    var viewControllerUnderTest : ListVC?
    override func setUp() {
        super.setUp()
        self.viewControllerUnderTest = ListVC()
        self.viewControllerUnderTest!.loadView()
        self.viewControllerUnderTest!.viewDidLoad()
    }

    override func tearDown() {
        super.tearDown()
    }
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest!.tableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest!.tableView.dataSource)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest!.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest!.conforms(to: UITableViewDelegate.self))
    }

    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest!.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest!.responds(to: #selector(viewControllerUnderTest!.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest!.responds(to: #selector(viewControllerUnderTest!.tableView(_:cellForRowAt:))))
    }

    func testTableViewCellHasReuseIdentifier() {
        let cell = ListCell(style: .default, reuseIdentifier: "cellId")
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "cellId"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    //MARK:- Example Of a failed TestCase
    func testTableCellHasCorrectLabelText() {
        let cell = ListCell(style: .default, reuseIdentifier: "cellId")
        XCTAssertEqual(cell.cellTitleLabel.text, "Beavers" )
//        XCTAssertEqual(cell?.descriptionLabel.text, "One")
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
