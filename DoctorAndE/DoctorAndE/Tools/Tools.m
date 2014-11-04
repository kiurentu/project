//
//  Tools.m
//  DoctorAndE
//
//  Created by skytoup on 14-11-4.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import "Tools.h"
#import "MBProgressHUD.h"

@implementation Tools

+ (void) showMessage:(NSString *)message {
    [Tools showMessage:message andTime:1.0f];
}

+ (void) showMessage:(NSString *)message andTime:(float)sec{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
	hud.mode = MBProgressHUDModeText;
	hud.labelText = message;
	hud.margin = 15.f;
	hud.removeFromSuperViewOnHide = YES;
	[hud hide:YES afterDelay:sec];
}

@end
