//
//  SSXScrollView.m
//  扫扫学教师端
//
//  Created by Mac Os on 16/11/29.
//  Copyright © 2016年 Mac Os. All rights reserved.
//

#import "SSXScrollView.h"
#import "UIButton+AFNetworking.h"
@implementation SSXScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame dataList:(NSMutableArray *)dataList target:(id)target
{
    self.dataList = dataList;
    self.delegate = target;
    if (self = [super initWithFrame:frame]) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(self.dataList.count*frame.size.width, frame.size.height);
        for (int i = 0; i<self.dataList.count; i++) {
            UIButton *subButton = [[UIButton alloc] initWithFrame:CGRectMake( i*frame.size.width, 0,frame.size.width, frame.size.height)];
            [subButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:dataList[i]]];
            subButton.tag = i;
            [subButton addTarget:self action:@selector(subButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.scrollView addSubview:subButton];
        }
       [self addSubview:self.scrollView];
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(20, frame.size.height-20, frame.size.width-20, 20)];
        self.pageControl.numberOfPages = dataList.count;
        self.pageControl.currentPage = 0;
        self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
        self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];

        [self addSubview:self.pageControl];
        [self startAutoChange];
    }
    return self;
}

- (void)startAutoChange{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changeScrollView) userInfo:nil repeats:YES];
}

- (void)changeScrollView{
    if (self.pageControl.currentPage == 0) {
        _isAdd = YES;
    }
    if (self.pageControl.currentPage ==self.dataList.count -1) {
        _isAdd = NO;
    }
    if (_isAdd) {
        self.pageControl.currentPage++;
    }else{
        self.pageControl.currentPage--;
    }

    self.scrollView.contentOffset = CGPointMake(self.pageControl.currentPage*self.scrollView.frame.size.width, 0);
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat x=scrollView.contentOffset.x;
    
    self.pageControl.currentPage = x/scrollView.frame.size.width;
    
   
}


- (void)subButtonClicked:(UIButton *)sender{
    NSLog(@"you click button tag is %ld",sender.tag);
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickedSubViewIndex:)]) {
        [self.delegate didClickedSubViewIndex:sender.tag];
    }
}
@end
