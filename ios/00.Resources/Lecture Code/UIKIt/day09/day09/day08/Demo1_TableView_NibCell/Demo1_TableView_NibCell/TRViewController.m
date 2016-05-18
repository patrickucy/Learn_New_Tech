//
//  TRViewController.m
//  Demo1_TableView_NibCell
//
//  Created by apple on 13-6-14.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import "TRViewController.h"
#import "TRSongCell.h"

#define SONG_CELL_IDENTIFIER @"Song Cell"

@interface TRViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (retain, nonatomic) UITableView * tableView;

@end

@implementation TRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    //告诉tableview 如果有需要SongCell识别符的cell的时候，
    //你就直接用TRSongCell的nib文件生成即可
    [tableView registerNib:[UINib nibWithNibName:@"TRSongCell" bundle:nil] forCellReuseIdentifier:SONG_CELL_IDENTIFIER];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView release];
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //内部逻辑dequeueReusableCellWithIdentifier
    /*
        if(根据识别符检查有没有重用cell){
            return 可重用的cell
        } else {
            if(当前识别符有没有绑定的nib文件/类){
                return 根据nib文件alloc一个cell
            } else {
                return nil
            }
        }
     */
    TRSongCell * cell = [tableView dequeueReusableCellWithIdentifier:SONG_CELL_IDENTIFIER];
    
    TRSong * song = self.songs[indexPath.row];
    cell.titleLabel.text = song.title;
    cell.singerNameLabel.text = song.singerName;
    cell.lengthLabel.text = song.length;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    BOOL isCurrent = indexPath.row == self.currentSongIndex;
    cell.currentFlagLabel.hidden = !isCurrent;
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentSongIndex = indexPath.row;
}

//- (void)setCurrentSongIndex:(NSInteger)currentSongIndex
//{
//    if(_currentSongIndex != currentSongIndex){
//        
//        NSIndexPath * previousIndexPath = [NSIndexPath indexPathForRow:_currentSongIndex inSection:0];
//        TRSongCell * previousCell = [self.tableView cellForRowAtIndexPath:previousIndexPath];
//        previousCell.currentFlagLabel.hidden = YES;
//        [previousCell setNeedsDisplay];
//        
//        _currentSongIndex = currentSongIndex;
//        
//        NSIndexPath * nextIndexPath = [NSIndexPath indexPathForRow:_currentSongIndex inSection:0];
//        TRSongCell * nextCell = [self.tableView cellForRowAtIndexPath:nextIndexPath];
//        previousCell.currentFlagLabel.hidden = NO;
//        
//        [self.tableView setNeedsDisplay];
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
