//
//  ViewController.swift
//  BaoFengLBSStudy
//
//  Created by caiqiujun on 16/2/29.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, AddressDelegate{
    var startPoint:UITextField!
    var endPoint:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildHeaderContainer()
        
        
    }
    
    /**
     * 设置阴影效果
     */
    func buildHeaderContainer() {
        let viewHeight = ScreenWidth * 0.35
        NSLog("%f", viewHeight)
        let view = UIView.init(frame: CGRectMake(0, NavigationH, ScreenWidth, viewHeight))
        view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(view)
        // 设置阴影效果
        view.layer.shadowColor = UIColor.init(white: 0.8, alpha: 1).CGColor
        view.layer.shadowOffset = CGSizeMake(0, 2)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 1
        
        // 绘制两条分割线
        let lineView1 = UIView.init(frame: CGRectMake(ScreenWidth * 0.1, viewHeight / 3, ScreenWidth * 0.8, 1))
        lineView1.backgroundColor = UIColor.init(white: 0.92, alpha: 1)
        view.addSubview(lineView1)
        
        let lineView2 = UIView.init(frame: CGRectMake(0, viewHeight / 3 * 2, ScreenWidth, 1))
        lineView2.backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        view.addSubview(lineView2)
        
        
        // 创建起始位置和终点位置的UITextField
        let fieldHeight = viewHeight / 6
        startPoint = UITextField.init(frame: CGRectMake(ScreenWidth * 0.1, fieldHeight / 2, ScreenWidth * 0.8, fieldHeight))
        startPoint.font = UIFont.systemFontOfSize(13)
        startPoint.delegate = self
        startPoint.tag = 0
        startPoint.placeholder = "起始位置"
        view.addSubview(startPoint)
        
        
        endPoint = UITextField.init(frame: CGRectMake(ScreenWidth * 0.1, fieldHeight * 2.5, ScreenWidth * 0.8, fieldHeight))
        endPoint.font = UIFont.systemFontOfSize(13)
        endPoint.delegate = self
        endPoint.tag = 1
        endPoint.placeholder = "终点位置"
        view.addSubview(endPoint)
        
        
        // 交通方式按钮
        var button : UIButton?
        let names = ["公交", "自驾", "步行"]
        for var index = 0; index < 3; ++index {
            button = UIButton.init(type: UIButtonType.System)
            button!.frame = CGRectMake(ScreenWidth / 3 * CGFloat(index), fieldHeight * 4.5, ScreenWidth / 3, fieldHeight)
            button?.tag = index
            button?.setTitle(names[index], forState: UIControlState.Normal)
            button?.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            button?.addTarget(self, action: "lbsNavigation", forControlEvents: UIControlEvents.TouchUpInside)
            button?.titleLabel?.font = UIFont.systemFontOfSize(14)
            view.addSubview(button!)
        }
        
    }
    
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        let vc = SearchViewController.init()
        if textField.tag == 0 {
            vc.pointType = PointType.StartType
        } else {
            vc.pointType = PointType.EndType
        }
        vc.delegate = self

        navigationController?.pushViewController(vc, animated: true)
        
        textField.resignFirstResponder()
    }
    
    func selectAdress(pointType pointType: PointType, tip: AMapTip) {
        if pointType == PointType.StartType {
            startPoint.text = tip.name
        } else {
            endPoint.text = tip.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

