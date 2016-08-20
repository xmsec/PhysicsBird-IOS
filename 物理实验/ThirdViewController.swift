//
//  ThirdViewController.swift
//  物理实验
//
//  Created by xiaomo on 16/7/24.
//  Copyright © 2016年 xiaomo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textDelta: UITextField!
    @IBOutlet weak var btnOK: UIButton!
    @IBAction func btnOK(sender: AnyObject) {
        var t:Double?,ua:Double=ave_exps,ub:Double,ux:Double,ex:Double
        if textDelta.text == nil || textDelta.text == ""{
            self.view.makeToast("输入数据错误", duration: 1.0, position: .Center)
            return
        }
        t=Double(textDelta.text!)
        if t==nil{
            self.view.makeToast("输入数据错误", duration: 1.0, position: .Center)
        }
        ub=t!/sqrt(3)
        ux=sqrt(ua*ua+ub*ub)
        ex=ux/ave_n
        textView.text="进行均值计算后，输入仪器误差，点击OK。仪器误差请输入Δm，程序自动除以根号3\n结果～（只限于直接不确定度）\n\nu(x)=\(ux)\nE(x)=\(ex)\n请自行保留适当位数"
        textDelta.resignFirstResponder()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textDelta.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
        textView.text="进行均值计算后，输入仪器误差，点击OK。仪器误差请输入Δm，程序自动除以根号3\n结果～（只限于直接不确定度）"
        textDelta.borderStyle=UITextBorderStyle.RoundedRect
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        textDelta.resignFirstResponder()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
