// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BAAnnounce.m instead.

#import "_BAAnnounce.h"

const struct BAAnnounceAttributes BAAnnounceAttributes = {
	.announceID = @"announceID",
	.content = @"content",
	.imageURL = @"imageURL",
	.title = @"title",
	.type = @"type",
};

const struct BAAnnounceRelationships BAAnnounceRelationships = {
};

const struct BAAnnounceFetchedProperties BAAnnounceFetchedProperties = {
};

@implementation BAAnnounceID
@end

@implementation _BAAnnounce

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BAAnnounce" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BAAnnounce";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BAAnnounce" inManagedObjectContext:moc_];
}

- (BAAnnounceID*)objectID {
	return (BAAnnounceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"announceIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"announceID"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic announceID;



- (int32_t)announceIDValue {
	NSNumber *result = [self announceID];
	return [result intValue];
}

- (void)setAnnounceIDValue:(int32_t)value_ {
	[self setAnnounceID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAnnounceIDValue {
	NSNumber *result = [self primitiveAnnounceID];
	return [result intValue];
}

- (void)setPrimitiveAnnounceIDValue:(int32_t)value_ {
	[self setPrimitiveAnnounceID:[NSNumber numberWithInt:value_]];
}





@dynamic content;






@dynamic imageURL;






@dynamic title;






@dynamic type;



- (int32_t)typeValue {
	NSNumber *result = [self type];
	return [result intValue];
}

- (void)setTypeValue:(int32_t)value_ {
	[self setType:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTypeValue {
	NSNumber *result = [self primitiveType];
	return [result intValue];
}

- (void)setPrimitiveTypeValue:(int32_t)value_ {
	[self setPrimitiveType:[NSNumber numberWithInt:value_]];
}










@end
