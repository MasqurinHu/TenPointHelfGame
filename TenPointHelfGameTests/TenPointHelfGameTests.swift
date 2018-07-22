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
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        
        //基本上 拿到的牌一定是1~13之間 所以
        let 牌的範圍 = 1 ... 13
        
        let 取得牌 = 遊戲規則.派牌()
        
        // 糟糕 不知道怎麼檢查數值是否在範圍內
        // 怎麼測試也忘記了 馬上餵狗 請求支援
        
        let 是否在範圍內: Bool
        switch 取得牌 {
        case 牌的範圍:
            是否在範圍內 = true
        default:
            是否在範圍內 = false
        }
        XCTAssert(是否在範圍內)
        // 開始第一次測試
        // 應為我派牌 一定是0 不在我設定的範圍內 所以測試失敗 就先用版本控制 git 記住這次錯誤的測試
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
