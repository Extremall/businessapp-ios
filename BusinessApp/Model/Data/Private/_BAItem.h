// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BAItem.h instead.

#import <CoreData/CoreData.h>


extern const struct BAItemAttributes {
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *isFolder;
	__unsafe_unretained NSString *itemID;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
} BAItemAttributes;

extern const struct BAItemRelationships {
	__unsafe_unretained NSString *children;
	__unsafe_unretained NSString *parent;
} BAItemRelationships;

extern const struct BAItemFetchedProperties {
} BAItemFetchedProperties;

@class BAItem;
@class BAItem;







@interface BAItemID : NSManagedObjectID {}
@end

@interface _BAItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BAItemID*)objectID;





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





@property (nonatomic, strong) NSString* price;



//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *children;

- (NSMutableSet*)childrenSet;




@property (nonatomic, strong) BAItem *parent;

//- (BOOL)validateParent:(id*)value_ error:(NSError**)error_;





@end

@interface _BAItem (CoreDataGeneratedAccessors)

- (void)addChildren:(NSSet*)value_;
- (void)removeChildren:(NSSet*)value_;
- (void)addChildrenObject:(BAItem*)value_;
- (void)removeChildrenObject:(BAItem*)value_;

@end

@interface _BAItem (CoreDataGeneratedPrimitiveAccessors)


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




- (NSString*)primitivePrice;
- (void)setPrimitivePrice:(NSString*)value;





- (NSMutableSet*)primitiveChildren;
- (void)setPrimitiveChildren:(NSMutableSet*)value;



- (BAItem*)primitiveParent;
- (void)setPrimitiveParent:(BAItem*)value;


@end
