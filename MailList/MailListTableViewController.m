//
//  MailListTableViewController.m
//  MailList
//
//  Created by MacMini on 16/2/25.
//  Copyright © 2016年 MacMini. All rights reserved.
//

#import "MailListTableViewController.h"
#import "MailListCell.h"
#import "MailListModel.h"
#import "MailListFrame.h"


@interface MailListTableViewController()

@property (nonatomic,strong)NSArray *mailFrames;

@property (nonatomic, assign) Boolean *isEditing;

@end

@implementation MailListTableViewController

static NSString *ID = @"cell";

-(NSArray *)mailFrames{
    
    if (_mailFrames == nil) {
        _mailFrames = [MailListFrame MailListFrames];
        
    }
    return _mailFrames;
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    [self.tableView registerClass:[MailListCell class] forCellReuseIdentifier:ID];
    
    self.navigationItem.title = @"通讯录";
    
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addBtnClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editBtnClick)];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    NSLog(@"%@",self.mailList.name);
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   
}

-(void)addBtnClick{
    
    [self performSegueWithIdentifier:@"push" sender:nil];
    
}

-(void)editBtnClick{
    
    if (_isEditing) {
        self.tableView.editing = NO;
        _isEditing = NO;
    }else{
        
        self.tableView.editing = YES;
        _isEditing = YES;
    }
    
    

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mailFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MailListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    MailListFrame *mailFrame = self.mailFrames[indexPath.row];
    cell.mailframe = mailFrame;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSLog(@"editing~~~");

    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MailListFrame *mailFrame = self.mailFrames[indexPath.row];
    
    return mailFrame.cellHeight;
    
}

@end
