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
        //第二次測試 不知道會不會通過測試
        // 非常好 測試有過 再把這次通過的改變 記錄到git上
    }
    
    // 測試 檢查排是否超過十點半
    func test檢查是否超過十點半() {
        
        let 派牌 = 遊戲規則.派牌()
        
        //發現問題 撲克牌發牌 一定是整數 可是檢查要小數點所以 把發現問題 用git記住
        let 更新點數 = 遊戲規則.點數轉換(持有點數: 派牌, 新得到點數: 派牌)
        
        let 檢查 = 遊戲規則.檢查點數是否超過十點半(持有點數: 更新點數)
        //發現 好像中文用注音輸入 沒有比較快～
        XCTAssert(檢查)
        // 看起來 新作的方法可以通過編譯器了 但是 跟十點半的規則仍然不相同 再用git把這個流程記錄下來
    }
    
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
