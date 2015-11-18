//
//  WTRWootricIntegration.h
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 12/11/15.
//

#import <Foundation/Foundation.h>
#import <Analytics/SEGIntegration.h>
#import <WootricSDK/WootricSDK.h>

@interface WTRWootricIntegration : NSObject<SEGIntegration>

@property(nonatomic, strong) NSDictionary *settings;

- (id)initWithSettings:(NSDictionary *)settings;
+ (void)showSurveyInViewController:(UIViewController *)viewController;
+ (SEGWootric *)wootric;

@end
