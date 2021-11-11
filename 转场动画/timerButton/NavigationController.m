//
//  NavigationController.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/20.
//

#import "NavigationController.h"
#import "NavAnimation.h"

@interface NavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.delegate = self;
    self.interactivePopGestureRecognizer.enabled = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"willShowViewController %@ %d",viewController,animated);
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"didShowViewController %@ %d",viewController,animated);
}


- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    // 简单判断,不同的页面都可以用,只要设置是拖动返回就可以使用
//    if (self.transitionAnimation.isPan) {
//        return self.transitionAnimation;
//    }
    // 工程中页面多了,部分页面需要严格判断
    if ([animationController isKindOfClass:[NavAnimation class]]) {

        NavAnimation *navAnimation = (NavAnimation *)animationController;
        if (navAnimation.operation == UINavigationControllerOperationPop) {
            if ([navAnimation.fromVC isKindOfClass:NSClassFromString(@"SecondViewController")]) {

                if (self.transitionAnimation.isPan) {
                    return self.transitionAnimation;
                }
            }
        }
    }
    return nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    NSLog(@"fromVC %@ -- toVC %@ --  operation %zd",fromVC,toVC,operation);

    if ([fromVC isKindOfClass:NSClassFromString(@"ViewController")] &&
        [toVC isKindOfClass:NSClassFromString(@"SecondViewController")]) {
        NavAnimation *navAnimation = [[NavAnimation alloc] init];
        navAnimation.operation = operation;
        navAnimation.fromVC = fromVC;
        navAnimation.toVC = toVC;
       return navAnimation;
    }

    if ([fromVC isKindOfClass:NSClassFromString(@"SecondViewController")] &&
        [toVC isKindOfClass:NSClassFromString(@"ViewController")]) {
        NavAnimation *navAnimation = [[NavAnimation alloc] init];
        navAnimation.operation = operation;
        navAnimation.fromVC = fromVC;
        navAnimation.toVC = toVC;
       return navAnimation;
    }

    return nil;
}

- (MyPercentDrivenInteractiveTransition *)transitionAnimation {
    if (!_transitionAnimation) {
        _transitionAnimation = [[MyPercentDrivenInteractiveTransition alloc] init];
    }
    return _transitionAnimation;
}

@end
