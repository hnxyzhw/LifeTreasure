//
//  ViewController.swift
//  LifeTreasure
//
//  Created by andson-zhw on 17/3/10.
//  Copyright © 2017年 zhw. All rights reserved.
//

import UIKit
import SwiftyJSON

let identifier = "cellIdentifier"


class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITableViewDataSourcePrefetching{
    lazy var tableview: UITableView = {
        let tempTableView = UITableView(frame: CGRect(x: 0,y: 20, width: self.view.bounds.size.width, height:
            self.view.bounds.size.height), style: UITableViewStyle.plain)
        tempTableView.register(TableViewCell.self, forCellReuseIdentifier:identifier)
        tempTableView.delegate = self
        tempTableView.dataSource = self
        tempTableView.prefetchDataSource = self
        return tempTableView
    }()
    lazy var rowArray: Array<Int> = {
        let array = [1,2,3,4,5,6,7,8,9,10,11]
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableview)
        
        self.loadData()
    }
    
    func loadData() {

        //https://route.showapi.com/582-2?key=&needContent=1&page=&showapi_appid=32921&showapi_timestamp=&typeId=2&showapi_sign=cc5b4721bb394890b2cd75128b1189f4
        let url:String = "https://route.showapi.com/582-2"
        
        let parameters: Dictionary = ["key":"", "needConten":"1", "page":"", "showapi_appid":"32917", "showapi_timestamp":"", "typeId":"2", "showapi_sign":NSString.md5(forUpper32Bate: "needContent1showapi_appid32917typeId2cc5b4721bb394890b2cd75128b1189f4")]
        
        RequestServerFactory.sharedInstance.getRequest(urlString: url, params: parameters, success: { (json)-> Void in
//            if (JSONSerialization.isValidJSONObject(json)){
//                let data = try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
//                let resultDic: NSDictionary =  NSKeyedUnarchiver.unarchiveObject(with: data!) as! NSDictionary
//                print(resultDic)
//            }
            print(json)
            
        }, failure:{(error) -> Void in
            print(error)
        })
        
//        RequestServerFactory.sharedInstance.getRequest(urlString: "http://op.juhe.cn/onebox/weather/query", params: ["cityname":"杭州","key":"f6418f1f819c801a60ea7880ca844587"], success: {(json) -> Void in
//            
//            print(json)
//            
//        }, failure: {(error) -> Void in
//            print(error)
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// MARK: UITableviewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rowArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:TableViewCell = tableview.dequeueReusableCell(withIdentifier: identifier) as! TableViewCell
        if cell.isEqual(nil) {
            cell = TableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        //cell?.textLabel?.text = "\(self.rowArray[indexPath.row])"
        //cell.titleLab?.text = "row\(self.rowArray[indexPath.row])"
        let data = "row\(self.rowArray[indexPath.row])"
        
        cell.setData(cellData: data as AnyObject)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "titleForeHeaderInSection"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "titleForFooterInSection"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["a", "b", "c"]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if title == "a" {
            print("点击a定位到第一个section")
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //print("移动cell，对数据远进行处理")
    }
    
    
    /// MARK: UITableviewDataSorucePrefetching
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
         //print("这个协议方法提供一个数组，这个数组提示了按着本次滑动方向，再接下去要碰到哪些indexPaths了，以UITableView为例，回调过来的这个数组为当前屏幕边缘的indexPath的接下去（上或者下）第10个开始算的indexPath，大概一次5个这样。")
    }
    
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        //print("这个协议返回的数组用于在，当我们快速滑动到某个区域后又立刻按着反方向滑动，那么原本被预估要出现的几个indexPath会被取消掉这样，这个数组就是存储被取消预估的indexPath。")
    }
    
    ///mark UITableviewDelegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //print("即将展示cell")
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //print("即将展示header")
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        //print("即将暂时footer")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //print("已经结束展示cell")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        //print("已经结束展示header")
    }
    
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        //print("已经结束展示footer")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}

