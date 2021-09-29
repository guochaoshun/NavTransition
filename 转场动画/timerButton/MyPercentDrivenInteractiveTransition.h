//
//  MyPercentDrivenInteractiveTransition.h
//  timerButton
//
//  Created by 郭朝顺 on 2021/9/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPercentDrivenInteractiveTransition : UIPercentDrivenInteractiveTransition


// 是否是手势触发的, YES:手势触发; NO,点返回键
@property (nonatomic, assign) BOOL isPan;


@end

NS_ASSUME_NONNULL_END
