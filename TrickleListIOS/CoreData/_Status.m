// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Status.m instead.

#import "_Status.h"

const struct StatusAttributes StatusAttributes = {
	.creationDate = @"creationDate",
};

const struct StatusRelationships StatusRelationships = {
	.habit = @"habit",
};

const struct StatusFetchedProperties StatusFetchedProperties = {
};

@implementation StatusID
@end

@implementation _Status

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Status";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Status" inManagedObjectContext:moc_];
}

- (StatusID*)objectID {
	return (StatusID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic creationDate;






@dynamic habit;

	






@end
