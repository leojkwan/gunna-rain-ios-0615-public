//
//  FISViewController.m
//  gunnaRain
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Forecastr *forecastr = [Forecastr sharedManager];
    forecastr.apiKey = @"185390c5134fbf9806792ba96926eef7";
    
    [forecastr getForecastForLatitude:4.0333 longitude:5.3167 time:nil exclusions:nil extend:nil success:^(id weather) {
        NSString *chanceOfPrecipitation = [NSString stringWithFormat:@"%@",weather[@"currently"][@"precipProbability"]];
                                           
            if ([chanceOfPrecipitation floatValue] < .15) {
               self.rainLabel.text = @"Nope";
           } else {
               self.rainLabel.text = @"Yep";
           }
        NSLog(@"JSON Response was: %@", weather);
    } failure:^(NSError *error, id response) {
        NSLog(@"Error while retrieving forecast: %@", [forecastr messageForError:error withResponse:response]);
    }];
    
    

    
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
