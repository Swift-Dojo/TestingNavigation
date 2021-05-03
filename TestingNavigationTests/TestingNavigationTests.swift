//
//  TestingNavigationTests.swift
//  TestingNavigationTests
//
//  Created by Oliver Jordy Pérez Escamilla on 30/04/21.
//

import XCTest
@testable import TestingNavigation

class NavigationTests: XCTestCase {
    
    func test_tappingButton_showsDetailViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: .init(for: ViewController.self))
        let sut: ViewController = storyboard.instantiateViewController(identifier: "ViewController")
        
        sut.loadViewIfNeeded()
        
        let navigation = UINavigationController(rootViewController: sut)
        
        sut.navigationButton.sendActions(for: .touchUpInside)
        
        executeRunLoop()
        
        XCTAssertEqual(navigation.viewControllers.count, 2)
        XCTAssertTrue(navigation.viewControllers.last is DetailViewController)
    }
    
    func executeRunLoop() {
        RunLoop.current.run(until: Date())
    }
}
