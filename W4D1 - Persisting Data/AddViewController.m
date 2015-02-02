//
//  AddViewController.m
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-02.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;


@end

@implementation AddViewController


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    
    self.detailItem.title = self.titleTextField.text;
}

@end
