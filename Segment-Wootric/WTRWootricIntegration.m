//
//  WTRWootricIntegration.m
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 12/11/15.
//

#import "WTRWootricIntegration.h"
#import "WTRWootricUtils.h"

@implementation WTRWootricIntegration

- (id)initWithSettings:(NSDictionary *)settings {
  if (self = [super init]) {
    _settings = settings;
    NSString *clientID = _settings[@"clientId"];
    NSString *clientSecret = _settings[@"clientSecret"];
    NSString *accountToken = _settings[@"accountToken"];
    [Wootric configureWithClientID:clientID clientSecret:clientSecret accountToken:accountToken];
  }

  return self;
}

- (void)identify:(SEGIdentifyPayload *)payload {
  NSString *email = payload.traits[@"email"];
  NSString *dateString = payload.traits[@"createdAt"];
  NSNumber *timestamp = [WTRWootricUtils timestampFromCreatedAt:dateString];

  [Wootric setEndUserEmail:email];
  [Wootric setEndUserCreatedAt:timestamp];
}

+ (SEGWootric *)wootricInstance {
  return [[SEGWootric alloc] init];
}

+ (void)showSurveyInViewController:(UIViewController *)viewController {
  [[self wootricInstance] showSurveyInViewController:viewController];
}

@end
