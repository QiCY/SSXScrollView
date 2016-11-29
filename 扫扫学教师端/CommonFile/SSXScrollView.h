//
//  SSXScrollView.h
//  扫扫学教师端
//
//  Created by Mac Os on 16/11/29.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
@protocol SSXScrollViewDelegate <NSObject>

@optional
- (void)didClickedSubViewIndex:(NSInteger)index;

@end

@interface SSXScrollView : UIView<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *dataList;
- (id)initWithFrame:(CGRect)frame dataList:(NSMutableArray *)dataList target:(id)target;
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,assign)BOOL isAdd;
@property(nonatomic,assign)id<SSXScrollViewDelegate>delegate;
@end
