//
//  JJTimer.m
//
//  Created by 16 on 2018/7/16.
//  Copyright © 2018年 冀佳伟. All rights reserved.
//

#import "JJTimer.h"

@interface JJTimer()

@property (nonatomic , assign) CGFloat duration;// 计时器时长
@property (nonatomic , assign) BOOL down;// 计时器增减
@property (nonatomic , assign) CGFloat current;// 当前时间
@property (nonatomic , strong) NSTimer *timer;// 计时器
@end

@implementation JJTimer

+ (void)startTimerWithDuration:(CGFloat)duration down:(BOOL)down start:(JJTimerStartBlock)start end:(JJTimerEndBlock)end
{
    [instance startTimerWithDuration:duration down:down start:start end:end];
}
- (void)startTimerWithDuration:(CGFloat)duration down:(BOOL)down start:(JJTimerStartBlock)start end:(JJTimerEndBlock)end
{
    self.start = start;
    self.end = end;
    self.duration = duration;
    self.down = down;
    if (self.duration == DBL_MAX) self.down = NO;// 如果传无限大,则默认计时器增
    self.current = down?self.duration:0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart) userInfo:nil repeats:YES];
}
- (void)timerStart
{
    if (self.duration == DBL_MAX) {
        self.current++;
        self.start(self.current);
    }else {
        
        if (self.down) {
            self.current--;
            if (self.current == 0) {
                self.end();
                [self.timer invalidate];// 停止计时器
            }else {
                self.start(self.current);
            }
        }else {
            self.current++;
            if (self.current == self.duration) {
                self.end();
                [self.timer invalidate];// 停止计时器
            }else {
                self.start(self.current);
            }
        }
    }
}
#pragma mark 暂停定时器
+ (void)stop
{
    [instance stop];
}
- (void)stop
{
    [self.timer invalidate];
}
static  JJTimer *instance;
#pragma mark 创建视频单例,防止播放器用其他方式创建
+ (void)initialize{
    [JJTimer manager];
}
+ (instancetype)manager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JJTimer alloc]init];
    });
    return instance;
}
+ (instancetype)alloc
{
    if (instance) {
        NSException *exception = [NSException exceptionWithName:@"JJTimer" reason:@"JJTimer是一个单例!" userInfo:nil];
        [exception raise];
    }
    return [super alloc];
}
- (id)copy
{
    return self;
}
- (id)mutableCopy
{
    return self;
}
@end
