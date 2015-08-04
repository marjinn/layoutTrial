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
    //self.orangeSwitch = createSwitch(self);
    
    [self createSwitchVFL];
    
    [self createAcceptAndCancelButtons];
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
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=300,<=1000)-[_button]-(==20)-|"
                                            options:0
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

-(void)buttonPressHandler:(id)action
{
    NSLog(@"%@",NSStringFromCGRect(
                                   [[UIScreen mainScreen] bounds]));
    NSLog(@"%@",NSStringFromCGRect(
                                   [self.view bounds]));
    NSLog(@"%@",NSStringFromCGRect(
                                   [self.view frame]));
}

-(UILabel*) createLabelVFLWithText: (NSString*) buttonText
{
    UILabel* tmpLabel = nil;
    tmpLabel = [UILabel new];
    [tmpLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpLabel setText:buttonText];
    [tmpLabel setBackgroundColor:[UIColor yellowColor]];
    self.tapHerelabel = tmpLabel;
    
    [self.view addSubview:tmpLabel];
    
    
    NSArray* constrainsArrayX =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(>=20)-[_tapHerelabel]-[_button]|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:nil
                                              views:NSDictionaryOfVariableBindings(_button,
                                                                                   _tapHerelabel)];
    
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
    
    NSArray* constrainsArrayY =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=300,<=1000)-[_tapHerelabel]-(==30)-|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:nil
                                              views:NSDictionaryOfVariableBindings(_tapHerelabel)];
    
    
    NSLayoutConstraint* yPos = nil;
    yPos = [NSLayoutConstraint constraintWithItem:tmpLabel
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:-25.0f];
    
    NSMutableArray* constArray =
    [NSMutableArray arrayWithCapacity:(constrainsArrayX.count + constrainsArrayY.count)];
    
    //[constArray addObjectsFromArray:constrainsArrayX];
    [constArray addObjectsFromArray:constrainsArrayY];
    //[constArray addObjectsFromArray:@[xPosRelativeToSuperView,xPosRelativeToButton,yPos]];
    [constArray addObjectsFromArray:@[xPosRelativeToSuperView,xPosRelativeToButton]];
    
    [[self view] addConstraints:[constArray copy]];
    
    return tmpLabel;
}

-(UIView*) createContainerViewVFL
{
    //has no intrinsic content size
    UIView* tmpView = nil;
    tmpView = [UIView new];
    [tmpView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpView setBackgroundColor:[UIColor redColor]];
    
    [[self view] addSubview:tmpView];
    self.switchContainer = tmpView;
    
    NSArray* constrainsArrayX =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_switchContainer]-|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:nil
                                              views:NSDictionaryOfVariableBindings(_switchContainer)];
    
    NSArray* constrainsArrayY =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==64)-[switchContainer(>=200)]-(==84)-|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:nil
                                              views:@{@"switchContainer" : self.switchContainer}];
    
    NSMutableArray* constArray =
    [NSMutableArray arrayWithCapacity:(constrainsArrayX.count + constrainsArrayY.count)];
    
    
    [constArray addObjectsFromArray:constrainsArrayX];
    [constArray addObjectsFromArray:constrainsArrayY];
    
    [[self view] addConstraints:[constArray copy]];
    
    return tmpView;
}

