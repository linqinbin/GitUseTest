//
//  Stundent.m
//  TestProject
//
//  Created by linqinbin on 16/4/24.
//  Copyright © 2016年 linqb. All rights reserved.
//

#import "Stundent.h"
#import "Stundent+AddProperty.h"

@implementation Stundent 


- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeInteger:self.age forKey:@"age"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self.name = [decoder decodeObjectForKey:@"name"];
    self.age = [decoder decodeIntForKey:@"age"];
    return self;
}

/*
 归档反归档：
  单个对象(归档)：
 Person *person = [[Person alloc] init];
 person.name = @"hosea";
 person.age = 22;
 [NSKeyedArchiver archiveRootObject:person toFile:path];
 单个对象（解档)：
 Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:path];

 多个对象：PS:也可将多个对象放入到一个数组中。
 // 新建一块可变数据区
 NSMutableData *data = [NSMutableData data];
 // 将数据区连接到一个NSKeyedArchiver对象
 NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
 // 开始存档对象，存档的数据都会存储到NSMutableData中
 [archiver encodeObject:person1 forKey:@"person1"];
 [archiver encodeObject:person2 forKey:@"person2"];
 // 存档完毕(一定要调用这个方法，调用了这个方法，archiver才会将encode的数据存储到NSMutableData中)
 [archiver finishEncoding];
 // 将存档的数据写入文件
 [data writeToFile:path atomically:YES];
 
 // 从文件中读取数据
 NSData *data = [NSData dataWithContentsOfFile:path];
 // 根据数据，解析成一个NSKeyedUnarchiver对象
 NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
 Person *person1 = [unarchiver decodeObjectForKey:@"person1"];
 Person *person2 = [unarchiver decodeObjectForKey:@"person2"];
 // 恢复完毕(这个方法调用之后，unarchiver不能再decode对象，而且会通知unarchiver的代理调用unarchiverWillFinish:和unarchiverDidFinish:方法)
 [unarchiver finishDecoding];
 
 */



@end
