//
//  WTRWootricUtils.m
//  Segment-Wootric
//
//  Created by Łukasz Cichecki on 13/11/15.
//  Copyright © 2015 Wootric. All rights reserved.
//

#import "WTRWootricUtils.h"

@implementation WTRWootricUtils

+ (NSNumber *)timestampFromCreatedAt:(NSString *)createdAt {
  NSNumber *timestamp;

  if (createdAt) {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    timestamp = [numberFormatter numberFromString:createdAt];
  }

  if (!timestamp && createdAt) {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    NSDate *createdAtDate = [formatter dateFromString:createdAt];
    if (createdAtDate) {
      timestamp = [NSNumber numberWithDouble:[createdAtDate timeIntervalSince1970]];
    }
  }

  return timestamp;
}

@end
