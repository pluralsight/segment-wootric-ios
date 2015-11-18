//
//  WTRWootricIntegration.m
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 12/11/15.
//

#import "WTRWootricIntegration.h"
#import "WTRWootricUtils.h"

NSString *WTRWootricIntegrationReady = @"com.wootric.integration.ready";

@implementation WTRWootricIntegration

- (id)initWithSettings:(NSDictionary *)settings {
  if (self = [super init]) {
    _settings = settings;
    NSString *clientID = _settings[@"clientId"];
    NSString *clientSecret = _settings[@"clientSecret"];
    NSString *accountToken = _settings[@"accountToken"];
    [Wootric configureWithClientID:clientID clientSecret:clientSecret accountToken:accountToken];
    [[NSNotificationCenter defaultCenter] postNotificationName:WTRWootricIntegrationReady object:self userInfo:nil];
  }

  return self;
}

- (void)identify:(SEGIdentifyPayload *)payload {
  NSString *email = payload.traits[@"email"];
  NSString *dateString = payload.traits[@"createdAt"];
  NSMutableDictionary *endUserProperties = [payload.traits copy];
  NSNumber *timestamp = [WTRWootricUtils timestampFromCreatedAt:dateString];

  [endUserProperties removeObjectsForKeys:@[@"email", @"createdAt"]];
  [Wootric setEndUserEmail:email];
  [Wootric setEndUserCreatedAt:timestamp];
  [Wootric setEndUserProperties:endUserProperties];
}

+ (SEGWootric *)wootric {
  return [[SEGWootric alloc] init];
}

+ (void)showSurveyInViewController:(UIViewController *)viewController {
  [[self wootric] showSurveyInViewController:viewController];
}

@end
