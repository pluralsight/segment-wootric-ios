//
//  WTRWootricIntegrationFactory.m
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 12/11/15.
//

#import "WTRWootricIntegrationFactory.h"
#import "WTRWootricIntegration.h"

@implementation WTRWootricIntegrationFactory

+ (id)instance {
  static dispatch_once_t once;
  static WTRWootricIntegrationFactory *sharedInstance;
  dispatch_once(&once, ^{
    sharedInstance = [[self alloc] init];
  });
  return sharedInstance;
}

- (id<SEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(SEGAnalytics *)analytics {
  return [[WTRWootricIntegration alloc] initWithSettings:settings];
}

- (NSString *)key {
  return @"Wootric";
}

@end
