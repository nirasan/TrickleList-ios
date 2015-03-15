// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Habit.h instead.

#import <CoreData/CoreData.h>


extern const struct HabitAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *name;
} HabitAttributes;

extern const struct HabitRelationships {
	__unsafe_unretained NSString *statuses;
} HabitRelationships;

extern const struct HabitFetchedProperties {
} HabitFetchedProperties;

@class Status;




@interface HabitID : NSManagedObjectID {}
@end

@interface _Habit : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (HabitID*)objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *statuses;

- (NSMutableSet*)statusesSet;





@end

@interface _Habit (CoreDataGeneratedAccessors)

- (void)addStatuses:(NSSet*)value_;
- (void)removeStatuses:(NSSet*)value_;
- (void)addStatusesObject:(Status*)value_;
- (void)removeStatusesObject:(Status*)value_;

@end

@interface _Habit (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveStatuses;
- (void)setPrimitiveStatuses:(NSMutableSet*)value;


@end
