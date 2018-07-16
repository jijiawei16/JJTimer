//
//  JJTimer.h
//
//  Created by 16 on 2018/7/16.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^JJTimerStartBlock)(CGFloat current);
typedef void(^JJTimerEndBlock)(void);
@interface JJTimer : NSObject

/*
 * 计时器计时回调
 */
@property (nonatomic , copy) JJTimerStartBlock start;

/*
 * 计时器结束计时回调
 */
@property (nonatomic , copy) JJTimerEndBlock end;

/*
 * duration 计时器时长,如果传DBL_MAX,则表示一直执行
 * down 计时器增还是减,增传NO,减传YES
 */
+ (void)startTimerWithDuration:(CGFloat)duration down:(BOOL)down start:(JJTimerStartBlock)start end:(JJTimerEndBlock)end;

/*
 * 停止定时器
 */
+ (void)stop;
@end
