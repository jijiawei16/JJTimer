# JJTimer
一行的代码实现计时器功能:
`
[JJTimer startTimerWithDuration:DBL_MAX down:NO start:^(CGFloat current) {
NSLog(@"%f",current);
} end:^{
NSLog(@"结束了");
}];
`
