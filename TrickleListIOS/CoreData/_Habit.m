// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Habit.m instead.

#import "_Habit.h"

const struct HabitAttributes HabitAttributes = {
	.creationDate = @"creationDate",
	.name = @"name",
};

const struct HabitRelationships HabitRelationships = {
	.statuses = @"statuses",
};

const struct HabitFetchedProperties HabitFetchedProperties = {
};

@implementation HabitID
@end

@implementation _Habit

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Habit" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Habit";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Habit" inManagedObjectContext:moc_];
}

- (HabitID*)objectID {
	return (HabitID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic creationDate;






@dynamic name;






@dynamic statuses;

	
- (NSMutableSet*)statusesSet {
	[self willAccessValueForKey:@"statuses"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statuses"];
  
	[self didAccessValueForKey:@"statuses"];
	return result;
}
	






@end
