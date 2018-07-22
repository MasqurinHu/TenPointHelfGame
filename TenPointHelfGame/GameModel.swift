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
