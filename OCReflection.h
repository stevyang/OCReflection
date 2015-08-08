//
//  OCReflection.h
//
//  Created by yangyang on 14-9-5.
//  Copyright (c) 2014年 stevyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCReflection : NSObject


/* 
 *获取对象的所有属性和属性内容
 */
- (NSDictionary *)objPropertiesAndValues:(id)object;

/* 
 *获取对象的所有属性 
 */
- (NSArray *)classPropertiesArray:(Class )className;

@end
