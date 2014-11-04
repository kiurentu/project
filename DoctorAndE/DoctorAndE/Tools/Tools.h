//
//  Tools.h
//  DoctorAndE
//
//  Created by skytoup on 14-11-4.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  工具集合
 */
@interface Tools : NSObject

/**
 *  显示一个信息提示，1秒后消失
 *
 *  @param message 提示的信息
 */
+ (void) showMessage:(NSString *)message;

/**
 *  显示一个信息提示框
 *
 *  @param message 提示的信息
 *  @param sec     显示时间（秒）
 */
+ (void) showMessage:(NSString *)message andTime:(float)sec;

@end
