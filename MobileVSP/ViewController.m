//
//  ViewController.m
//  MobileVSP
//
//  Created by FighterRay on 2017/5/16.
//  Copyright © 2017年 FighterRay. All rights reserved.
//

#import "ViewController.h"
#import "SegmentView.h"
#import "SearchViewController.h"
#import "ProgressQueryViewController.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) SegmentView *segmentView;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIView *slider;

@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (nonatomic, strong) UIPageViewController *pageController;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger nextindex;

@end

@implementation ViewController


- (IBAction)goToAftersalesApplyVC:(id)sender {
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    
    [self.pageController setViewControllers:@[searchVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        if (finished) {
            [self changeToButton1];
        }
    }];
}

- (IBAction)goToProgressQueryVC:(id)sender {
    ProgressQueryViewController *progressQueryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProgressQueryViewController"];
    
    [self.pageController setViewControllers:@[progressQueryVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        if (finished) {
            [self changeToButton2];
        }
    }];
}

- (void)changeToButton1 {
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button1 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        self.slider.frame = CGRectMake(50, 35, 108, 2);
    } completion:nil];
}

- (void)changeToButton2 {
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionNone animations:^{
        self.slider.frame = CGRectMake(220, 35, 108, 2);
    } completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageController"];
    self.pageController.delegate = self;
    self.pageController.dataSource = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    ProgressQueryViewController *progressQueryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProgressQueryViewController"];
    self.segmentVCsArray = [[NSMutableArray alloc] initWithObjects:searchVC, progressQueryVC, nil];
    
    __weak __typeof(self) weakSelf = self;
    [self.pageController setViewControllers:@[searchVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        if (finished) {
            [weakSelf changeToButton1];
        }
    }];
    
    [self addChildViewController:self.pageController];
    [self.contentView addSubview:self.pageController.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    if (self.index == 0) {
        return nil;
    } else {
        self.index = 0;
        
        return self.segmentVCsArray[0];
    }
    
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    
    if (self.index == 1) {
        return nil;
    } else {
        self.index = 1;
        
        return self.segmentVCsArray[1];
    }
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
    UIViewController *controller = [pendingViewControllers firstObject];
    if ([controller isKindOfClass:[SearchViewController class]]) {
        self.nextindex = 0;
    } else {
        self.nextindex = 1;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    NSInteger tempIndex = 0;
    UIViewController *controller = [self.pageController.viewControllers firstObject];
    if ([controller isKindOfClass:[SearchViewController class]]) {
        [self changeToButton1];
        tempIndex = 0;
    } else {
        [self changeToButton2];
        tempIndex = 1;
    }
    
    if (self.nextindex == tempIndex) {
        self.index = self.nextindex;
    }
}


@end
