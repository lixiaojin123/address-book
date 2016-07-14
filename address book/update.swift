//
//  update.swift
//  address book
//
//  Created by 李晓晋 on 16/7/14.
//  Copyright © 2016年 李晓晋. All rights reserved.
//
import UIKit

class update: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var name: UITextField!
 
    @IBOutlet weak var phone: UITextField!
 
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists user(uid integer primary key,uname varchar(20),mobile varchar(20),email varcher(20),address varcher(20))")
        
    }
    
    @IBAction func sure(sender: AnyObject) {
        sure()
        
            }
    
    func sure()
    {
        let x=name.text!
        let y=phone.text!
        let z=address.text!
        let d=email.text!
        let sql = "update user set mobile='\(y)' where uname='\(x)'"
        let sql1 = "update user set  address='\(z)'  where uname='\(x)'"
        let sql2 = "update user set  email='\(d)' where uname='\(x)'"
        print("sql: \(sql)")
        print("sql1: \(sql1)")
        print("sql2: \(sql2)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        let result1 = db.execute(sql1)
        let result2 = db.execute(sql2)


        print(result)
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
