#include "UnsplashWallsXIRootListController.h"

@interface PLStaticWallpaperImageViewController : NSObject
- (instancetype)initWithUIImage:(UIImage *)image;
- (void)setWallpaperForLocations:(long long)mask;
@end

@implementation UnsplashWallsXIRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void) openTwitter
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"twitter://user?screen_name=JeffResc_"]];
}

-(void) openUnsplash
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://unsplash.com/"]];
}

-(void) openPayPal
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://paypal.me/JeffResc"]];
}

-(void) openSupport
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://docs.google.com/forms/d/e/1FAIpQLSd8fS81d5xInr0gygHxdqdZc7UmYepaFSj9xNmgo_vIl9AC9A/viewform?usp=sf_link"]];
}

-(void) ipadGitHub
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ipadkid358/UnsplashWalls"]];
}

-(void) updateWallpaper
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UnsplashWallsXI" 
						message:@"Wait patiently while the wallpaper is fetched..."
						delegate:nil
						cancelButtonTitle:@"Okay" 
						otherButtonTitles:nil];
	[alert show];
	[alert release];
	[[NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:@"https://source.unsplash.com/random"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
		if (data == nil || error != nil) {
			return;
		}
		UIImage *image = [UIImage imageWithData:data];
		if (image) {
			PLStaticWallpaperImageViewController *wallpaper = [[PLStaticWallpaperImageViewController alloc] initWithUIImage:image];
			if (wallpaper) {
				long long locations = 0;
				if ([[[NSUserDefaults alloc] initWithSuiteName:@"com.jeffresc.unsplashwallsxi"] boolForKey:@"UWXILock"] && [[[NSUserDefaults alloc] initWithSuiteName:@"com.jeffresc.unsplashwallsxi"] boolForKey:@"UWXIHome"]) {
					locations = 3;
				} else if ([[[NSUserDefaults alloc] initWithSuiteName:@"com.jeffresc.unsplashwallsxi"] boolForKey:@"UWXIHome"]) {
					locations = 2;
				} else if ([[[NSUserDefaults alloc] initWithSuiteName:@"com.jeffresc.unsplashwallsxi"] boolForKey:@"UWXILock"]) {
					locations = 1;
				}
					if ([[[NSUserDefaults alloc] initWithSuiteName:@"com.jeffresc.unsplashwallsxi"] boolForKey:@"UWXICR"]) {
						UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);

					}
					[wallpaper setWallpaperForLocations:locations];
					exit(0);
			} else {
					UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UnsplashWallsXI" 
										message:@"There was an error fetching the wallpaper. Check your internet connection and try again."
										delegate:nil
										cancelButtonTitle:@"Okay" 
										otherButtonTitles:nil];
					[alert show];
					[alert release];
			}
		}
	}] resume];
}

@end
