//
//  SecondViewController.swift
//  物理实验
//
//  Created by xiaomo on 16/6/30.
//  Copyright © 2016年 xiaomo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var viewTop: UILabel!
    @IBOutlet weak var viewResult: UITextView!
    var flag:Bool=true
    var data_temp:[Double]=[]
    
    func aveex(data:[Double],cou:Int)->Double{
        var result:Double=0,ave_t:Double=0
        var j:Int=0
        while j<cou {
            ave_t=ave_t+data[j]
            j=j+1
        }
        ave_t=ave_t/Double(cou)
        ave_n=ave_t
        j=0
        while j<cou {
            result=result+(data[j]-ave_t)*(data[j]-ave_t)
            j=j+1
        }
        
        result=result/Double(cou-1)
        result=sqrt(result)
        return result
        
    }

    @IBAction func btnGo(sender: AnyObject) {
        var k:Int=0,j:Int = 0
        if(!v1equipped){
            self.view.makeToast("未进行均值计算", duration: 1.0, position: .Center)
            return;
        }
        //first time
        while j<data_num {
            if(abs(data_ave[j]-ave_n)>3*ave_exp_2){
                viewResult.text=viewResult.text+String(data_ave[j])+", "
                flag=false
            }else{
                data_temp.append(data_ave[j])
                k=k+1
            }
            j=j+1
        }
        if(k==data_num&&flag==true){
                viewResult.text=viewResult.text+"无坏值"
                return
        }
        //sevond time
        flag=true
        var result:Double=0
        var jc:Int=2
        while(jc<4){
            result=aveex(data_temp, cou: k)
            var t:Int=0
            j=0
            while j<k {
                if(abs(data_temp[j]-ave_n)>3*result){
                    viewResult.text=viewResult.text+"\n第\(jc)次: \(data_ave[j]), "
                    flag=false
                        
                }else{
                    data_temp[t]=data_temp[j];
                    t=t+1;
                }
                    j=j+1
               
                if t==k&&flag==true {
                    viewResult.text=viewResult.text+"\n第\(jc)次检查无坏值"
                    ave_exps=result
                    v1equipped=false
                    return
                }
                k=t
                j=j+1
            }
            flag=true
            jc=jc+1
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewTop.text="计算平均后在本页点击按钮~\n使用>S(x)判断"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

