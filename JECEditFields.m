//
//  JECEditFields.m
//  Note Pad
//
//  Created by Joshua Cooper on 3/13/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECEditFields.h"

@interface JECEditFields ()

@end

@implementation JECEditFields

int stage = 0;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    _InstructionsField.text = @"Enter your title";
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set a movement threshold for new events.
        _locationManager.distanceFilter = 500;
        if(([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorized))
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle: @"Announcement"
                                  message: @"You should enable location settings; go to your references and do that please!"
                                  delegate: nil
                                  cancelButtonTitle:@"OK; I'll go and do that now, I promise!"
                                  otherButtonTitles:nil];
            [alert show];
        }
        [_locationManager startUpdatingLocation];
        _currentEntry.location = _locationManager.location;
        [_locationManager stopUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *pattern = [UIImage imageNamed:@"retina_wood.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:pattern];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidUnload {
    [self setEnterTextField:nil];
    [self setInstructionsField:nil];
    [super viewDidUnload];
}
- (IBAction)submit:(id)sender {
    NSString *text = _EnterTextField.text;
    _EnterTextField.text = @"";
    if(stage == 0){
    _currentEntry.title = text;
    _InstructionsField.text = @"What did you do there?";
        stage = 1;
         [_EnterTextField resignFirstResponder];
    }
    else{
        _currentEntry.description = text;
         [_EnterTextField resignFirstResponder];
        [self.navigationController popViewControllerAnimated:YES];
        _currentEntry.assembled = @"Yes";
        stage = 0;
    }
    NSLog(@"Submit");
   
}
@end
