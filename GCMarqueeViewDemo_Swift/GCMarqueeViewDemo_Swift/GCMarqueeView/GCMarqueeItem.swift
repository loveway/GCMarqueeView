//
//  GCMarqueeItem.swift
//  GCMarqueeViewDemo_Swift
//
//  Created by HenryCheng on 2019/8/2.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit

class GCMarqueeItem: UIView {
    
    private let titleFont: CGFloat = 12.0;
    private let padding: CGFloat = 18.0;
    private let icon_title_margin: CGFloat = 10.0;
    private let defaultHeight: CGFloat = 28.0;
    private let icon_width: CGFloat = 20.0;
    private let icon_height: CGFloat = 18.0;

    var model: GCMarqueeModel?
    private var imageV: UIImageView?
    private var titleLabel: UILabel?

    init(frame: CGRect, model: GCMarqueeModel) {
        self.model = model
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = model.itemHeight / 2
        self.backgroundColor = .orange
        initUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        imageV!.frame = CGRect(x: padding, y: ((model?.itemHeight ?? defaultHeight) - icon_height) / 2, width: icon_width, height: icon_height);
        titleLabel!.frame = CGRect(x: padding + icon_width + icon_title_margin, y: ((model?.itemHeight ?? defaultHeight) - 15) / 2, width: model?.itemWidth ?? defaultHeight - padding * 2 - icon_width - icon_title_margin, height: 15)
    }
    
    func initUI() {
        imageV = UIImageView()
        imageV!.image = UIImage(named: "flag_icon")
        addSubview(imageV!)
        
        titleLabel = UILabel()
        titleLabel?.font = UIFont.systemFont(ofSize: titleFont)
        titleLabel?.text = model?.title
        addSubview(titleLabel!)
        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(tap))
        addGestureRecognizer(tapGuester)
    }
    
    @objc func tap() {
        
    }
    

}
