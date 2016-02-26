//
//  AddMailViewController.m
//  MailList
//
//  Created by MacMini on 16/2/26.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import "AddMailViewController.h"
#import "MailListModel.h"
#import "MailListTableViewController.h"

@interface AddMailViewController ()

@end

@implementation AddMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneClick)];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneClick{
    
    MailListTableViewController *mlVC = [self.navigationController.viewControllers objectAtIndex:self.navigationController.viewControllers.count-2];
    mlVC.mailList.name = @"test";
    

    [self.navigationController popToViewController:mlVC animated:YES ];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
