//
//  NetUtil.h
//  URLTOIP
//
//  Created by Yuanhai on 12/7/17.
//  Copyright © 2017年 Yuanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetUtil : NSObject

+ (NSString *)queryIpWithDomain:(NSString *)domain;

+ (NSString *)queryIPAddress;

@end
