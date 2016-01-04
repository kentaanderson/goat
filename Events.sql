SELECT [EventID]
      ,[EventName] as 'title'
      ,[EventMapLink] as 'map_url'
      ,[EventComments] as 'description'
      ,null as 'comments'
      ,null as 'summary'
      ,[ShareID] as 'sharing_status'
      ,[CreatedBy] as 'user_id'
      ,[EventStartDate] as 'start_date'
      ,[EventEndDate] as 'return_date'
  FROM [tfdb].[kent_anderson].[Events]
GO


