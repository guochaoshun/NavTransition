//
//  ViewController.m
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/13.
//

#import "ViewController.h"
#import "RootView.h"
#import "SecondViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(50, 300, 100, 100)];
    red.backgroundColor = [UIColor cyanColor];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [red addGestureRecognizer:tap];
    [self.view addSubview:red];

    UITextView *secondTextView = [[UITextView alloc] initWithFrame:CGRectMake(100, 200, 300, 100)];
    secondTextView.text = @"Lorem im id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.  ";
    [self.view addSubview:secondTextView];

    // 修改button图片的位置为右下角
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 100, 100)];
    button.backgroundColor = [UIColor grayColor];
    [button setImage:[UIImage imageNamed:@"kl_button_live_card_shrink"] forState:UIControlStateNormal];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.view addSubview:button];


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        SecondViewController *vc  = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    });
}


- (void)tapAction {
    SecondViewController *vc  = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    NSLog(@"%@",self.navigationController.topViewController);
    NSLog(@"%@",self.navigationController.visibleViewController);

}


@end
