//
//  GCMarqueeModel.m
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/8/1.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import "GCMarqueeModel.h"

static CGFloat titleFont = 12.0f;
static CGFloat padding = 18.0f;
static CGFloat icon_title_margin = 10.0f;
static CGFloat itemHeight = 28.0f;
static CGFloat icon_width = 20.0f;

@implementation GCMarqueeModel

- (void)setTitle:(NSString *)title {
    _title = title;
    CGFloat titleWidth = [_title boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:titleFont]} context:nil].size.width;
    _itemWidth = padding * 2 + icon_title_margin + titleWidth + icon_width;
    _itemHeight = itemHeight;
}

@end
