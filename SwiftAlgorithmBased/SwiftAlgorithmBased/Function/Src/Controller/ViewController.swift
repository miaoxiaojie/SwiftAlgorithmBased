//
//  ViewController.swift
//  SwiftAlgorithmBased
//
//  Created by miao on 2019/10/9.
//  Copyright © 2019 zmm. All rights reserved.
//

import UIKit

class ViewController:
UIViewController,
UITableViewDataSource,
UITableViewDelegate{
    
    var tableView: UITableView!
    
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
        self.view.addSubview(tableView)
        
    }
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    
        let titleStr = (AlgorithmBasedModel.getMainRoad().object(at: indexPath.row) as! String)
        //找到对应的列表
        let listProtocol = AlgorithmBasedCenter.findClassInfoTitle(title: titleStr)
        //对应列表所对应的数据
        let data = listProtocol.getAllData()
        let detailedVc = DetailedViewController()
        detailedVc .setUpData(data:data)
        self.navigationController?.pushViewController(detailedVc, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlgorithmBasedModel.getMainRoad().count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let identifier = NSStringFromClass(self.classForCoder)
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.accessoryType = .disclosureIndicator
        cell?.textLabel?.text = (AlgorithmBasedModel.getMainRoad().object(at: indexPath.row) as! String)
        return cell!
    }


}

