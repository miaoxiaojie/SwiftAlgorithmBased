//
//  DetailedViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/10.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class DetailedViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate
{
    var tableView: UITableView!
    //数据源
    var listDict:[String : AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_drawTableView();
        
    }
    
    // MARK: - 私有方法
    func p_drawTableView() {
        
        let mainSize = UIScreen.main.bounds
        self.tableView = UITableView(frame: CGRect(x: 0, y: 88, width: mainSize.width, height: mainSize.height), style: .plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.isScrollEnabled = false
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 60
        self.view.addSubview(tableView)
        
    }
    
    // MARK: - 公有方法
    func setUpData( data: [String : AnyObject]) -> Void {
        
        self.listDict = data
        self.tableView?.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let answer = self.listDict["answer"] as! String
        let problem = self.listDict["problem"] as! NSArray
        let problemDic:[String : String] = problem[indexPath.row] as! [String : String]
        
        let answerProtocol = AlgorithmBasedFactory.init().getJumpViewController(className: answer)
        let aSelector = NSSelectorFromString(problemDic["selName"]!)
        let obj = answerProtocol.getViewController()
        if obj.responds(to: aSelector) {
            obj.perform(aSelector)
        }
//        self.navigationController?.pushViewController(answerProtocol.getViewController(), animated: true)
        
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let problem = self.listDict["problem"]
        return  problem!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = NSStringFromClass(self.classForCoder)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.accessoryType = .disclosureIndicator
        let problem = self.listDict["problem"] as! NSArray
        let problemDic:[String : String] = problem[indexPath.row] as! [String : String]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.text = (problemDic["title"])
        return cell!
    }
    
    
}

