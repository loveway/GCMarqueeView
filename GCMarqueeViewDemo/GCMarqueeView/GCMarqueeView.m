//
//  GCMarqueeView.m
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/7/31.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import "GCMarqueeView.h"
#import "GCMarqueeItem.h"
#import "GCMarqueeModel.h"

@interface GCMarqueeView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) GCMarqueeDirectionType type;
@property (nonatomic, assign) BOOL isReverse;

@end

static CGFloat const margin = 10.0f;
static NSInteger const framesPerSecond = 30;
static CGFloat const pointsPerFrame = 1;

@implementation GCMarqueeView

- (void)dealloc {
    [self stopRunning];
}

- (instancetype)initWithFrame:(CGRect)frame type:(GCMarqueeDirectionType)type {
    if (self == [super initWithFrame:frame]) {
        _type = type;
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.backgroundColor = [UIColor clearColor];
    self.scrollView = ({
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        scrollView.scrollEnabled = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView;
    });
    [self addSubview:_scrollView];
}

- (void)setItems:(NSArray<GCMarqueeModel *> *)items {
    _items = items;
    
    [_scrollView.layer removeAllAnimations];
    for (UIView *view in _scrollView.subviews) {
        if ([view isKindOfClass:[GCMarqueeItem class]]) {
            [view removeFromSuperview];
        }
    }
    
    GCMarqueeItem *tmpItem = nil;
    for (int i = 0; i < items.count; i++) {
        CGRect frame;
        if (_type == GCMarqueeDirectionTypeLTR || _type == GCMarqueeDirectionTypeRTL || _type == GCMarqueeDirectionTypeReverse) {
            frame = CGRectMake(tmpItem.frame.origin.x + tmpItem.frame.size.width + margin, 0, items[i].itemWidth, items[i].itemHeight);
        } else if (_type == GCMarqueeDirectionTypeBTT || _type == GCMarqueeDirectionTypeTTB) {
            frame = CGRectMake(0, tmpItem.frame.origin.y + tmpItem.frame.size.height + margin, items[i].itemWidth, items[i].itemHeight);
        } else {
            frame = CGRectZero;
        }
        GCMarqueeItem *item = [[GCMarqueeItem alloc] initWithFrame:frame model:items[i]];
        [item setBlock:^(GCMarqueeModel * _Nonnull model) {
            NSLog(@"%@", model.title);
        }];
        [self.scrollView addSubview:item];
        tmpItem = item;
    }
    if (_type == GCMarqueeDirectionTypeLTR ||
        _type == GCMarqueeDirectionTypeRTL ||
        _type == GCMarqueeDirectionTypeReverse) {
        
        _scrollView.contentSize = CGSizeMake(tmpItem.frame.origin.x + tmpItem.frame.size.width, 0);
    } else if (_type == GCMarqueeDirectionTypeBTT ||
               _type == GCMarqueeDirectionTypeTTB) {
        
        _scrollView.contentSize = CGSizeMake(0, tmpItem.frame.origin.y + tmpItem.frame.size.height);
    }
    if (_type == GCMarqueeDirectionTypeLTR) {
        _scrollView.frame = CGRectMake(-_scrollView.contentSize.width, 0, _scrollView.contentSize.width, tmpItem.bounds.size.height);

    } else if (_type == GCMarqueeDirectionTypeRTL || _type == GCMarqueeDirectionTypeReverse) {
        _scrollView.frame = CGRectMake(self.bounds.size.width, 0, self.bounds.size.width + _scrollView.contentSize.width, tmpItem.bounds.size.height);

    } else if (_type == GCMarqueeDirectionTypeTTB) {
        _scrollView.frame = CGRectMake(0, -_scrollView.contentSize.height, self.bounds.size.width, _scrollView.contentSize.height);
    } else if (_type == GCMarqueeDirectionTypeBTT) {
        _scrollView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, _scrollView.contentSize.height);
    }
    [self startRunning];
}

- (void)startRunning {
    [self stopRunning];
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(marqueeRunning)];
    _displayLink.preferredFramesPerSecond = framesPerSecond;
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stopRunning {
    [_displayLink invalidate];
    _displayLink = nil;
}

- (void)marqueeRunning {
    CGFloat self_width = self.bounds.size.width;
    CGRect rect = _scrollView.frame;
    if (_type == GCMarqueeDirectionTypeRTL) {
        rect.origin.x -= pointsPerFrame;
        if (rect.origin.x <= -_scrollView.contentSize.width) {
            rect.origin.x = self_width;
        }
    } else if (_type == GCMarqueeDirectionTypeLTR) {
        rect.origin.x += pointsPerFrame;
        if (rect.origin.x >= self_width) {
            rect.origin.x = -_scrollView.contentSize.width;
        }
    } else if (_type == GCMarqueeDirectionTypeTTB) {
        rect.origin.y += pointsPerFrame;
        if (rect.origin.y >= self_width) {
            rect.origin.y = -_scrollView.contentSize.height;
        }
    } else if (_type == GCMarqueeDirectionTypeBTT) {
        rect.origin.y -= pointsPerFrame;
        if (rect.origin.y <= -_scrollView.contentSize.height) {
            rect.origin.y = self_width;
        }
    } else if (_type == GCMarqueeDirectionTypeReverse) {
        if (_isReverse) {
            rect.origin.x += pointsPerFrame;
            if (rect.origin.x >= 0) {
                _isReverse = YES;
            }
        } else {
            rect.origin.x -= pointsPerFrame;
            if (rect.origin.x <= self_width -_scrollView.contentSize.width) {
                _isReverse = YES;
            }
        }
    }
    _scrollView.frame = rect;
}

@end
