//
//  RedView.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/14.
//

#import "RedView.h"

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];

    }
    return self;
}


- (void)tapAction:(UIGestureRecognizer *)tap {
    NSLog(@"RedView tapAction: ----- %@",tap);
}


@end
