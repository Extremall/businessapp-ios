// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BANews.m instead.

#import "_BANews.h"

const struct BANewsAttributes BANewsAttributes = {
	.content = @"content",
	.date = @"date",
	.newsID = @"newsID",
	.title = @"title",
	.type = @"type",
};

const struct BANewsRelationships BANewsRelationships = {
};

const struct BANewsFetchedProperties BANewsFetchedProperties = {
};

@implementation BANewsID
@end

@implementation _BANews

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BANews" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BANews";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BANews" inManagedObjectContext:moc_];
}

- (BANewsID*)objectID {
	return (BANewsID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"newsIDValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"newsID"];
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




@dynamic content;






@dynamic date;






@dynamic newsID;



- (int32_t)newsIDValue {
	NSNumber *result = [self newsID];
	return [result intValue];
}

- (void)setNewsIDValue:(int32_t)value_ {
	[self setNewsID:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNewsIDValue {
	NSNumber *result = [self primitiveNewsID];
	return [result intValue];
}

- (void)setPrimitiveNewsIDValue:(int32_t)value_ {
	[self setPrimitiveNewsID:[NSNumber numberWithInt:value_]];
}





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
