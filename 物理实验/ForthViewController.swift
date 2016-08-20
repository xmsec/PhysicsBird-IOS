//
//  ForthViewController.swift
//  物理实验
//
//  Created by xiaomo on 16/7/27.
//  Copyright © 2016年 xiaomo. All rights reserved.
//

import UIKit
class ForthViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var textY: UITextField!
    @IBOutlet weak var textX: UITextField!
    @IBOutlet weak var dataFin: UITextView!
    @IBOutlet weak var dataResult: UITextView!
    var nv4:Int=0
    var data:[(Double,Double)]=[]
    @IBAction func buttonNext(sender: AnyObject) {
        if( textX.text == nil || textX.text == "" || textY.text == nil || textY.text == ""){
            self.view.makeToast("数据输入错误", duration: 1.0, position: .Center)
            return

        
        }
        var x:Double?,y:Double?
        x=Double(textX.text!)
        y=Double(textY.text!)
        if x == nil || y == nil {
            self.view.makeToast("数据输入错误", duration: 1.0, position: .Center)
            return

        }
        dataFin.text=dataFin.text+"(\(x!),\(y!)) , "
        data.append((x!,y!))
        nv4=nv4+1
        textX.text=""
        textY.text=""
        
        
        
    }
    @IBAction func buttonCal(sender: AnyObject) {
        var avex:Double=0,avey:Double=0,x2:Double=0,y2:Double=0,xy:Double=0,b,a:Double
        if nv4<1{
            self.view.makeToast("请输入数据", duration: 1.0, position: .Center)
            return
        }
        for item in data {
            avex=item.0+avex
            avey=item.1+avey
            x2=item.0*item.0+x2
            y2=item.1*item.1+y2
            xy=item.0*item.1+xy
            
        }
        avey=avey/Double(nv4)
        avex=avex/Double(nv4)
        x2=x2/Double(nv4)
        y2=y2/Double(nv4)
        xy=xy/Double(nv4)
        
        b=(avex*avey-xy)/(avex*avex-x2)
        a=avey-b*avex
        
        dataResult.text="b=\(b)\na=\(a)"
    }
    @IBAction func buttonReset(sender: AnyObject) {
        dataFin.text="坐标："
        dataResult.text="结果"
        nv4=0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textX.delegate=self
        textY.delegate=self
        
         view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ForthViewController.handleTap(_:))))
        textX.borderStyle=UITextBorderStyle.RoundedRect
        textY.borderStyle=UITextBorderStyle.RoundedRect
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    func handleTap(sender: UITapGestureRecognizer) {
        if sender.state == .Ended {
            //print("收回键盘")
            textX.resignFirstResponder()
            textY.resignFirstResponder()
        }
        sender.cancelsTouchesInView = false
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        textY.resignFirstResponder()
        textX.resignFirstResponder()
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        textX.resignFirstResponder()
        textY.resignFirstResponder()
        return true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}