//
//  ViewController.m
//  GCMarqueeViewDemo
//
//  Created by HenryCheng on 2019/8/1.
//  Copyright © 2019 igancao. All rights reserved.
//

#import "ViewController.h"
#import "GCMarqueeView.h"
#import "GCMarqueeModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *dataArray =@[@"①这是第一个",
                          @"②这是第二个第二个",
                          @"③这是第三个这是第三个",
                          @"④四",
                          @"⑤第五个"
                          ];
    NSMutableArray *items = @[].mutableCopy;
    for (NSString *str in dataArray) {
        GCMarqueeModel *model = [[GCMarqueeModel alloc] init];
        model.title = str;
        [items addObject:model];
    }
    
    CGFloat marqueeWidth = 250.0f;
    CGFloat lead = (self.view.frame.size.width - marqueeWidth) / 2;

    
    GCMarqueeView *view = [[GCMarqueeView alloc] initWithFrame:CGRectMake(lead, 200, marqueeWidth, 28) type:GCMarqueeDirectionTypeLTR];
    view.backgroundColor = [UIColor redColor];
    view.items = items;
    [self.view addSubview:view];
    
    GCMarqueeView *view2 = [[GCMarqueeView alloc] initWithFrame:CGRectMake(lead, 300, marqueeWidth, 28) type:GCMarqueeDirectionTypeTTB];
    view2.backgroundColor = [UIColor greenColor];
    view2.items = items;
    [self.view addSubview:view2];
    
    GCMarqueeView *view3 = [[GCMarqueeView alloc] initWithFrame:CGRectMake(lead, 400, marqueeWidth, 28) type:GCMarqueeDirectionTypeRTL];
    view3.backgroundColor = [UIColor purpleColor];
    view3.items = items;
    [self.view addSubview:view3];
    
    GCMarqueeView *view4 = [[GCMarqueeView alloc] initWithFrame:CGRectMake(lead, 500, marqueeWidth, 28) type:GCMarqueeDirectionTypeBTT];
    view4.backgroundColor = [UIColor blueColor];
    view4.items = items;
    [self.view addSubview:view4];
    
    GCMarqueeView *view5 = [[GCMarqueeView alloc] initWithFrame:CGRectMake(lead, 600, marqueeWidth, 28) type:GCMarqueeDirectionTypeReverse];
    view5.backgroundColor = [UIColor cyanColor];
    view5.items = items;
    [self.view addSubview:view5];

}


@end
