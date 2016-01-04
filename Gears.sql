SELECT [GearID] as 'ignore1'
      ,[ItemName] as 'name'
      ,[Description] as 'description'
      ,[WeightOZ] as 'weight_oz'
      ,null as 'weight_grams'
      ,null as 'icon'
      ,[Category] as 'category_id'
	  ,'' as 'manufacturer'
      ,[SourceUserID] as 'user_id'
      ,'' as 'year_acquired'
  FROM [tfdb].[kent_anderson].[Gear]
  WHERE [SourceUserID] = 1
GO


