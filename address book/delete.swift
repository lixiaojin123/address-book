//
//  delete.swift
//  address book
//
//  Created by 李晓晋 on 16/7/5.
//  Copyright © 2016年 李晓晋. All rights reserved.
//

import UIKit

class delete: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var xx: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
    }
    
    
    
    
  
    
    
    @IBAction func remove(sender: AnyObject) {
       del()
    }
    func del(){
        let a=xx.text!
        let sql = "delete from user where uname='\(a)'"
        let result = db.execute(sql)
        print(result)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


