//
//  GameModel.swift
//  TenPointHelfGame
//
//  Created by 胡家溢 on 2018/7/22.
//  Copyright © 2018年 TenPointHelfGame. All rights reserved.
//

import Foundation

struct 分數儲存 {
    
    private let A: Int = 1
    private let J: Int = 11
    private let Q: Int = 12
    private let K: Int = 13
    
    private var 分數倉庫 = [Int]()
    
    mutating func 重開新局() {
        分數倉庫.removeAll()
    }
    
    mutating func 接收牌(派牌: Int) -> Bool {
        guard 分數倉庫.count < 5 else {
            print("超過五張牌 需要結算了")
            return false
        }
        分數倉庫.append(派牌)
        return true
    }
    
    func 算分() -> (分數: Float?, 幾張: Int) {

        var 總分: Float = 0
        for 分數 in 分數倉庫 where 分數 < J {
            guard 計算一般分數(總分: 總分, 當前: 分數) != nil else {
                return (nil, 分數倉庫.count)
            }
            總分 += Float(分數)
        }
        for 分數 in 分數倉庫 where 分數 >= J {
            guard let 計算JQK分數 = 計算JQK分數(總分: 總分, 當前: 分數) else {
                return (nil, 分數倉庫.count)
            }
            總分 = 計算JQK分數
        }
        guard 是否重新計算分數(總分) else {
            return (總分, 分數倉庫.count)
        }
        for 分數 in 分數倉庫 where 分數 == A {
            guard 是否重新計算A(總分) else { break }
            guard let 重新計算A = 重新計算A(總分) else {
                return (nil, 分數倉庫.count)
            }
            總分 = 重新計算A
        }
        for 分數 in 分數倉庫 {
            switch 分數 {
            case J ... K:
                guard 是否重新計算JQK(總分) else { break }
                guard let 重新計算JQK = 重新計算JQK(總分) else {
                    return (nil, 分數倉庫.count)
                }
                總分 = 重新計算JQK
            default:
                break
            }
        }
        return (總分, 分數倉庫.count)
    }
    func 是否重新計算JQK(_ 總分: Float) -> Bool {
        guard let 重新計算JQK = 重新計算JQK(總分), 重新計算JQK <= 10.5 else {
            return false
        }
        return true
    }
    func 重新計算JQK(_ 總分: Float) -> Float? {
        guard 檢查總分(總分) else {
            return nil
        }
        return 總分 - 0.5 + 10
    }
    
    func 是否重新計算A(_ 總分: Float) -> Bool {
        guard let 重新計算A = 重新計算A(總分), 重新計算A <= 10.5 else {
            return false
        }
        return true
    }
    func 重新計算A(_ 總分: Float) -> Float? {
        guard 檢查總分(總分) else {
            return nil
        }
        return 總分 - 1 + 10
    }
    
    func 是否重新計算分數(_ 總分: Float) -> Bool {
        guard 總分 < 10.5 else {
            return false
        }
        return true
    }
    func 計算一般分數(總分: Float, 當前 分數: Int) -> Float? {
        guard 檢查一般(分數), 檢查總分(總分) else {
            return nil
        }
        return 總分 + Float(分數)
    }
    func 計算JQK分數(總分: Float, 當前 分數: Int) -> Float? {
        guard 檢查JQK(分數), 檢查總分(總分) else {
            return nil
        }
        return 總分 + 0.5
    }
    func 檢查一般(_ 分數: Int) -> Bool {
        guard 分數 > 0, 分數 < J else {
            print("一般分數不在範圍內", 分數)
            return false
        }
        return true
    }
    func 檢查總分(_ 總分: Float) -> Bool {
        guard 總分 >= 0, 總分 <= 20 else {
            print("總分 不在範圍內", 總分)
            return false
        }
        return true
    }
    func 檢查JQK(_ 分數: Int) -> Bool {
        switch 分數 {
        case J ... K:
            return true
        default:
            print("JQK不在範圍內", 分數)
            return false
        }
    }
    
    
}


class GameModel {
    
    //首先 10點半 需要莊家 玩家 派牌 計分 牌發完
    //先做一個方法 派牌
    
    func 派牌() -> Int {
        // 撲克牌 要派排的範圍在 1~13 所以 修改一下程式碼
        
        let 派牌 = arc4random_uniform(12) + 1
        return Int(派牌)
    }
    
    func 檢查點數是否十點半(持有點數: Float) -> Bool {
        
        if 持有點數 == 10.5 {
            return true
        } else {
            return false
        }
    }
    
    func 檢查點數是否超過十點半(持有點數: Float) -> Bool {
        
        if 持有點數 > 10.5 {
            return true
        } else {
            return false
        }
    }
    
    
    
}
