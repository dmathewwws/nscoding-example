//
//  MasterViewController.m
//  W4D1 - Persisting Data
//
//  Created by Daniel Mathews on 2015-02-01.
//  Copyright (c) 2015 com.lighthouse-labs. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Book.h"

@interface MasterViewController () <UITextFieldDelegate>

@property NSMutableArray *books;
@property (nonatomic) UITextField *myTextField;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.books) {
        self.books = [[NSMutableArray alloc] init];
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Add a Book" message:@"Enter Book Below" preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder= @"Book Name";
        self.myTextField = textField;
    }];

    [alert addAction:[UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        Book *b = [Book new];
        b.title = self.myTextField.text;
        [self.books addObject:b];
        [NSKeyedArchiver archiveRootObject:self.books toFile:[self getFilePath]];
        [self.tableView reloadData];
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];

    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [alert dismissViewControllerAnimated:true completion:nil];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(NSString*)getFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    return [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showAddSegue"]) {

    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Book *object = self.books[indexPath.row];
    cell.textLabel.text = object.title;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
//}

@end
