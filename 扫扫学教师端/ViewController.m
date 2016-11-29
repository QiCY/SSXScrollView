//
//  ViewController.m
//  扫扫学教师端
//
//  Created by Mac Os on 16/11/28.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

#import "ViewController.h"
#import "SSXScrollView.h"

@interface ViewController ()<SSXScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SSXScrollView *scrollView = [[SSXScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200) dataList: [NSMutableArray arrayWithArray:@[@"http://pic55.nipic.com/file/20141208/19462408_171130083000_2.jpg",@"http://hbsnj.keliren.cn/tuku/a/20161104/581c05ccca265.jpg",@"http://img05.tooopen.com/images/20140604/sy_62331342149.jpg",@"http://pic28.nipic.com/20130424/11588775_115415688157_2.jpg"]] target:self];
    [self.view addSubview:scrollView];
   
}
- (void)didClickedSubViewIndex:(NSInteger)index
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"点击的Index" message:[NSString stringWithFormat:@"%ld",index] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
