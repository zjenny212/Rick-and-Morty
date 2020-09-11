//
//  Rick_and_MortyTests.swift
//  Rick and MortyTests
//
//  Created by Keyi Zhu on 9/10/20.
//

import XCTest
import Quick
import Nimble

@testable import Rick_and_Morty

class MainViewControllerTests: QuickSpec {
    let n = "hello"
    override func spec() {
        describe("MainView Controller test") {
            it("has everything you need to get started") {
                expect(self.n).toEventually(equal("hello"))
            }
            
            context("if it doesn't have what you're looking for") {
                it("needs to be updated") {
                }
            }
        }
    }
}
