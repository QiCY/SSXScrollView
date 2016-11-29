//
//  HTTPManage.h
//  扫扫学教师端
//
//  Created by Mac Os on 16/11/28.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPManage : NSObject
+(id)shareInstance;
- (void)getDataWithUrl:(NSString *)url callBack:(void (^)(NSData *responseCallBack))callback error:(void (^)(NSString *error))error;
@end
