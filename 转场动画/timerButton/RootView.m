//
//  RootView.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/14.
//

#import "RootView.h"
#import "RedView.h"

@interface RootView ()

@property (nonatomic, strong) RedView *redView;

@end


@implementation RootView

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    NSLog(@"RootView init");
    // 模板类,
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];

        self.redView = [[RedView alloc] initWithFrame:frame];
        [self addSubview:self.redView];
        self.redView.hidden = YES;

    }
    NSLog(@"RootView initWithFrame");
    return self;
}

- (void)tapAction:(UIGestureRecognizer *)tap {
    NSLog(@"RootView tapAction: ----- %@",tap);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *targetView = [super hitTest:point withEvent:event];
    NSLog(@"hitTest : %@",targetView);
    if (targetView == self) {
        return self.redView;
    }
    return targetView;
}



@end
