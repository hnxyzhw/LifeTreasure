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
    // 文章id
    var articleId:String?
    //喜欢数
    var like_num:NSNumber?
    // 阅读数
    var read_num:NSNumber?
    // 标题
    var title:String?
    // 文章类型id
    var typeId:NSNumber?
    // 文章类型名
    var typeName:String?
    // 连接
    var url:String?
    // 用户头像
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
