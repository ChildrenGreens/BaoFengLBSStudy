//
//  SearchViewController.swift
//  BaoFengLBSStudy
//
//  Created by caiqiujun on 16/3/1.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

import UIKit

protocol AddressDelegate {
    func selectAdress(pointType pointType:PointType, tip:AMapTip)
}


class SearchViewController: UIViewController, AMapSearchDelegate{
    
    internal var pointType:PointType?
    
    
    var searchAPI:AMapSearchAPI?
    
    var tableView:UITableView?
    
    var searchPoints:NSArray?
    
    let search = UISearchBar.init(frame: CGRectZero)
    
    var delegate : AddressDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 设置背景颜色
        view.backgroundColor = UIColor.whiteColor()
        
        
        search.delegate = self
        search.placeholder = "搜索地址"
        search.showsCancelButton = true
        search.searchBarStyle = UISearchBarStyle.Default // 设置样式
        search.translucent = false
        search.showsBookmarkButton = false // 是否显示书按钮
        self.navigationItem.titleView = search

        
        
        
        AMapSearchServices.sharedServices().apiKey = "55e95348c8eebe1a90ce2afcb55067df"
        searchAPI = AMapSearchAPI.init();
        searchAPI!.delegate = self
        // UITableView
        tableView = UITableView.init()
        tableView!.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView?.tableFooterView = UIView.init(frame: CGRectZero)
        view.addSubview(tableView!)
        
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        search.resignFirstResponder()
    }
    
    
    // MARK: AMapSearchDelegate(地图搜索代理)
    func onInputTipsSearchDone(request: AMapInputTipsSearchRequest!, response: AMapInputTipsSearchResponse!) {
        if response.tips.count == 0 {
            return
        }
        searchPoints = response.tips;
        tableView?.reloadData()
        
        
    }
    
    
}



extension SearchViewController: UISearchBarDelegate {
    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        search.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        search.resignFirstResponder()
        navigationController!.popViewControllerAnimated(true)
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let tipsRequest = AMapInputTipsSearchRequest.init()
        tipsRequest.keywords = searchText;
        tipsRequest.city = "常州"
        searchAPI!.AMapInputTipsSearch(tipsRequest)
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        
    }
}


extension SearchViewController:UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let points = searchPoints {
            return points.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cellId = "searchCell"
        var cell = tableView .dequeueReusableCellWithIdentifier(cellId)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellId)
        }
        if let tip:AMapTip = searchPoints?.objectAtIndex(row) as? AMapTip{
            cell?.textLabel?.text = tip.name
            cell?.detailTextLabel?.text = tip.district
        }
        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        search.resignFirstResponder()
        tableView .deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        if let tip:AMapTip = searchPoints?.objectAtIndex(row) as? AMapTip{
            delegate?.selectAdress(pointType: pointType!, tip: tip)
            navigationController!.popViewControllerAnimated(true)
        }
        
        
    }
    
}

