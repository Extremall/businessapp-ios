// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.h instead.

#import <CoreData/CoreData.h>


extern const struct ItemAttributes {
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *isFolder;
	__unsafe_unretained NSString *itemID;
	__unsafe_unretained NSString *name;
} ItemAttributes;

extern const struct ItemRelationships {
	__unsafe_unretained NSString *children;
	__unsafe_unretained NSString *parent;
} ItemRelationships;

extern const struct ItemFetchedProperties {
} ItemFetchedProperties;

@class Item;
@class Item;






@interface ItemID : NSManagedObjectID {}
@end

@interface _Item : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ItemID*)objectID;





@property (nonatomic, strong) NSString* imageURL;



//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isFolder;



@property BOOL isFolderValue;
- (BOOL)isFolderValue;
- (void)setIsFolderValue:(BOOL)value_;

//- (BOOL)validateIsFolder:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* itemID;



@property int32_t itemIDValue;
- (int32_t)itemIDValue;
- (void)setItemIDValue:(int32_t)value_;

//- (BOOL)validateItemID:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *children;

- (NSMutableSet*)childrenSet;




@property (nonatomic, strong) Item *parent;

//- (BOOL)validateParent:(id*)value_ error:(NSError**)error_;





@end

@interface _Item (CoreDataGeneratedAccessors)

- (void)addChildren:(NSSet*)value_;
- (void)removeChildren:(NSSet*)value_;
- (void)addChildrenObject:(Item*)value_;
- (void)removeChildrenObject:(Item*)value_;

@end

@interface _Item (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;




- (NSNumber*)primitiveIsFolder;
- (void)setPrimitiveIsFolder:(NSNumber*)value;

- (BOOL)primitiveIsFolderValue;
- (void)setPrimitiveIsFolderValue:(BOOL)value_;




- (NSNumber*)primitiveItemID;
- (void)setPrimitiveItemID:(NSNumber*)value;

- (int32_t)primitiveItemIDValue;
- (void)setPrimitiveItemIDValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveChildren;
- (void)setPrimitiveChildren:(NSMutableSet*)value;



- (Item*)primitiveParent;
- (void)setPrimitiveParent:(Item*)value;


@end
