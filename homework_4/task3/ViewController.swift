//
//  ViewController.swift
//  实验43
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 lyn. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    var btn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 160, y: 250, width: 200, height: 44))
        label.text = "Hello World"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        self.view.addSubview(label)
        
        btn = UIButton(frame: CGRect(x: 160, y: 400, width: 100, height: 37))
        btn.setTitle("Click me!", for: .normal)
        btn.backgroundColor = UIColor.darkGray
        btn.setTitleColor(UIColor.black, for: .highlighted)
        self.view.addSubview(btn)
        btn.addTarget(self, action: #selector(cilcked), for: .touchUpInside)
    }
    
    @IBAction func cilcked() {
        if label.text! == "I'm clicked." {
            label.text = "Hello World"
            btn.setTitle("Click me!", for: .normal)
        } else {
            label.text = "I'm clicked."
            btn.setTitle("hello", for: .normal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
