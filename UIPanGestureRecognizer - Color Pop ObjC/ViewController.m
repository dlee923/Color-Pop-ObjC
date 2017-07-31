//
//  ViewController.m
//  UIPanGestureRecognizer - Color Pop ObjC
//
//  Created by Daniel Lee on 7/31/17.
//  Copyright © 2017 DLEE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _numberOfColumnsToCreate = 10;
    
    [self setUpBlocksOfDifferentColor:_numberOfColumnsToCreate];
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)]];
}


-(void)handleGestureRecognizer:(UIPanGestureRecognizer*)sender{
    int touchLocationX = [sender locationInView:self.view].x / _sizeOfBlock;
    int touchLocationY = [sender locationInView:self.view].y / _sizeOfBlock;
    NSString *locationCoordinates = [NSString stringWithFormat:@"%i,%i", touchLocationX, touchLocationY];
    UIView *touchedCell = [_viewsDictionary objectForKey:locationCoordinates];
    
    if (_selectedCell == touchedCell) {
        [UIView animateWithDuration:0.2 animations:^{
            [self.view bringSubviewToFront:_selectedCell];
            [_selectedCell setTransform:CGAffineTransformMakeScale(3, 3)];
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            [_selectedCell setTransform:CGAffineTransformIdentity];
        }];
    }
    
    _selectedCell = touchedCell;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            [_selectedCell setTransform:CGAffineTransformIdentity];
        }];
    }    
}

-(void)setUpBlocksOfDifferentColor:(int)numberOfColumns {
    _viewsDictionary = [[NSMutableDictionary alloc] init];
    
    _sizeOfBlock = self.view.bounds.size.width / numberOfColumns;
    int numberOfRows = self.view.bounds.size.height / _sizeOfBlock;
    
    for (int x = 0; x <= numberOfColumns; x++) {
        for (int y = 0; y <= numberOfRows; y++) {
            UIView *squareView = [[UIView alloc] init];
            [squareView setFrame:CGRectMake((CGFloat)(_sizeOfBlock * x), (CGFloat)(_sizeOfBlock * y), (CGFloat)(_sizeOfBlock), (CGFloat)(_sizeOfBlock))];
            [squareView setBackgroundColor:[self assignRandomColor]];
            squareView.layer.borderColor = [UIColor blackColor].CGColor;
            squareView.layer.borderWidth = 1;
            [self.view addSubview:squareView];
            
            NSString *key = [NSString stringWithFormat:@"%i,%i", x, y];
            [_viewsDictionary setObject:squareView forKey:key];
        };
    };
}

-(UIColor *)assignRandomColor {
    double randomRed = arc4random_uniform(255);
    double randomGreen = arc4random_uniform(255);
    double randomBlue = arc4random_uniform(255);
    UIColor *randomColor = [[UIColor alloc] initWithRed:(CGFloat)randomRed / 255 green:(CGFloat)randomGreen / 255 blue:(CGFloat)randomBlue / 255 alpha:1];
    return randomColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
