@interface LAUIPearlGlyphView
@property (nonatomic,readonly) CALayer * contentLayer;
-(void)_applyStateAnimated:(BOOL)arg1;
@end

@interface ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)delay completion:(id)completion;
@end


%hook LAUIPearlGlyphView
-(void)_applyStateAnimated:(BOOL)arg1 {
	HBLogDebug(@"_applyStateAnimated");
	//CALayer *layer = [self contentLayer];
	//layer.speed = 10;

	%orig;
}
%end

%hook ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)delay completion:(id)completion {
	HBLogDebug(@"dismissWithDelay:completion:");
	%orig(0.5, completion);
}
%end
%ctor {
	HBLogDebug(@"hello");
}