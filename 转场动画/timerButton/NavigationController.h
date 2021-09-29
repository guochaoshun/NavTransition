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

@property (nonatomic, strong) MyPercentDrivenInteractiveTransition *transitionAnimation;

@end

NS_ASSUME_NONNULL_END
