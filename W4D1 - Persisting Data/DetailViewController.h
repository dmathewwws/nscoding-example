//
//  DetailViewController.h
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-01.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

