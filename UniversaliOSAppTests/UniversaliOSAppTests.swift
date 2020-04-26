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

    var listVCTest : ListVC?
    override func setUp() {
        super.setUp()
        self.listVCTest = ListVC()
        self.listVCTest!.loadView()
        self.listVCTest!.viewDidLoad()
    }

    override func tearDown() {
        super.tearDown()
    }
    func testHasATableView() {
        XCTAssertNotNil(listVCTest!.tableView)
    }
    
    func testTVCHasDataSource() {
        XCTAssertNotNil(listVCTest!.tableView.dataSource)
    }
    
    func testTVCDelegate() {
        XCTAssertNotNil(listVCTest!.tableView.delegate)
    }
    
    func testTableViewDelegateProtocol() {
        XCTAssertTrue(listVCTest!.conforms(to: UITableViewDelegate.self))
    }

    func testTableViewDataSourceProtocol() {
        XCTAssertTrue(listVCTest!.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(listVCTest!.responds(to: #selector(listVCTest!.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(listVCTest!.responds(to: #selector(listVCTest!.tableView(_:cellForRowAt:))))
    }

    func testTVCHasReuseIdentifier() {
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
