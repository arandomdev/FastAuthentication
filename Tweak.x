#import <Cephei/HBPreferences.h>

@interface LAUIPearlGlyphView
@property (nonatomic,readonly) CALayer * contentLayer;
-(void)_applyStateAnimated:(BOOL)arg1;
@end

@interface ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)delay completion:(id)completion;
@end

HBPreferences *preferences;
NSNumber *FAPCheckmarkTime;
NSNumber *FAPDismissalTime;

%hook LAUIPearlGlyphView
-(void)_applyStateAnimated:(BOOL)arg1 {
	float speed = FAPCheckmarkTime.floatValue;
	CALayer *layer = [self contentLayer];
	layer.speed = speed;

	HBLogDebug(@"speed: %f", speed);
	%orig;
}
%end

%hook ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)dismissalDelay completion:(id)completion {
	double delay = FAPDismissalTime.doubleValue;
	%orig(delay, completion);

	HBLogDebug(@"delay: %f", delay);
}
%end

%ctor {
	preferences = [[HBPreferences alloc] initWithIdentifier:@"com.haotestlabs.fastauthenticationpreferences"];
	[preferences registerObject:&FAPCheckmarkTime default:[NSNumber numberWithInt:1] forKey:@"FAPCheckmarkTime"];
	[preferences registerObject:&FAPDismissalTime default:[NSNumber numberWithInt:2] forKey:@"FAPDismissalTime"];
}