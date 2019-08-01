//
//  GCMarqueeView.h
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/7/31.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GCMarqueeModel;


/**
 Marquee run direction.

 - GCMarqueeDirectionTypeRTL: right -> left
 - GCMarqueeDirectionTypeLTR: left -> right
 - GCMarqueeDirectionTypeTTB: top -> bottom
 - GCMarqueeDirectionTypeBTT: bottom -> top
 - GCMarqueeDirectionTypeReverse: right -> left -> right ...
 */
typedef NS_ENUM(NSUInteger, GCMarqueeDirectionType) {

    GCMarqueeDirectionTypeRTL,
    GCMarqueeDirectionTypeLTR,
    GCMarqueeDirectionTypeTTB,
    GCMarqueeDirectionTypeBTT,
    GCMarqueeDirectionTypeReverse
};

@interface GCMarqueeView : UIView

@property (nonatomic, strong) NSArray <GCMarqueeModel *>*items;

- (instancetype)initWithFrame:(CGRect)frame type:(GCMarqueeDirectionType)type;

@end

NS_ASSUME_NONNULL_END
