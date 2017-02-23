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

//#import "HeaderCollectionReusableView.h"
//#import "FooterCollectionReusableView.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *photosArray;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
   
    MyPhoto *photo1 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-0"] andSubject:@"Fluffy" andLocation:@"Vancouver"];
    MyPhoto *photo2 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-1"] andSubject:@"Muffy" andLocation:@"Kelowna"];
    MyPhoto *photo3 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-2"] andSubject:@"Stuffy" andLocation:@"Vancouver"];
    MyPhoto *photo4 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-3"] andSubject:@"Buffy" andLocation:@"Vancouver"];
    MyPhoto *photo5 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-4"] andSubject:@"Tuffy" andLocation:@"Surrey"];
    MyPhoto *photo6 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-5"] andSubject:@"Ruffy" andLocation:@"Vancouver"];
    MyPhoto *photo7 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-6"] andSubject:@"Huffy" andLocation:@"Victoria"];
    MyPhoto *photo8 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-7"] andSubject:@"Wuffy" andLocation:@"Victoria"];
    MyPhoto *photo9 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-8"] andSubject:@"Zuffy" andLocation:@"Vancouver"];
    MyPhoto *photo10 = [[MyPhoto alloc] initWithImage:[UIImage imageNamed:@"cat-9"] andSubject:@"Gruffy" andLocation:@"Whistler"];

    
    self.photosArray = [[NSMutableArray alloc] initWithObjects:
                        photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10, nil];
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"imageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    cell.myPhoto = self.photosArray[indexPath.row];
    
//    UILabel *label = (UILabel*)[cell viewWithTag:100];
//    label.text = [NSString stringWithFormat:@"%ld/%ld", (long)indexPath.section, (long)indexPath.item];
    
    return cell;
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
//        headerView.sectionLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
//        return headerView;
//    }
//    return nil;
//}

@end
