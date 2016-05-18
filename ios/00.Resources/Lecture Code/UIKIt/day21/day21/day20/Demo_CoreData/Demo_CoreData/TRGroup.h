//
//  TRGroup.h
//  Demo_CoreData
//
//  Created by apple on 13-7-2.
//  Copyright (c) 2013年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TRContact;

@interface TRGroup : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *contacts;
@end

@interface TRGroup (CoreDataGeneratedAccessors)

- (void)addContactsObject:(TRContact *)value;
- (void)removeContactsObject:(TRContact *)value;
- (void)addContacts:(NSSet *)values;
- (void)removeContacts:(NSSet *)values;

@end
