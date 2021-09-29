//
//  Person.h
//  timerButton
//
//  Created by 郭朝顺 on 2021/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;

@property (nonatomic, copy) NSString *name;

- (void)printName;

@end

NS_ASSUME_NONNULL_END
