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
    
    
    
    
    
    
}
