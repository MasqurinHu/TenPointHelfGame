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
    //加入玩家局數概念
    var 玩家Ａ = 分數儲存()
    
    override func setUp() {
        super.setUp()
        
        玩家Ａ.重開新局()
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
        XCTAssert(是否在範圍內)
    }
    //檢查玩家分數
    func test計算一般分數1() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 0, 當前: 5) == 5)
    }
    func test計算一般分數2() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 10, 當前: 5) == 15)
    }
    func test計算一般分數3() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 0.5, 當前: 1) == 1.5)
    }
    func test計算一般分數錯誤累積分數1() {
        XCTAssert(玩家Ａ.計算一般分數(總分: -1, 當前: 5) == nil)
    }
    func test計算一般分數錯誤累積分數2() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 21, 當前: 5) == nil)
    }
    func test計算一般分數錯誤牌卡1() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 10, 當前: -1) == nil)
    }
    func test計算一般分數錯誤牌卡2() {
        XCTAssert(玩家Ａ.計算一般分數(總分: 10, 當前: 14) == nil)
    }
    func test計算JQK分數1() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: 0, 當前: 11) == 0.5)
    }
    func test計算JQK分數2() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: 10, 當前: 12) == 10.5)
    }
    func test計算JQK分數錯誤總分1() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: -1, 當前: 13) == nil)
    }
    func test計算JQK分數錯誤總分2() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: 21, 當前: 13) == nil)
    }
    func test計算JQK分數錯誤卡牌1() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: 10, 當前: 10) == nil)
    }
    func test計算JQK分數錯誤卡牌2() {
        XCTAssert(玩家Ａ.計算JQK分數(總分: 10, 當前: 14) == nil)
    }
    
    // 測試算分
    func test算分1() {
        guard 玩家Ａ.接收牌(派牌: 10) else {
            XCTAssert(false)
            return
        }
        XCTAssert(玩家Ａ.算分().分數 == 10)
    }
    
    func test算分2() {
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        XCTAssert(玩家Ａ.算分().分數 == 10)
    }
    
    func test算分3() {
        guard 玩家Ａ.接收牌(派牌: 11) else {
            XCTAssert(false)
            return
        }
        XCTAssert(玩家Ａ.算分().分數 == 10)
    }
    func test算分4() {
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        XCTAssert(玩家Ａ.算分().分數 == 10)
    }
    func test算分5() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        XCTAssert(玩家Ａ.算分().分數 == 10)
    }
    func test累計算分1() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 5) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        XCTAssert(算分 == 5.5)
    }
    func test累計算分2() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 7) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        XCTAssert(算分 == 8)
    }
    func test累計算分3() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 7) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        XCTAssert(算分 == 9)
    }
    func test累計算分4() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 3) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 7) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        XCTAssert(算分 == 12)
    }
    func test累計算分數量超過() {
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 3) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 7) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 3) else {
            XCTAssert(true)
            return
        }
        XCTAssert(false)
    }
    
    // 測試 檢查排是否十點半
    func test檢查是否十點半天胡1() {
        
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 算分)
        
        XCTAssert(是十點半)
    }
    
    func test檢查是否十點半天胡2() {
        
        guard 玩家Ａ.接收牌(派牌: 10) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 算分)
        
        XCTAssert(是十點半)
    }
    
    func test檢查是否十點半天胡3() {
        
        guard 玩家Ａ.接收牌(派牌: 11) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 是十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 算分)
        
        XCTAssert(是十點半)
    }
    func test檢查不是十點半1() {
        
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 不是十點半 = !遊戲規則.檢查點數是否十點半(持有點數: 算分)
        
        XCTAssert(不是十點半)
    }
    func test檢查不是十點半2() {
        
        guard 玩家Ａ.接收牌(派牌: 13) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 5) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 不是十點半 = !遊戲規則.檢查點數是否十點半(持有點數: 算分)
        
        XCTAssert(不是十點半)
    }
    
    //十點半有第二個結束方法 過五關
    func test檢查過五關1() {

        guard 玩家Ａ.接收牌(派牌: 2) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 3) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 2) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 不是十點半 = !遊戲規則.檢查點數是否十點半(持有點數: 算分)
        guard 不是十點半 else {
            XCTAssert(false)
            return
        }
        XCTAssert(遊戲規則.檢查是否過五關(關數: 玩家Ａ.算分().幾張))
        
    }
    func test檢查過五關2() {
        
        guard 玩家Ａ.接收牌(派牌: 2) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 3) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 4) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 算分)
        guard 十點半 else {
            XCTAssert(false)
            return
        }
        XCTAssert(遊戲規則.檢查是否過五關(關數: 玩家Ａ.算分().幾張))
        
    }
    
    func test檢查過五關失敗1() {
        
        guard 玩家Ａ.接收牌(派牌: 2) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 1) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 7) else {
            XCTAssert(false)
            return
        }
        guard 玩家Ａ.接收牌(派牌: 12) else {
            XCTAssert(false)
            return
        }
        guard let 算分 = 玩家Ａ.算分().分數 else {
            XCTAssert(false)
            return
        }
        let 十點半 = 遊戲規則.檢查點數是否十點半(持有點數: 算分)
        guard 十點半 else {
            XCTAssert(false)
            return
        }
        XCTAssert(!遊戲規則.檢查是否過五關(關數: 玩家Ａ.算分().幾張))
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
