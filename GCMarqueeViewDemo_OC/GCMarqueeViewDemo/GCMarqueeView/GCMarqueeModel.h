//
//  GCMarqueeModel.h
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/8/1.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCMarqueeModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign, readonly) CGFloat itemWidth;
@property (nonatomic, assign, readonly) CGFloat itemHeight;

@end
NS_ASSUME_NONNULL_END
