
GCMarqueeView is a marquee view templete, you can use it in your project. Now, there is two version both objective-c and Swift.

## Overview

<p align='center'>
<img src='https://github.com/loveway/GCMarqueeView/blob/master/GCMarqueeviewDemo.gif?raw=true'>
</p>

## Requirements
Xcode 10.2+

## Installation
* Clone the repo with git clone command.
* Open GCMarqueeViewDemo_Swift.xcodeproj or GCMarqueeViewDemo.xcodeproj with Xcode in core folder and run.

## Usage
1. Here is two version, you can choose the version you need.
2. if you need modify it you can custom `GCMarqueeItem.m` and `GCMarqueeView.m` file.
Swift
```swift
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

```
objective-c
```objc
- (void)initUI {
    
    _imageV = [UIImageView new];
    _imageV.image = [UIImage imageNamed:@"flag_icon"];
    [self addSubview:_imageV];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:titleFont];
    _titleLabel.text = _model.title;
    [_titleLabel sizeToFit];
    [self addSubview:_titleLabel];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tapGesture];
}

```
if you have some question, please push issue or emil clearloveway@gmail.com
