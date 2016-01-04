SELECT [VirtPackItemID]
      ,[VPGearName] as 'name'
      ,[VPGearDescription] as 'description'
      ,[PostComments] as 'post_summary'
      ,[VPGearCategoryID] as 'category_id'
      ,[Highlight] as 'highlight'
      ,[VPGearWeightOZ] as 'weight_oz'
      ,null as 'weight_grams'
      ,null as 'manufacturer'
      ,null as 'item_count'
      ,[EventID] as 'event_id'
	  ,null as 'icon'
      ,[UserID] as 'user_id'
      ,[GearID] as 'gear_id'
      ,[Wearing] as 'wearing'
      ,[Delivery] as 'delivery'
	  ,null as 'inventory'
      ,[Shareable] as 'sharing_status'
	  ,null as 'year_acquired'
  FROM [tfdb].[kent_anderson].[VirtPack]
	WHERE [UserID] = 1
GO


