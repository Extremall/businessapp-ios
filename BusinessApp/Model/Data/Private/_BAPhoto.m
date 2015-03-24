// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BAPhoto.m instead.

#import "_BAPhoto.h"

const struct BAPhotoAttributes BAPhotoAttributes = {
	.desc = @"desc",
	.photoID = @"photoID",
	.url = @"url",
};

const struct BAPhotoRelationships BAPhotoRelationships = {
};

const struct BAPhotoFetchedProperties BAPhotoFetchedProperties = {
};

@implementation BAPhotoID
@end

@implementation _BAPhoto

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BAPhoto" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BAPhoto";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BAPhoto" inManagedObjectContext:moc_];
}

- (BAPhotoID*)objectID {
	return (BAPhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"photoIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"photoID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic desc;






@dynamic photoID;



- (int32_t)photoIDValue {
	NSNumber *result = [self photoID];
	return [result intValue];
}

- (void)setPhotoIDValue:(int32_t)value_ {
	[self setPhotoID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitivePhotoIDValue {
	NSNumber *result = [self primitivePhotoID];
	return [result intValue];
}

- (void)setPrimitivePhotoIDValue:(int32_t)value_ {
	[self setPrimitivePhotoID:[NSNumber numberWithInt:value_]];
}





@dynamic url;











@end
