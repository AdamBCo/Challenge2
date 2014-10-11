//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Adam Cooper on 10/10/14.
//  Copyright (c) 2014 Adam Cooper. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *arrayOfLocations;
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    City *cityOne = [[City alloc]init];
    cityOne.cityName = @"Charleston";
    cityOne.stateName = @"South Carolina";
    cityOne.website = @"http://en.wikipedia.org/wiki/charleston";
    cityOne.cityImage = [UIImage imageNamed:@"charleston"];
    City *cityTwo = [[City alloc]init];
    cityTwo.cityName = @"New York";
    cityTwo.stateName = @"New York";
    cityTwo.website = @"http://en.wikipedia.org/wiki/New_York";
    cityTwo.cityImage = [UIImage imageNamed:@"newyork"];
    City *cityThree = [[City alloc]init];
    cityThree.cityName = @"Houston";
    cityThree.stateName = @"Texas";
    cityThree.website = @"http://en.wikipedia.org/wiki/houston";
    cityThree.cityImage = [UIImage imageNamed:@"houston"];
    City *cityFour = [[City alloc]init];
    cityFour.cityName = @"Denver";
    cityFour.stateName = @"Colorado";
    cityFour.website = @"http://en.wikipedia.org/wiki/Denver";
    cityFour.cityImage = [UIImage imageNamed:@"denver"];
    
    self.arrayOfLocations = [[NSMutableArray alloc] initWithObjects:cityOne, cityTwo, cityThree, cityFour, nil];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.cityTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayOfLocations.count;
}

- (IBAction)editButtonPressed:(id)sender {
    if (![self.cityTableView isEditing]) {
        [self.cityTableView setEditing:YES animated:YES];
    } else if([self.cityTableView isEditing]){
        [self.cityTableView setEditing:NO animated:YES];
    }
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    City *city = [self.arrayOfLocations objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.detailTextLabel.text = city.stateName;
    cell.imageView.image = city.cityImage;
    return cell;
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.arrayOfLocations removeObjectAtIndex:indexPath.row];
    [self.cityTableView reloadData];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell{
    if ([segue.identifier isEqualToString:@"SimpleSegue"])
    {
        DetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.navigationItem.title = cell.textLabel.text;
        detailViewController.selectedCity = [self.arrayOfLocations objectAtIndex:[self.cityTableView indexPathForCell:cell].row];
    }
}



@end
