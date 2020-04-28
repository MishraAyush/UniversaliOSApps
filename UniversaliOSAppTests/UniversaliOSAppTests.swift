//
//  UniversaliOSAppTests.swift
//  UniversaliOSAppTests
//
//  Created by Ayush Mishra on 26/04/20.
//  Copyright © 2020 Ayush Mishra. All rights reserved.
//

import XCTest
import Hippolyte
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
    
    func testServiceCallInProject() {
        let url = URL(string: WebServiceURLS.kBaseUrl)!
        var stub = StubRequest(method: .GET, url: url)
        let path = Bundle(for: type(of: self)).path(forResource: "ListJson", ofType: "json")!
         _ = NSData(contentsOfFile: path)!
        var response = StubResponse()
        let body = "Hippolyte".data(using: .utf8)!
        response.body = body
        stub.response = response
        Hippolyte.shared.add(stubbedRequest: stub)
        Hippolyte.shared.start()
        
        let expectation = self.expectation(description: "Success")
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            XCTAssertEqual(data, body)
            expectation.fulfill()
        }
        task.resume()
        
        wait(for: [expectation], timeout: 1)
    }
    }


