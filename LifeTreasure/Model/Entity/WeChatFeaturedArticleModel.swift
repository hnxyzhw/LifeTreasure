//
//  WeChatFeaturedArticleModel.swift
//  LifeTreasure
//
//  Created by andson-zhw on 17/3/16.
//  Copyright © 2017年 zhw. All rights reserved.
//

import UIKit


class WeChatFeaturedArticleModel: BaseModel {
    //内容图片
    var contentImg:String?
    // 时间
    var ct:String?
    // 日期
    var date:String?
    
    var articleId:String?
    
    var like_num:NSNumber?
    
    var read_num:NSNumber?
    
    var title:String?
    
    var typeId:NSNumber?
    
    var typeName:String?
    
    var url:String?
    
    var userLogo_code:String?
    
    var userName:String?
    
    var weixinNum:String?
    
    
    //重建映射关系
    override func attributesDic(dic: [String : AnyObject]) -> [String : String] {
        var newHandleDic = super.attributesDic(dic: dic)
        newHandleDic["articleId"] = "id"
        return newHandleDic
    }
    
}
