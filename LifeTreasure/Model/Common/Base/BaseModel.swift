//
//  BaseModel.swift
//  LifeTreasure
//
//  Created by andson-zhw on 17/3/16.
//  Copyright © 2017年 zhw. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    //MARK: - 构造方法
    init(dic: [String:AnyObject]) {
        super.init()
    }
    
    
    //MARK: - Runtime获取基本类属性
    func setAttribut(dic: [String:AnyObject]) -> Void{
        
        //获得映射关系
        let attributDic = attributesDic(dic: dic)
        
        var count:UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        
        for i in 0..<count{
            //取出属性名
            let ivar = ivars?[Int(i)]
            let ivarName = ivar_getName(ivar!)
            let nName = String(cString: ivarName!)
            //取出要赋值的值
            var attribut = attributDic[nName]
            if attribut == nil {
                attribut = ""
            }
            var value : NSObject
            if dic[attribut!] != nil {
                value = dic[attribut!] as! NSObject
            }else {
                value = "" as NSObject
            }
            
            //利用KVC给本类的熟悉赋值
            self.setValue(value, forKey: nName)
            
        }
    }
    
    
    //MARK: - 如果属性名与数据字典的key值不对应，那么在子类model中复写此方法，将属性名作为key，字典key值作为value
    func attributesDic(dic: [String:AnyObject]) -> [String:String]{
        var newHandleDic : [String : String] = [:]
        for key in dic.keys{
            //复写时需要注意属性名作为key,数据字典的key作为value
            newHandleDic[key] = key
        }
        return newHandleDic
    }
    
    
}


