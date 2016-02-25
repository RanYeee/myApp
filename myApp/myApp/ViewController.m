//
//  ViewController.m
//  myApp
//
//  Created by IMac on 16/1/31.
//  Copyright © 2016年 IMac. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "GroupIconView.h"
#import "ToolBarView.h"
#import "SearchToolBarView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    UIDynamicAnimator *_animator;
    
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *theView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
//    [self.view addSubview:self.tableView];
    
//    NSArray *iconArray = @[@"powerpoint_20x20@2x.png",
//                           @"profile_20x20@2x.png",
//                           @"video_20x20@2x.png",
//                           @"word_20x20@2x.png",
//                           @"zip_20x20@2x.png",
//                           @"calendar_20x20@2x.png",
//                           @"contacts_20x20@2x.png",
//                           @"csv_20x20@2x.png",
//                           @"email_20x20@2x.png"];
//
//    GroupIconView *iconView = [[GroupIconView alloc]initWithFrame:CGRectMake(100, 100, 100, 100) iconArray:iconArray];
//    
//    
//    [self.view addSubview:iconView];
    
    
    ToolBarView *toolView = [[ToolBarView alloc]initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 60) titleArray:@[@"heheh",@"hahah",@"xixix"]];
    
    [toolView selectedAtItem:^(UIButton *item) {
       
        NSLog(@">>>>>>item : %@",item);
        
    }];
    
    [self.view addSubview:toolView];
    
    SearchToolBarView *searchBar = [[SearchToolBarView alloc]initWithFrame:CGRectMake(0, 130, self.view.bounds.size.width, 60)ToolStyle:SearchToolStyleNone];
                                    
                                    
    [self.view addSubview:searchBar];
    
    
}



#pragma mark - tabelView delegate & dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

//    static NSString *const cellID = @"cellID";
    
    MyCell *cell = [[MyCell alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    
//    if (!cell) {
//        
//        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//    }

    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"这个是UIAlertController的默认样式" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField){
        textField.placeholder = @"登录";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


@end
