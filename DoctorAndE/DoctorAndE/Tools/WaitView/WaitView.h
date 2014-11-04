//
//  WaitView.h
//  iOSTest
//
//  Created by skytoup on 14-10-24.
//  Copyright (c) 2014年 skytoup. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DEFAULT_TITLE (@"正为您获取数据，请稍后...")

@protocol WaitViewDelegate <NSObject>
@optional
/**
 *  用户主动取消等待框
 */
- (void) waitViewCancle;
@end

/**
 *  等待窗口的View，默认标题为：正为您获取数据，请稍后...
 */
@interface WaitView : UIView
@property (weak,nonatomic) id<WaitViewDelegate> delegete;
/**
 *  初始化等待框
 *
 *  @param title 标题
 *
 *  @return 等待框
 */
- (instancetype)initWithTitle:(NSString*) title;
/**
 *  设置标题
 *
 *  @param title 标题
 */
- (void)setTitle:(NSString*) title;
/**
 *  获取标题
 *
 *  @return 标题
 */
- (NSString*)title;
/**
 *  显示等待框
 */
- (void)show;
/**
 *  显示指定标题的等待框
 *
 *  @param title 需要显示的标题
 */
- (void)showWidthTitle:(NSString *) title;
/**
 *  隐藏等待框
 */
- (void)dismiss;
/**
 *  是否正在显示
 */
- (BOOL)isShow;
@end
