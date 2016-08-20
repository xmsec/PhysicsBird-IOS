//
//  About.swift
//  物理实验
//
//  Created by xiaomo on 16/8/7.
//  Copyright © 2016年 xiaomo. All rights reserved.
//

import UIKit
import SafariServices
class AboutViewController: UIViewController ,SFSafariViewControllerDelegate{
    @IBOutlet weak var text: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       text.text="物理实燕APP是由兴趣而开发，方便物理实验的简单易用的APP。\n功能主要包括：实验平均值计算、坏值剔除、直接不确定度计算、线性回归拟合。帮助文档请点击使用说明\n本应用在于方便学习，公式还是要会怎么用哦~\n欢迎交流 Email:donghao@bjtu.edu.cn 或点击使用说明进入博客"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func instrBtn(sender: AnyObject) {
      
        let safariController =  SFSafariViewController(URL: NSURL(string: "http://xmsec.github.io/blog/2016/02/04/Physics-Bird/")!,entersReaderIfAvailable: true)
        safariController.delegate = self;
        presentViewController(safariController, animated: true, completion: nil)
    }
    
    
      
    
}
