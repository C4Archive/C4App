//
//  ViewController.m
//  BlendTest
//
//  Created by travis on 2015-01-21.
//  Copyright (c) 2015 C4. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 Here is a rough version of using masks to get the "effect" of layer blending.
 I took 3 images: C, 4b, and 4p where b is the actual blue color, and p is the fake blended purple
 I take the image from C and apply its CGImage to a 4th object: a CALayer I call mask.
 Then, I use the mask to cut out (i.e. reveal) the purple 4. 
 Next steps
 - animate the c and the mask together, as well as the two fours.
 - convert the use of images to actual CGPaths, using C4Shapes
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *c = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"c"]];
    [self.view addSubview:c];
    UIImageView *b4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4b"]];
    b4.center = CGPointMake(b4.center.x + 33, b4.center.y);
    [self.view addSubview:b4];
    UIImageView *p4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4p"]];
    p4.center = b4.center;
    [self.view addSubview:p4];
    
    CALayer *mask = [CALayer layer];
    mask.bounds = c.bounds;
    mask.position = CGPointMake(16, 50);
    mask.contents = (id)[c.image CGImage];
    p4.layer.mask = mask;
}

@end