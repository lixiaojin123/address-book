//
//  find.swift
//  address book
//
//  Created by 李晓晋 on 16/7/8.
//  Copyright © 2016年 李晓晋. All rights reserved.
//

import UIKit
class find:UIViewController {
    @IBOutlet weak var ww: UITextView!
    
    var db:SQLiteDB!
    
    @IBOutlet weak var tt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }

    @IBAction func find(sender: AnyObject) {
        find()
    }

    
    func find(){
        let s=tt.text!
        let data = db.query("select * from user where uname='\(s)'")
        for(var i=0;i<data.count;i++)
        {
            //获取最后一行数据显示
            let u = data[i]
            ww.text! += " phone: "+String(u["mobile"]!)+"\n"+" address: "+String(u["address"]!)+"\n"+" email: "+String(u["email"]!)+"\n"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

     }
}