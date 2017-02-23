//
//  ViewController.m
//  InstaKilo
//
//  Created by Dave Augerinos on 2017-02-22.
//  Copyright © 2017 Dave Augerinos. All rights reserved.
//

#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyPhoto.h"
#import "MyHeaderCollectionReusableView.h"

//#import "HeaderCollectionReusableView.h"
//#import "FooterCollectionReusableView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *photosArray;
@property (strong, nonatomic) NSMutableDictionary *photosBySubjectDictionary;
@property (strong, nonatomic) NSMutableDictionary *photosByLocationDictionary;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
   
    MyPhoto *photo1 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-0"] andSubject:@"Fluffy" andLocation:@"Vancouver"];
    MyPhoto *photo2 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-1"] andSubject:@"Muffy" andLocation:@"Kelowna"];
    MyPhoto *photo3 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-2"] andSubject:@"Stuffy" andLocation:@"Vancouver"];
    MyPhoto *photo4 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-3"] andSubject:@"Fluffy" andLocation:@"Vancouver"];
    MyPhoto *photo5 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-4"] andSubject:@"Fluffy" andLocation:@"Surrey"];
    MyPhoto *photo6 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-5"] andSubject:@"Zuffy" andLocation:@"Vancouver"];
    MyPhoto *photo7 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-6"] andSubject:@"Huffy" andLocation:@"Victoria"];
    MyPhoto *photo8 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-7"] andSubject:@"Wuffy" andLocation:@"Victoria"];
    MyPhoto *photo9 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-8"] andSubject:@"Zuffy" andLocation:@"Vancouver"];
    MyPhoto *photo10 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-9"] andSubject:@"Gruffy" andLocation:@"Whistler"];

    
    self.photosArray = [[NSMutableArray alloc] initWithObjects:
                        photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, nil];
    
    self.photosBySubjectDictionary = [[NSMutableDictionary alloc] init];
    self.photosByLocationDictionary = [[NSMutableDictionary alloc] init];
    
    [self sortPhotosIntoGroups:self.photosArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sortPhotosIntoGroups:(NSMutableArray *)mutableArray {
    
    // Iterate through photo array
    for (MyPhoto *photo in mutableArray) {
        
        [NSString stringWithString:photo.subject];
        
        // If subject key is not in dict
        if( ! [self.photosBySubjectDictionary objectForKey:photo.subject] ) {
            
            // Add photo to new mutuable array and use subject as key in subjects dictionary
            NSMutableArray *photosBySubjectArray = [[NSMutableArray alloc] initWithObjects:photo, nil];
            [self.photosBySubjectDictionary setValue:photosBySubjectArray forKey:photo.subject];
        }
        // Subject key is in subject dict, add photo mutable array
        else {
            NSMutableArray *currentArray = [self.photosBySubjectDictionary objectForKey:photo.subject];
            [currentArray addObject:photo];
            [self.photosBySubjectDictionary setValue:currentArray forKey:photo.subject];
        }

        // If location key is not in dict
        if( ! [self.photosByLocationDictionary objectForKey:photo.location] ) {
            // Add photo to new mutuable array and use location as key in subjects dictionary
            NSMutableArray *photosByLocationArray = [[NSMutableArray alloc] initWithObjects:photo, nil];
            [self.photosByLocationDictionary setValue:photosByLocationArray forKey:photo.location];
        }
        // Location key is in location dict, add photo mutable array
        else {
            NSMutableArray *currentArray = [self.photosByLocationDictionary objectForKey:photo.location];
            [currentArray addObject:photo];
            [self.photosByLocationDictionary setValue:currentArray forKey:photo.location];
        }
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    // Check which side of segmented control is active
    if(self.mySegmentedControl.selectedSegmentIndex == 0) {
        
        // Get all keys for subject dict and count of array to determine number of sections
        NSArray *keys = [self.photosBySubjectDictionary allKeys];
        return keys.count;
    }
    
    else {
     
        // Get all keys for location dict and count of array to determine number of sections
        NSArray *keys = [self.photosByLocationDictionary allKeys];
        return keys.count;
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    // Check which side of segmented control is active
    if(self.mySegmentedControl.selectedSegmentIndex == 0) {
        
        // Get all values for subject dict and count of array at section to determine number of sections
        NSArray *values = [self.photosBySubjectDictionary allValues];
        return [[values objectAtIndex: section] count];
    }
    
    else {
        
        // Get all keys for location dict and count of array at section to determine number of sections
        NSArray *values = [self.photosByLocationDictionary allValues];
        return [[values objectAtIndex:section] count];
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    
    
    if(self.mySegmentedControl.selectedSegmentIndex == 0) {
    
        NSArray *values = [self.photosBySubjectDictionary allValues];
        NSArray *photos = [values objectAtIndex:indexPath.section];
        cell.myPhoto = photos[indexPath.row];
    }
    
    else {
        NSArray *values = [self.photosByLocationDictionary allValues];
        NSArray *photos = [values objectAtIndex:indexPath.section];
        cell.myPhoto = photos[indexPath.row];
    }
    
    return cell;
}


- (IBAction)mySegmentedControlSwitched:(UISegmentedControl *)sender {

    [self.myCollectionView reloadData];
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        MyHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        
        // Check which side of segmented control is active
        if(self.mySegmentedControl.selectedSegmentIndex == 0) {
            
            // Get all keys for subject dict and string of key in array to determine section header label
            NSArray *keys = [self.photosBySubjectDictionary allKeys];
            NSString *mySubject = keys[indexPath.section];
            headerView.headerSectionLabel.text = [NSString stringWithFormat:@"%@", mySubject];
        }
        
        else {
            
            // Get all keys for location dict and string of key in array to determine section header label
            NSArray *keys = [self.photosByLocationDictionary allKeys];
            NSString *myLocation = keys[indexPath.section];
            headerView.headerSectionLabel.text = [NSString stringWithFormat:@"%@", myLocation];
        }
        
        return headerView;
        
    }
    return nil;
}

@end
