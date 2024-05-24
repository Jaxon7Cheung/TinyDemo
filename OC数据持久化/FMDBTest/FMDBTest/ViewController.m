//
//  ViewController.m
//  FMDBTest
//
//  Created by 张旭洋 on 2024/1/12.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController () {
    FMDatabase* _dataBase;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataBase = [FMDatabase databaseWithPath: @"/Users/jakey/Desktop/CS/Xcode/FMDBTest/fmDb.sqlite"];
//    FMDatabase* dataBase = [FMDatabase databaseWithPath: nil];
    
    if (![_dataBase open]) {
        NSLog(@"打开数据库失败！");
    } else {
        NSLog(@"%@", _dataBase.databasePath);
        
        BOOL result = [_dataBase executeUpdate: @"CREATE TABLE IF NOT EXISTS t_Student(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER NOT NULL, SCORE REAL)"];
        if (result) {
            NSLog(@"创表成功");
            
            //插入操作
            for (int i = 0; i < 10; ++i) {
                NSString* name = [NSString stringWithFormat: @"jaxon-%d", arc4random_uniform(100)];
                
                //不确定的参数用?、?占位
                NSString* sql = @"INSERT INTO t_student (name, age) VALUES (?, ?)";
                [_dataBase executeUpdate: sql, name, @(arc4random_uniform(40))];
                
                //不确定的参数用%@、%d占位
                //[_dataBase executeUpdateWithFormat: @"INSERT INTO t_student (name, age) VALUES (@%, %d)", name, @(arc4random_uniform(40))];
            }
            
            //删除操作
            //[_dataBase executeUpdate: @"DROP TABLE IF EXISTS t_student"];
        } else {
            NSLog(@"创表失败");
        }
        
    }
    
    FMResultSet* resultSet = [_dataBase executeQuery: @"SELECT * FROM t_student"];
    while ([resultSet next]) {
        int ID = [resultSet intForColumn: @"ID"];
        NSString* name = [resultSet stringForColumn: @"NAME"];
        int age = [resultSet intForColumn: @"AGE"];
        NSLog(@"%d %@ %d", ID, name, age);
    }
    

    
    [_dataBase close];
}


@end
