//
//  FirstViewController.swift
//  物理实验
//
//  Created by xiaomo on 16/6/30.
//  Copyright © 2016年 xiaomo. All rights reserved.
//

import UIKit


var data_ave:[Double]=[]
var ave_exp_2:Double=0,ave_exps:Double=0,ave_n:Double=0
var v1equipped:Bool=false
var data_num:Int = -1
class FirstViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var btnCal: UIButton!
    var i=0
    
    @IBOutlet weak var detailedData: UITextField!
    @IBOutlet weak var numberOfData: UITextField!
    @IBOutlet weak var viewData: UITextView!
    @IBAction func buttonNext(sender: AnyObject) {
             
        if((numberOfData.text) == nil || numberOfData.text == "")
        {
            self.view.makeToast("未输入数据个数", duration: 1.0, position: .Center)
            return
        }
        if (data_num == -1)
        {
            let t:Int?=Int(numberOfData.text!)
            if(t == nil){
                self.view.makeToast("输入数据个数错误", duration: 1.0, position: .Center)
                return
            }else if(t!<=0)
            {
                self.view.makeToast("输入数据个数错误", duration: 1.0, position: .Center)
                return
            }else{
                data_num=t!
            }
            
        }
        if ((detailedData.text) == nil || (detailedData.text) == ""){
            self.view.makeToast("数据不能为空", duration: 1.0, position: .Center)
            return
        }else{
            let data_t:Double?=Double(detailedData.text!)
            if(data_t == nil){
                self.view.makeToast("数据输入错误", duration: 1.0, position: .Center)
                return
            }
            if(i<data_num)
            {
                viewData.text=viewData.text+detailedData.text!+", "
                //data_ave[i]=data_t!
                data_ave.append(data_t!)
                detailedData.text=""
                i=i+1;
                
            }else{
                self.view.makeToast("超出数据个数", duration: 1.0, position: .Center)
                return
            }
            if(i==data_num){
                v1equipped=true
                btnCal.enabled=true
                
                detailedData.resignFirstResponder()
            }
        }

    }
    
    @IBAction func buttonReset(sender: AnyObject) {
        i=0
        data_num = -1
        numberOfData.text=""
        btnCal.enabled=false
        viewData.text="数据："
    }
    @IBAction func buttonCal(sender: AnyObject) {
       // self.view.makeToast("This is a piece of toast", duration: 1.0, position: .Center)
        var ave:Double,aveexp:Double,aveexp_s:Double
        ave=cal_ave()
        //self.view.makeToast("\(ave)", duration: 1.0, position: .Center)

        aveexp=cal_exp_ave()
        aveexp_s=aveexp/sqrt(Double( data_num))
        viewData.text=viewData.text+"\n"+"平均数=\(ave)\n"+"实验标准差=\(aveexp)\n"+"平均值的实验标准差=\(aveexp_s)"
        /*
         *此处暂未提供二三页功能所需要数据，需后续补充
        */
        ave_exp_2=aveexp
        ave_exps=aveexp_s
        
        ave_n=ave
        
        btnCal.enabled=false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailedData.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
        numberOfData.borderStyle=UITextBorderStyle.RoundedRect
        detailedData.borderStyle=UITextBorderStyle.RoundedRect
    }
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        detailedData.resignFirstResponder()
        
        return true
    }
  //  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
 //       detailedData.resignFirstResponder()
  //  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func  cal_ave()->Double{
        var result:Double = 0
        for item in data_ave {
            result=result+item
        }
        result=result/Double(data_num)
        return result
    }
    func cal_exp_ave()->Double{
        var result:Double=0,ave=cal_ave()
        
        for item in data_ave {
            result=result+(item-ave)*(item-ave)
        }
        result=result/Double(data_num-1)
        result=sqrt(result)
        return result
    }
  
    }
    



