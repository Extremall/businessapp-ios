// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.m instead.

#import "_Item.h"

const struct ItemAttributes ItemAttributes = {
	.imageURL = @"imageURL",
	.isFolder = @"isFolder",
	.itemID = @"itemID",
	.name = @"name",
};

const struct ItemRelationships ItemRelationships = {
	.children = @"children",
	.parent = @"parent",
};

const struct ItemFetchedProperties ItemFetchedProperties = {
};

@implementation ItemID
@end

@implementation _Item

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Item";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Item" inManagedObjectContext:moc_];
}

- (ItemID*)objectID {
	return (ItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isFolderValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isFolder"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"itemIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"itemID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic imageURL;






@dynamic isFolder;



- (BOOL)isFolderValue {
	NSNumber *result = [self isFolder];
	return [result boolValue];
}

- (void)setIsFolderValue:(BOOL)value_ {
	[self setIsFolder:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsFolderValue {
	NSNumber *result = [self primitiveIsFolder];
	return [result boolValue];
}

- (void)setPrimitiveIsFolderValue:(BOOL)value_ {
	[self setPrimitiveIsFolder:[NSNumber numberWithBool:value_]];
}





@dynamic itemID;



- (int32_t)itemIDValue {
	NSNumber *result = [self itemID];
	return [result intValue];
}

- (void)setItemIDValue:(int32_t)value_ {
	[self setItemID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveItemIDValue {
	NSNumber *result = [self primitiveItemID];
	return [result intValue];
}

- (void)setPrimitiveItemIDValue:(int32_t)value_ {
	[self setPrimitiveItemID:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic children;

	
- (NSMutableSet*)childrenSet {
	[self willAccessValueForKey:@"children"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"children"];
  
	[self didAccessValueForKey:@"children"];
	return result;
}
	

@dynamic parent;

	






@end
