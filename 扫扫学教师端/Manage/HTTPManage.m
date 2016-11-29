//
//  HTTPManage.m
//  扫扫学教师端
//
//  Created by Mac Os on 16/11/28.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

#import "HTTPManage.h"

@implementation HTTPManage
+(id)shareInstance{
    static HTTPManage *manage = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manage = [[self alloc] init];
    });
    return manage;
}

- (void)getDataWithUrl:(NSString *)url callBack:(void (^)(NSData *responseCallBack))callback error:(void (^)(NSString *error))error{
     AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"the progress is %lld",downloadProgress.completedUnitCount /downloadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end

