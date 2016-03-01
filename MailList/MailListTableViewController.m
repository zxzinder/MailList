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
#import "AddMailViewController.h"

@interface MailListTableViewController() <passValue>

@property (nonatomic,strong)NSMutableArray *mailFrames;

@property (nonatomic, assign) Boolean isEditing;

@property (nonatomic, assign) NSUInteger selectedIndex;


@property (nonatomic, strong)MailListFrame *lastMailFrame;

@end

@implementation MailListTableViewController

static NSString *ID = @"cell";

-(NSMutableArray *)mailFrames{
    
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


-(void)passMailValue:(MailListModel *)mailList{
    
    //NSLog(@"%@",mailList);


    NSMutableArray *arrM = [NSMutableArray array];

    for (int i=0; i<self.mailFrames.count; i++) {
        MailListFrame *frame = self.mailFrames[i];
        MailListModel *model = frame.mailList;
        [arrM addObject:[model dictionaryValue]];
    }
    
    [arrM addObject:[mailList dictionaryValue]];
    
    [self saveMailList:arrM];
    
}

-(void)addBtnClick{
    
    
    AddMailViewController *adVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddMailViewController"];
    adVC.delegate = self;
    [self.navigationController pushViewController:adVC animated:YES];

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

-(void)saveMailList:(NSMutableArray *)arrM{
    
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArr objectAtIndex:0];
    NSString *plistPath = [path stringByAppendingPathComponent:@"data.plist"];
    BOOL isSuccess = [arrM writeToFile:plistPath atomically:YES];
    if (isSuccess) {
        NSLog(@"success");
        _mailFrames = [MailListFrame MailListFrames];
    }else{
        
        NSLog(@"error");
    }
    [self.tableView reloadData];

}

//delegate方法中
-(void)reset {
    if (self.lastMailFrame) {
        self.lastMailFrame.mailList.isShow = NO;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.mailFrames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MailListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    MailListFrame *mailFrame = self.mailFrames[indexPath.row];
    mailFrame.mailList.isShow = false;
    cell.isSelected = mailFrame.mailList.isShow;
    cell.mailframe = mailFrame;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    MailListFrame *mailFrame = self.mailFrames[indexPath.row];
    if (self.lastMailFrame != mailFrame ) {
        [self reset];
    }
    
    self.selectedIndex = indexPath.row;
    if (mailFrame.mailList.isShow) {
        mailFrame.mailList.isShow = NO;
    } else {
        mailFrame.mailList.isShow = YES;
    }
    [tableView reloadData];
    self.lastMailFrame = mailFrame;
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
   // NSLog(@"%@",self.mailFrames[indexPath.row]);
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
 
    id source = self.mailFrames[sourceIndexPath.row];

    [self.mailFrames removeObjectAtIndex:sourceIndexPath.row];

    
    [self.mailFrames insertObject:source atIndex:destinationIndexPath.row];
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (int i=0; i<self.mailFrames.count; i++) {
        MailListFrame *frame = self.mailFrames[i];
        MailListModel *model = frame.mailList;
        [arrM addObject:[model dictionaryValue]];
    }
    [self saveMailList:arrM];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MailListFrame *mailFrame = self.mailFrames[indexPath.row];
    if (mailFrame.mailList.isShow) {
        return 200;
    }
    return mailFrame.cellHeight;
    
}

@end
