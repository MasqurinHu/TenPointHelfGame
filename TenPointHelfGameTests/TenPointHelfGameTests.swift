//
//  TenPointHelfGameTests.swift
//  TenPointHelfGameTests
//
//  Created by 胡家溢 on 2018/7/22.
//  Copyright © 2018年 TenPointHelfGame. All rights reserved.
//

import XCTest
@testable import TenPointHelfGame

class TenPointHelfGameTests: XCTestCase {
    
    let 遊戲規則 = GameModel()
    
    override func setUp() {
        super.setUp()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    // 測試 派牌
    func test派牌() {
        
        //基本上 拿到的牌一定是1~13之間
        let 牌的範圍 = 1 ... 13
        let 取得牌 = 遊戲規則.派牌()
        
        let 是否在範圍內: Bool
        switch 取得牌 {
        case 牌的範圍:
            是否在範圍內 = true
        default:
            是否在範圍內 = false
        }
        
        print("test派牌")
        print("取得牌", 取得牌)
        XCTAssert(是否在範圍內)
    }
    
    // 測試 檢查排是否超過十點半
    func test檢查是否十點半天胡1() {
        
        let 派牌 = 1
        let 現有: Float = 0.5
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 現有, 新得到點數: 派牌)
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 更新點數)
        
        print("test檢查是否十點半天胡1")
        print("派牌 = ",派牌 ,"\n現有 = ", 現有 ,"\n 更新點數 = ", 更新點數 )
        XCTAssert(是十點半)
    }
    
    func test檢查是否十點半天胡2() {
        
        let 派牌 = 11
        let 現有: Float = 0.5
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 現有, 新得到點數: 派牌)
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 更新點數)
        
        print("test檢查是否十點半天胡2")
        print("派牌 = ",派牌 ,"\n現有 = ", 現有 ,"\n 更新點數 = ", 更新點數 )
        XCTAssert(是十點半)
    }
    
    func test檢查是否十點半天胡3() {
        
        let 派牌 = 10
        let 現有: Float = 0.5
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 現有, 新得到點數: 派牌)
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 更新點數)
        
        print("test檢查是否十點半天胡3")
        print("派牌 = ",派牌 ,"\n現有 = ", 現有 ,"\n 更新點數 = ", 更新點數 )
        XCTAssert(是十點半)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
