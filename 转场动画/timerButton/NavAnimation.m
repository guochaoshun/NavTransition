//
//  NavAnimation.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/23.
//

#import "NavAnimation.h"

/** 设备屏幕宽 */
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
/** 设备屏幕高 */
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation NavAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.5*2;
}


- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {

    UIView *containerView = transitionContext.containerView;

    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    // 就是fromViewController.view
    UIView * fromeView = fromViewController.view;// [transitionContext viewForKey:UITransitionContextFromViewKey];
    // 就是toViewController.view
    UIView * toView = toViewController.view;// [transitionContext viewForKey:UITransitionContextToViewKey];

    // 默认情况下containerView只有fromeView, 没有toView,需要手动加一次
    [containerView addSubview:toView];

    NSLog(@"isInteractive : %d", transitionContext.isInteractive);

    NSTimeInterval time = [self transitionDuration:transitionContext];
    if (self.operation == UINavigationControllerOperationPush) {
        NSLog(@"push 动画");

        fromeView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);

        toView.frame = CGRectMake(0, -ScreenHeight, ScreenWidth, ScreenHeight);

        [UIView animateWithDuration:time animations:^{

            fromeView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);
            toView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        }completion:^(BOOL finished) {
            //如果加入了手势交互转场，就需要根据手势交互动作是否完成/取消来做操作，完成标记YES，取消标记NO，必须标记，否则系统认为还处于动画过程中，会出现无法交互之类的bug
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if ([transitionContext transitionWasCancelled]) {
                //如果取消转场
            }else{
                //完成转场
            }
//            [fromeView removeFromSuperview];
        }];

    } else if (self.operation == UINavigationControllerOperationPop) {
        NSLog(@"pop 动画");

        fromeView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        toView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight);

        [UIView animateWithDuration:time animations:^{

            fromeView.frame = CGRectMake(0, -ScreenHeight, ScreenWidth, ScreenHeight);
            toView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        }completion:^(BOOL finished) {
            //如果加入了手势交互转场，就需要根据手势交互动作是否完成/取消来做操作，完成标记YES，取消标记NO，必须标记，否则系统认为还处于动画过程中，会出现无法交互之类的bug
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if ([transitionContext transitionWasCancelled]) {
                //如果取消转场
            }else{
                //完成转场
//                [fromeView removeFromSuperview];
            }

        }];
    }


}



@end
