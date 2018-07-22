//
//  GameModel.swift
//  TenPointHelfGame
//
//  Created by 胡家溢 on 2018/7/22.
//  Copyright © 2018年 TenPointHelfGame. All rights reserved.
//

import Foundation

class GameModel {
    
    //首先 10點半 需要莊家 玩家 派牌 計分 牌發完
    //先做一個方法 派牌
    
    func 派牌() -> Int {
        // 撲克牌 要派排的範圍在 1~13 所以 修改一下程式碼
        
        let 派牌 = arc4random_uniform(13)
        return Int(派牌)
    }
    
    //我們缺少了點數轉換的方法 就做一個吧
    func 點數轉換(持有點數: Float, 新得到點數: Int) -> Float {
        
        //十點半的點數轉換
        //恩 1,可以當1,10
        //11,12,13 可以當10, 0.5
        //根據這個基本規則 調整一下這個方法
        
        let 轉換後點數: Float
        if 持有點數 > 10 {
            switch 新得到點數 {
            case 11 ... 13:
                轉換後點數 = 持有點數 + 0.5
            default:
                轉換後點數 = 持有點數 + Float(新得到點數)
            }
        } else {
            轉換後點數 = 持有點數 + Float(新得到點數)
        }
        return 轉換後點數
    }
    
    
    //十點半有了 派牌 那就要檢查點數是否再次派牌
    func 檢查點數是否超過十點半(持有點數: Float) -> Bool {
        
        //因為完全沒有判斷輸入值 所以現在判斷一下
        //忽然發現一個盲點 十點半 有小數點 我輸入是用整數
        //所以需要調整
        
        if 持有點數 > 10.5 {
            return true
        } else {
            return false
        }
    }
    
    
    
    
}
