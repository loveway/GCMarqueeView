//
//  GCMarqueeItem.m
//  GCMarqueeView
//
//  Created by HenryCheng on 2019/8/1.
//  Copyright © 2019 HenryCheng. All rights reserved.
//

#import "GCMarqueeItem.h"
#import "GCMarqueeModel.h"

@interface GCMarqueeItem()

@property (nonatomic, strong) GCMarqueeModel *model;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UILabel *titleLabel;

@end

static CGFloat titleFont = 12.0f;
static CGFloat padding = 18.0f;
static CGFloat icon_title_margin = 10.0f;
static CGFloat icon_width = 20.0f;
static CGFloat icon_height = 18.0f;

@implementation GCMarqueeItem

- (instancetype)initWithFrame:(CGRect)frame model:(GCMarqueeModel *)model {
    if (self == [super initWithFrame:frame]) {
        _model = model;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = model.itemHeight / 2;
        self.backgroundColor = [UIColor orangeColor];
        [self initUI];
    }
    return self;
}

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

- (void)layoutSubviews {
    [super layoutSubviews];
    _imageV.frame = CGRectMake(padding, (_model.itemHeight - icon_height) / 2, icon_width, icon_height);
    _titleLabel.frame = CGRectMake(padding + icon_width + icon_title_margin, (_model.itemHeight - 15) / 2, _model.itemWidth - padding * 2 - icon_width - icon_title_margin, 15);
}

- (void)tap {
    if (_block) {
        _block(_model);
    }
}

@end
