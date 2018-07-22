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
        
        //糟糕 卡住了 思考一下
        let 新點數: Int
        switch 新得到點數 {
        case 11, 12, 13:
            新點數 = 10
        default:
            新點數 = 新得到點數
        }
        // 計算總和是否超過10.5 再決定11, 12, 13是多少點
        let 總和 = 持有點數 + Float(新點數)
        
        let 轉換後點數: Float
        if 總和 > 10.5 {
            switch 新得到點數 {
            case 1:
                轉換後點數 = 持有點數 + 1
            case 11 ... 13:
                轉換後點數 = 持有點數 + 0.5
            default:
                轉換後點數 = 持有點數 + Float(新得到點數)
            }
        } else {
            switch 新得到點數 {
            case 1, 11, 12, 13:
                轉換後點數 = 持有點數 + 10
            default:
                轉換後點數 = 持有點數 + Float(新得到點數)
            }
        }
        return 轉換後點數
    }
    
    func 檢查點數是否十點半(持有點數: Float) -> Bool {
        
        if 持有點數 == 10.5 {
            return true
        } else {
            return false
        }
    }
    
    
    
    
}
