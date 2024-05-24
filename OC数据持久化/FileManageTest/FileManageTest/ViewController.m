//
//  ViewController.m
//  FileManageTest
//
//  Created by 张旭洋 on 2023/11/20.
//

#import "ViewController.h"

#import <sqlite3.h>

@interface ViewController () {
    sqlite3* _sqlite;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //SQLite文件名称
    static NSString* const dataBaseName = @"MyFirstDB.sqlite";
    
    //将数据库存到沙盒中的Documents路径
    NSString* sandBoxPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    //拼接得到数据库文件地址
    NSString* filePath = [sandBoxPath stringByAppendingPathComponent: dataBaseName];
    
    
    NSInteger state = sqlite3_open(filePath.UTF8String, &_sqlite);
    if (state == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        
        //创建表SQL语句
//      NSString* SQLString = @"CREATE TABLE IF NOT EXISTS t_Student(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER NOT NULL, SCORE REAL)";
        
        //直接用C语言风格字符串也可
//        const char* SQLString = "CREATE TABLE IF NOT EXISTS t_Student(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL, AGE INTEGER NOT NULL, SCORE REAL)";
//        const char* SQLString = "DROP TABLE t_Student";
        
//        for (int i = 0; i < 7; ++i) {
//            NSString* name = [NSString stringWithFormat: @"Jacky-%d号", i + 1];
//            NSString* SQLString = [NSString stringWithFormat: @"INSERT INTO t_Student (NAME, AGE) VALUES ('%@', %d)", name, i + 19];
//
//            char* errorMsg = NULL;
//            sqlite3_exec(_sqlite, SQLString.UTF8String, NULL, NULL, &errorMsg);
//            if (!errorMsg) {
//                NSLog(@"插入数据成功");
//            } else {
//                NSLog(@"插入数据失败 -> errorMessage: %s", errorMsg);
//            }
//        }
        
//        const char* SQLString = "UPDATE t_Student SET NAME = 'Jackson-2号' WHERE AGE = 20";
//
//        char* errorMsg = NULL;
//        sqlite3_exec(_sqlite, SQLString, NULL, NULL, &errorMsg);
//        if (!errorMsg) {
//            NSLog(@"删除数据成功");
//        } else {
//            NSLog(@"删表数据失败 -> errorMessage: %s", errorMsg);
//        }
        
        const char* SQLString = "SELECT ID, NAME, AGE FROM t_Student WHERE AGE != 19";
        
        //用stmt取出查询结果
        sqlite3_stmt* stmt = NULL;
        
        NSInteger state = sqlite3_prepare_v2(_sqlite, SQLString, -1, &stmt, NULL);
        if (state == SQLITE_OK) {
            NSLog(@"查询语句没有问题 读取数据成功");
            
            //每调用一次sqlite3_step函数，stmt就会指向下一条数据
            while (sqlite3_step(stmt) == SQLITE_ROW) {  //找到一条记录
                //读取数据
                
                //取出第0列字段的值（int类型）
                int ID = sqlite3_column_int(stmt, 0);
                //取出第1列字段的值（text类型）
                const unsigned char* name = sqlite3_column_text(stmt, 1);
                //取出第2列字段的值（int类型）
                int age = sqlite3_column_int(stmt, 2);
                
                printf("%d %s %d\n", ID, name, age);
            }
        } else {
            NSLog(@"查询语句有问题 读取数据失败");
        }
        
    } else {
        NSLog(@"打开数据库失败");
    }
    
    
    
    
    
    
//    NSString* path = NSHomeDirectory();
//    NSLog(@"%@zxy", path);
//
//    NSString* path2 = [[NSBundle mainBundle] bundlePath];
//    NSLog(@"%@", path2);
//
//    NSString* path3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSLog(@"%@", path3);
//
//    NSString* path4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
//    NSLog(@"%@", path4);
//
//    NSString* path5 = NSTemporaryDirectory();
//    NSLog(@"%@", path5);
    
    
//    NSString* path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSString* fileName = [path stringByAppendingPathComponent: @"filename.plist"];
//
//    NSArray* array = @[@"ott", @"123", @"abc"];
//    [array writeToFile: fileName atomically: YES];
//
//    NSArray* result = [NSArray arrayWithContentsOfFile: fileName];
//    NSLog(@"%@", result);
   
    
//    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
//
//    //向plist文件中写入内容
//    [userDefaults setObject: @"3G!!!" forKey: @"obj"];
//    [userDefaults setBool: YES forKey: @"isMale"];
//    [userDefaults setInteger: 20 forKey: @"age"];
//
//    //立即同步
//    [userDefaults synchronize];
//
//    //读取文件中的内容
//    NSString* userName = [userDefaults objectForKey: @"obj"];
//    BOOL genderIsMale = [userDefaults boolForKey: @"isMale"];
//    NSInteger age = [userDefaults integerForKey: @"age"];
//    NSLog(@"%@ %d %ld", userName, genderIsMale, age);
//    [userDefaults removeObjectForKey: @"isMale"];
//
//    //注册一个默认值
//    [userDefaults registerDefaults: @{@"firstRun" : @YES}];
//
//    //第一次启动还没有生成plist文件，就会读取上面注册的默认值
//    BOOL isFirstRun = [userDefaults boolForKey: @"firstRun"];
//
//    //是第一次启动
//    if (isFirstRun) {
//        NSLog(@"这是第一次启动");
//
//        //手动改为NO，保存到plist文件中
//        [userDefaults setBool: NO forKey: @"firstRun"];
//    } else {
//        NSLog(@"不是第一次启动");
//    }
    
    
    
}


@end
