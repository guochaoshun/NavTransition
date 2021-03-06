//
//  SecondViewController.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/20.
//

#import "SecondViewController.h"
#import "NavigationController.h"
#import "MyPercentDrivenInteractiveTransition.h"

@interface SecondViewController ()

@property (nonatomic, strong) MyPercentDrivenInteractiveTransition *interactiveTransition;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];

    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];


    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(backHandle:)];
    [self.view addGestureRecognizer:panGesture];

}

- (void)backHandle:(UIPanGestureRecognizer *)recognizer
{
    [self customControllerPopHandle:recognizer];
}
- (void)customControllerPopHandle:(UIPanGestureRecognizer *)recognizer {

    CGFloat process = [recognizer translationInView:self.view].x/self.view.bounds.size.width;
    process = MIN(1.0,MAX(0.0, process));
    NSLog(@"customControllerPopHandle - %lf",process);
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        //此时标记是手势拖动返回
        self.interactiveTransition.isPan = YES;
        [self.navigationController popViewControllerAnimated:YES];
    } else if(recognizer.state == UIGestureRecognizerStateChanged) {
        [self.interactiveTransition updateInteractiveTransition:process]; //更新手势完成度
    } else if(recognizer.state ==UIGestureRecognizerStateEnded ||recognizer.state ==UIGestureRecognizerStateCancelled) {
        // 手势结束时，若进度大于0.5就完成pop动画，否则取消
        if(process >0.5) {
            [self.interactiveTransition finishInteractiveTransition];
        }else{
            [self.interactiveTransition cancelInteractiveTransition];
        }
        self.interactiveTransition.isPan = NO;
    }
}

- (MyPercentDrivenInteractiveTransition *)interactiveTransition {
    if (_interactiveTransition == nil) {
        // 保证懒加载在nav的pop之前调用,pop之后再获取self.navigationController就是nil了
        // 可以在viewDidLoad中调用下懒加载,保证_interactiveTransition被正确赋值了
        NavigationController *nav = (NavigationController *)self.navigationController;
        _interactiveTransition = nav.transitionAnimation;
    }
    return _interactiveTransition;
}


@end
