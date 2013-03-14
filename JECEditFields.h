//
//  JECEditFields.h
//  Note Pad
//
//  Created by Joshua Cooper on 3/13/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocation.h>
#import "JECData.h"


@interface JECEditFields : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *EnterTextField;
@property (weak, nonatomic) IBOutlet UILabel *InstructionsField;
- (IBAction)submit:(id)sender;
@property (weak, nonatomic) IBOutlet JECData *currentEntry;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end
