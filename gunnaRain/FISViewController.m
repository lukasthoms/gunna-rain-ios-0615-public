//
//  FISViewController.m
//  gunnaRain
//
//  Created by Joe Burgess on 6/27/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import <Forecastr.h>

@interface FISViewController ()

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Forecastr *forecast = [Forecastr sharedManager];
    forecast.apiKey =@"de266d0039ccde283a97ec1372a31175";
    
    [forecast getForecastForLatitude:39.7910 longitude:86.1480 time:nil exclusions:nil extend:nil success: ^(id JSON) {
        NSLog(@"JSON Response was %@", JSON);
        NSDictionary *currently = [JSON objectForKey:@"currently"];
        NSLog(@"Currently precip is %@", [currently objectForKey:@"precipProbability"]);
        if ([[currently objectForKey:@"precipProbability"] floatValue]  == 1) {
            self.weatherStatus.text = @"Yep";
        } else {
            self.weatherStatus.text = @"Nope";
        }
    } failure:^(NSError *error, id response) {
        NSLog(@"Failure");
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
