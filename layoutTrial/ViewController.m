//
//  ViewController.m
//  layoutTrial
//
//  Created by cts on 03/08/15.
//  Copyright (c) 2015 asdasdsd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) IBOutlet NSLayoutConstraint* horizontalSwitchConstraint;
@property(nonatomic,strong) IBOutlet UIView* switchContainer;
@property(nonatomic,strong) IBOutlet UIButton* button;
@property(nonatomic,strong) IBOutlet UISwitch* orangeSwitch;
@property(nonatomic,strong) IBOutlet UILabel* tapHerelabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.button = createButton(@"This is for ages to come!! ", self,nil);
    
    
    [self createButtonVFLWithText:@"This is for ages to come!! "
                returnConstraints:nil];
    self.tapHerelabel = createLabel(@"Tap Here: ", self);
    self.switchContainer = createContainerView(self);
    self.orangeSwitch = createSwitch(self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark "Manual Constraint"
UILabel* createLabel (NSString* labelText,ViewController* self)
{
    UILabel* tmpLabel = nil;
    tmpLabel = [UILabel new];
    [tmpLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpLabel setText:labelText];
    [tmpLabel setBackgroundColor:[UIColor yellowColor]];
    
    [self.view addSubview:tmpLabel];
    
    /*
     view1.attr1 <relation> multiplier × view2.attr2 + c
     */
    //Xpos
    NSLayoutConstraint* xPosRelativeToButton = nil;
    xPosRelativeToButton =
    [NSLayoutConstraint constraintWithItem:tmpLabel
                                 attribute:NSLayoutAttributeTrailing
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.button
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0f
                                  constant:0.0f];
    
    NSLayoutConstraint* xPosRelativeToSuperView = nil;
    xPosRelativeToSuperView =
    [NSLayoutConstraint constraintWithItem:tmpLabel
                                 attribute:NSLayoutAttributeLeading
                                 relatedBy:NSLayoutRelationGreaterThanOrEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeading
                                multiplier:1.0f
                                  constant:20.0f];
    
    //Ypos - 20 units above the bottom
    NSLayoutConstraint* yPos = nil;
    yPos = [NSLayoutConstraint constraintWithItem:tmpLabel
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:-25.0f];
    
    [self.view addConstraints:@[xPosRelativeToButton,xPosRelativeToSuperView,yPos]];
    
    return tmpLabel;
}

UIButton* createButton (NSString* buttonText,ViewController* self, NSArray** arrayOfConstraints)
{
    UIButton* tmpButton = nil;
    tmpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [tmpButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpButton setTitle:buttonText forState:UIControlStateNormal];
    [tmpButton setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:tmpButton];
    
    //button centered to X -- horzontal Center
    NSLayoutConstraint* xPos = nil;
    xPos = [NSLayoutConstraint constraintWithItem:tmpButton
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
    
    NSLayoutConstraint* yPos = nil;
    yPos = [NSLayoutConstraint constraintWithItem:tmpButton
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:-20.0f];
    
    [self.view addConstraints:@[xPos,yPos]];
    
    if (arrayOfConstraints)
    {
        *arrayOfConstraints = @[xPos,yPos];
    }
    
    
    return tmpButton;
}

UISwitch* createSwitch (ViewController* self)
{
    UISwitch* tmpSwitch = nil;
    tmpSwitch = [UISwitch new];
    [tmpSwitch setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[self switchContainer] addSubview:tmpSwitch];
    
    //button centered to X -- horzontal Center
    NSLayoutConstraint* xPos = nil;
    xPos = [NSLayoutConstraint constraintWithItem:tmpSwitch
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.switchContainer
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
    
    NSLayoutConstraint* centeringSwitchToButtonConstraint = nil;
    centeringSwitchToButtonConstraint =
    [NSLayoutConstraint constraintWithItem:tmpSwitch
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.button
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];
    
    NSLayoutConstraint* yPos = nil;
    yPos = [NSLayoutConstraint constraintWithItem:tmpSwitch
                                        attribute:NSLayoutAttributeBottomMargin
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.switchContainer
                                        attribute:NSLayoutAttributeBottomMargin
                                       multiplier:1.0f
                                         constant:-5.0f];
    
    [self.view addConstraints:@[/*xPos*/centeringSwitchToButtonConstraint,yPos]];

    
    return tmpSwitch;
    
}

UIView* createContainerView (ViewController* self)
{
    //has no intrinsic content size
    UIView* tmpView = nil;
    tmpView = [UIView new];
    [tmpView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpView setBackgroundColor:[UIColor redColor]];
    
    [[self view] addSubview:tmpView];
    
    //Xpos
    ////trailing
    
    NSLayoutConstraint* trailingPos = nil;
    trailingPos = [NSLayoutConstraint constraintWithItem:tmpView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeTrailingMargin
                                       multiplier:1.0f
                                         constant:0.0f];
    
    //leading
    NSLayoutConstraint* leadingPos = nil;
    leadingPos = [NSLayoutConstraint constraintWithItem:tmpView
                                               attribute:NSLayoutAttributeLeading
                                               relatedBy:NSLayoutRelationEqual
                                                  toItem:self.view
                                               attribute:NSLayoutAttributeLeadingMargin
                                              multiplier:1.0f
                                                constant:0.0f];
    
    //Ypos
    //top
    NSLayoutConstraint* topPos = nil;
    topPos = [NSLayoutConstraint constraintWithItem:tmpView
                                              attribute:NSLayoutAttributeTop
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeTopMargin
                                             multiplier:1.0f
                                               constant:64.0f];
    
    //bottom
//    
    NSLayoutConstraint* bottomPos = nil;
    bottomPos = [NSLayoutConstraint constraintWithItem:tmpView
                                          attribute:NSLayoutAttributeBottom
                                          relatedBy:NSLayoutRelationEqual
                                             toItem:self.view
                                          attribute:NSLayoutAttributeBottom
                                         multiplier:1.0f
                                           constant:-84.0f];
    
    
    //width
    NSLayoutConstraint* width = nil;
    width = [NSLayoutConstraint constraintWithItem:tmpView
                                             attribute:NSLayoutAttributeWidth
                                             relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                toItem:nil
                                             attribute:0
                                            multiplier:1.0f
                                              constant:84.0f];
    
    //height
    
    NSLayoutConstraint* height = nil;
    height = [NSLayoutConstraint constraintWithItem:tmpView
                                             attribute:NSLayoutAttributeHeight
                                             relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                toItem:nil
                                             attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1.0f
                                              constant:200.0f];
    
    
    [self.view addConstraints:@[leadingPos,trailingPos,topPos,bottomPos]];
    
    
//    //button centered to X -- horzontal Center
//    NSLayoutConstraint* xPos = nil;
//    xPos = [NSLayoutConstraint constraintWithItem:tmpView
//                                        attribute:NSLayoutAttributeCenterX
//                                        relatedBy:NSLayoutRelationEqual
//                                           toItem:self.view
//                                        attribute:NSLayoutAttributeCenterX
//                                       multiplier:1.0f
//                                         constant:0.0f];
//    
//    NSLayoutConstraint* yPos = nil;
//    yPos = [NSLayoutConstraint constraintWithItem:tmpView
//                                        attribute:NSLayoutAttributeCenterY
//                                        relatedBy:NSLayoutRelationEqual
//                                           toItem:self.view
//                                        attribute:NSLayoutAttributeCenterY
//                                       multiplier:1.0f
//                                         constant:0.0f];
//    
//    [self.view addConstraints:@[xPos,yPos]];

    
    
    
    return tmpView;
    
}

#pragma mark "Manual Constraint - VFL"
-(UIButton*) createButtonVFLWithText: (NSString*) buttonText
returnConstraints: (NSArray**) arrayOfConstraints
{
    UIButton* tmpButton = nil;
    tmpButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [tmpButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpButton setTitle:buttonText forState:UIControlStateNormal];
    [tmpButton setBackgroundColor:[UIColor orangeColor]];
    
    [self.view addSubview:tmpButton];
    self.button = tmpButton;
    
    
    NSArray* constrainsArray =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=300,<=1000)-[_button]-(==25)-|"
                                            options:NSLayoutFormatAlignAllCenterY
                                            metrics:nil
                                              views:NSDictionaryOfVariableBindings(_button)];
    
    //button centered to X -- horzontal Center
    NSLayoutConstraint* xPos = nil;
    xPos = [NSLayoutConstraint constraintWithItem:tmpButton
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
    
    NSMutableArray* constArray = [NSMutableArray array];
    [constArray addObjectsFromArray:constrainsArray];
    [constArray addObject:xPos];
    
    [[self view] addConstraints:[constArray copy]];
    
    
    return  tmpButton;
}
    @end
