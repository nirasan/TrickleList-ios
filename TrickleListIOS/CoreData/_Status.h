// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Status.h instead.

#import <CoreData/CoreData.h>


extern const struct StatusAttributes {
	__unsafe_unretained NSString *creationDate;
} StatusAttributes;

extern const struct StatusRelationships {
	__unsafe_unretained NSString *habit;
} StatusRelationships;

extern const struct StatusFetchedProperties {
} StatusFetchedProperties;

@class Habit;



@interface StatusID : NSManagedObjectID {}
@end

@interface _Status : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (StatusID*)objectID;





@property (nonatomic, strong) NSDate* creationDate;



//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Habit *habit;

//- (BOOL)validateHabit:(id*)value_ error:(NSError**)error_;





@end

@interface _Status (CoreDataGeneratedAccessors)

@end

@interface _Status (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;





- (Habit*)primitiveHabit;
- (void)setPrimitiveHabit:(Habit*)value;


@end
