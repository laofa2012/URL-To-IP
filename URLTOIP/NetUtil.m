//
//  NetUtil.m
//  URLTOIP
//
//  Created by Yuanhai on 12/7/17.
//  Copyright © 2017年 Yuanhai. All rights reserved.
//

#import "NetUtil.h"
//域名转IP
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netdb.h>
//获取IP
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <dlfcn.h>
#import <SystemConfiguration/SystemConfiguration.h>

@implementation NetUtil

+ (NSString *)queryIpWithDomain:(NSString *)domain
{
    struct hostent *hs;
    struct sockaddr_in server;
    if ((hs = gethostbyname([domain UTF8String])) != NULL)
    {
        server.sin_addr = *((struct in_addr*)hs->h_addr_list[0]);
        return [NSString stringWithUTF8String:inet_ntoa(server.sin_addr)];
    }
    return nil;
}

+ (NSString *)queryIPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            // the second test keeps from picking up the loopback address
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return nil;
}

@end
