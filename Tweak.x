@interface LAUIPearlGlyphView
@property (nonatomic,readonly) CALayer * contentLayer;
-(void)_applyStateAnimated:(BOOL)arg1;
@end

@interface ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)delay completion:(id)completion;
@end

float FAPCheckmarkTime;
long long FAPDismissalTime;

%hook LAUIPearlGlyphView
-(void)_applyStateAnimated:(BOOL)arg1 {
	CALayer *layer = [self contentLayer];
	layer.speed = FAPCheckmarkTime;

	%orig;
}
%end

%hook ToastViewController
-(void)dismissWithDelay:(NSTimeInterval)delay completion:(id)completion {
	%orig(FAPDismissalTime, completion);
}
%end

static void fastAuthenticationReloadPrefs() {
	CFPreferencesAppSynchronize(CFSTR("com.haotestlabs.fastauthenticationpreferences"));

	NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.haotestlabs.fastauthenticationpreferences.plist"];
	FAPCheckmarkTime = prefs[@"FAPCheckmarkTime"] ? ((NSNumber *)prefs[@"FAPCheckmarkTime"]).floatValue : 1;
	FAPDismissalTime = prefs[@"FAPDismissalTime"] ? ((NSNumber *)prefs[@"FAPDismissalTime"]).longLongValue : 2;
}

%ctor {
	fastAuthenticationReloadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)fastAuthenticationReloadPrefs, CFSTR("com.haotestlabs.fastauthentication/ReloadPrefs"), NULL, 0);
}