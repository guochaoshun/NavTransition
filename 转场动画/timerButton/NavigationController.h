//
//  NavigationController.h
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/20.
//

#import <UIKit/UIKit.h>
#import "MyPercentDrivenInteractiveTransition.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavigationController : UINavigationController

/// 一个坑, 注意这个属性的命名,一定不可以是interactiveTransition
/// 一开始起名叫interactiveTransition, 但是手势拖动时100%会发生crash, 后面发现UINavigationController有一个私有变量叫interactiveTransition,是bool类型, 子类重写导致setTransitionAnimation设置了一个bool值,触发了野指针崩溃
@property (nonatomic, strong) MyPercentDrivenInteractiveTransition *transitionAnimation;

@end

NS_ASSUME_NONNULL_END
