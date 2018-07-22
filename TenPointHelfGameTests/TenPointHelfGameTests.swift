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
    
    //檢查更新點數
    func test更新點數1() {
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 4, 新得到點數: 12)
        XCTAssert(更新點數 == 4.5)
    }
    func test更新點數2() {
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 4.5, 新得到點數: 13)
        XCTAssert(更新點數 == 5)
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
    
    //十點半有第二個結束方法 過五關
    func test檢查過五關1() {
        
        let 派牌1 = 1
        var 更新點數 = 遊戲規則.點數轉換(持有點數: 0, 新得到點數: 派牌1)
        let 派牌2 = 2
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌2)
        let 派牌3 = 1
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌3)
        let 派牌4 = 12
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌4)
        let 派牌5 = 13
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌5)
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 更新點數)
        if 是十點半 {
            XCTAssert(false)
        }
        
        //點數轉換測試強度不足 這邊出錯了
        //需要檢查是否超過十點半
        let 是否超過10點半 = 遊戲規則.檢查點數是否超過十點半(持有點數: 更新點數)
        print("test檢查過五關1")
        print("派牌1 ", 派牌1," 派牌2 ", 派牌2, " 派牌3 ", 派牌3, " 派牌4 ", 派牌4, " 派牌5 ", 派牌5, "\n更新點數", 更新點數)
        XCTAssert(是否超過10點半)
    }
    
    func test檢查過五關失敗() {
        
        let 派牌1 = 1
        var 更新點數 = 遊戲規則.點數轉換(持有點數: 0, 新得到點數: 派牌1)
        let 派牌2 = 2
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌2)
        let 派牌3 = 3
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌3)
        let 派牌4 = 4
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌4)
        let 派牌5 = 5
        更新點數 = 遊戲規則.點數轉換(持有點數: 更新點數, 新得到點數: 派牌5)
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 更新點數)
        if 是十點半 {
            XCTAssert(false)
        }
        //需要檢查是否超過十點半
        let 是否超過10點半 = 遊戲規則.檢查點數是否超過十點半(持有點數: 更新點數)
        print("test檢查過五關失敗")
        print("派牌1 ", 派牌1," 派牌2 ", 派牌2, " 派牌3 ", 派牌3, " 派牌4 ", 派牌4, " 派牌5 ", 派牌5, "\n更新點數", 更新點數)
        
        //看來測試又寫錯了
        
        XCTAssert(!是否超過10點半)
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
