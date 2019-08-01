//
//  GCMarqueeItem.h
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/8/1.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GCMarqueeModel;
typedef void(^GCMarqueeItemTapBlock)(GCMarqueeModel *model);

@interface GCMarqueeItem : UIView

@property (nonatomic, copy) GCMarqueeItemTapBlock block;

- (instancetype)initWithFrame:(CGRect)frame model:(GCMarqueeModel *)model;

@end

NS_ASSUME_NONNULL_END
