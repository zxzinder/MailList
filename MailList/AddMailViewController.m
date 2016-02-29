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
    
    MailListModel *model = [[MailListModel alloc] init];
    model.name = @"zxzx";
    model.phone = @"1358546789";
    model.email = @"asasd@163.com";
    
    [self.delegate passMailValue:model];
    [self.navigationController popViewControllerAnimated:YES];
    
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
