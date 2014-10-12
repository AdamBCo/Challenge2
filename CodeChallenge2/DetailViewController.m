//
//  DetailViewController.m
//  CodeChallenge2
//
//  Created by Adam Cooper on 10/10/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"

@interface DetailViewController () <CityDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *stateNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *stateNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;

@property (weak, nonatomic) IBOutlet UIImageView *websiteImage;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cityNameLabel.text = self.selectedCity.cityName;
    self.stateNameLabel.text = self.selectedCity.stateName;
    self.websiteImage.image = self.selectedCity.cityImage;
    self.cityNameTextField.hidden = YES;
    self.stateNameTextField.hidden = YES;
    self.selectedCity.delegate = self;
    [self.selectedCity createString];
    
}
- (IBAction)onEditButtonPressed:(id)sender {

    if (self.cityNameTextField.hidden == YES) {
        self.stateNameLabel.hidden = YES;
        self.cityNameLabel.hidden = YES;
        self.cityNameTextField.hidden = NO;
        self.stateNameTextField.hidden = NO;
    } else if (self.cityNameTextField.hidden == NO){
        self.stateNameLabel.hidden = NO;
        self.cityNameLabel.hidden = NO;
        self.cityNameTextField.hidden = YES;
        self.stateNameTextField.hidden = YES;
        self.selectedCity.cityName = self.cityNameTextField.text;
        self.selectedCity.stateName = self.stateNameTextField.text;
        self.cityNameLabel.text = self.selectedCity.cityName;
        self.stateNameLabel.text = self.selectedCity.stateName;
    }

    
}

-(void)passURLString:(NSString *)string{
    self.selectedCity.website = string;
    
}

-(IBAction)onTapped:(UITapGestureRecognizer *)sender{
    self.websiteLabel.backgroundColor = [UIColor greenColor];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webViewController = segue.destinationViewController;
    
    webViewController.websiteURL = self.selectedCity.website;
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([identifier isEqualToString:@"WebSegue"]) {
        return YES;
    } else{
        return NO;
    }

}

@end
