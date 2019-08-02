//
//  ViewController.swift
//  GCMarqueeViewDemo_Swift
//
//  Created by HenryCheng on 2019/8/2.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataArray = ["①这是第一个",
                         "②这是第二个第二个",
                         "③这是第三个这是第三个",
                         "④四",
                         "⑤第五个"
        ]
        var items: [GCMarqueeModel] = []
        
        for str in dataArray {
            let model = GCMarqueeModel(title: str)
            items.append(model)
        }

        let marqueeWidth: CGFloat = 250.0
        let lead = (self.view.frame.size.width - marqueeWidth) / 2
        
        
        let view1 = GCMarqueeView(frame: CGRect(x: lead, y: 200, width: marqueeWidth, height: 28), type: .ltr);
        view1.backgroundColor = .red
        view1.items = items
        view.addSubview(view1)
        
        let view2 = GCMarqueeView(frame: CGRect(x: lead, y: 300, width: marqueeWidth, height: 28), type: .ttb);
        view2.backgroundColor = .green
        view2.items = items
        view.addSubview(view2)
        
        let view3 = GCMarqueeView(frame: CGRect(x: lead, y: 400, width: marqueeWidth, height: 28), type: .rtl);
        view3.backgroundColor = .purple
        view3.items = items
        view.addSubview(view3)
        
        let view4 = GCMarqueeView(frame: CGRect(x: lead, y: 500, width: marqueeWidth, height: 28), type: .btt);
        view4.backgroundColor = .blue
        view4.items = items
        view.addSubview(view4)
        
        let view5 = GCMarqueeView(frame: CGRect(x: lead, y: 600, width: marqueeWidth, height: 28), type: .reverse);
        view5.backgroundColor = .cyan
        view5.items = items
        view.addSubview(view5)

    }


}