-(UISwitch*) createSwitchVFL
{
    UISwitch* tmpSwitch = nil;
    tmpSwitch = [UISwitch new];
    [tmpSwitch setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [[UISwitch appearanceWhenContainedIn:[self.switchContainer class], nil] setOnTintColor:[UIColor orangeColor]] ;
    
    [[self switchContainer] addSubview:tmpSwitch];
    self.orangeSwitch = tmpSwitch;
    
    
    NSLayoutConstraint* xPos = nil;
    xPos =
    [NSLayoutConstraint constraintWithItem:self.orangeSwitch
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.switchContainer
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];
    
    
    NSArray* constraintsForVpos = nil;
    constraintsForVpos =
//    [NSLayoutConstraint constraintsWithVisualFormat:
//     @"V:|-(>=min_distance_from_toplayout,<=max_distance_from_toplayout)-[orangeSwitch]-(==bottomPadding)-|"
//                                            options:NSLayoutFormatAlignAllBaseline
//                                            metrics:@{@"bottomPadding" :
//                                                          @(10),
//                                                      @"min_distance_from_toplayout" :
//                                                          @(0),
//                                                      @"max_distance_from_toplayout" :
//                                                          @(self.view.bounds.size.height)
//                                                      }
//                                              views:@{@"orangeSwitch" : self.orangeSwitch}];
    
    [NSLayoutConstraint constraintsWithVisualFormat:
     @"V:[orangeSwitch]-(==bottomPadding)-|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:@{@"bottomPadding" :
                                                          @(10),
                                                      @"min_distance_from_toplayout" :
                                                          @(0),
                                                      @"max_distance_from_toplayout" :
                                                          @(self.view.bounds.size.height)
                                                      }
                                              views:@{@"orangeSwitch" : self.orangeSwitch}];
    
    
    NSMutableArray* constArray =
    [NSMutableArray arrayWithCapacity:(constraintsForVpos.count + 1)];
    
    
    [constArray addObjectsFromArray:constraintsForVpos];
    [constArray addObjectsFromArray:@[xPos]];
    
    [[self view] addConstraints:[constArray copy]];
    
    
    
    return tmpSwitch;
}

//-(void)updateViewConstraints
//{
//    [super updateViewConstraints];
//}

/*
 layoutIfNeeded - force layout
 
 updateConstraints -> layout -> display
 
 apply layout phase
 -[layoutsubviews gets called -- UIKIT
 --- here is where the auto layout functions are applied
 
 after this
 
 setBounds and setCenter to UIview
 setFrame to NSView
 
 V:[redBox][yellowBox(==redBox)]//equal heigh
 
 //DEBUG
 
 [UIWindow keyWindow] _autolayoutTrace]
 
 UIWindow:0x79e70ed0
 |   •UIView:0x79e72860
 |   |   *_UILayoutGuide:0x79e729f0
 |   |   *_UILayoutGuide:0x79e72e00
 |   |   *UIButton:0x79e72460'This is for ages to come!...'
 |   |   |   UIButtonLabel:0x7a085430'This is for ages to come!...'
 |   |   *UILabel:0x79e79610'Tap Here: '
 |   |   *UIView:0x7a082640
 |   |   |   *UISwitch:0x7a082eb0
 |   |   |   |   _UISwitchInternalViewNeueStyle1:0x7a0835d0
 |   |   |   |   |   UIView:0x7a47e250
 |   |   |   |   |   |   UIView:0x7a47d5e0
 |   |   |   |   |   UIView:0x7a47e190
 |   |   |   |   |   |   UIView:0x7a47d670
 |   |   |   |   |   UIView:0x7a47d010
 |   |   |   |   |   |   UIImageView:0x7a47e540
 |   |   |   |   |   |   UIImageView:0x7a47e620
 |   |   |   |   |   UIImageView:0x7a084600
 
 
 
 SHOWS AN AMBIGOUSLAYOUT
 
 */


-(void)createAcceptAndCancelButtons
{
    UIButton* tmpAcceptButton = nil;
    tmpAcceptButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [tmpAcceptButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpAcceptButton setTitle:@"Accept" forState:UIControlStateNormal];
    [tmpAcceptButton setBackgroundColor:[UIColor yellowColor]];
    
    [[self switchContainer] addSubview:tmpAcceptButton];
    
    UIButton* tmpCancelButton = nil;
    tmpCancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [tmpCancelButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tmpCancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [tmpCancelButton setBackgroundColor:[UIColor orangeColor]];
    
    [[self switchContainer] addSubview:tmpCancelButton];
    
    
    NSDictionary* viewsDict = NSDictionaryOfVariableBindings(tmpAcceptButton,tmpCancelButton);
    
    NSArray* constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:
  @"H:|[tmpCancelButton]-[tmpAcceptButton(==tmpCancelButton)]|"
                                            options:NSLayoutFormatAlignAllBaseline
                                            metrics:nil
                                              views:viewsDict];
    
    [[self switchContainer] addConstraints:constraints];
    
    constraints = nil;
    
    //Threre is no need to specify the connection between superviews bottom and cancleButton
    
    constraints =
    [NSLayoutConstraint constraintsWithVisualFormat:
     @"V:|[tmpCancelButton]"
                                            options:0
                                            metrics:nil
                                              views:viewsDict];
    
     [[self switchContainer] addConstraints:constraints];
    
    
    
}

    @end
