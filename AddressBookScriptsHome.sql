/****** Object:  Table [dbo].[City]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CityCode] [varchar](5) NULL,
	[StateID] [int] NULL,
	[UserID] [int] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateID] [int] NOT NULL,
	[CityID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Gender] [varchar](50) NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[WhatsAppNo] [varchar](50) NULL,
	[EmailID] [varchar](100) NOT NULL,
	[Address] [varchar](500) NULL,
	[DoB] [datetime] NULL,
	[FaceBookID] [varchar](100) NULL,
	[InstagramID] [varchar](100) NULL,
	[BloodGroup] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
 CONSTRAINT [PK__Contact__5C6625BB1F9B75FB] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactCategoryName] [varchar](100) NULL,
	[UserID] [int] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactWiseContactCategory]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactWiseContactCategory](
	[ContactWiseContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ContactID] [int] NOT NULL,
	[ContactCategoryID] [int] NOT NULL,
	[UserID] [int] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactWiseContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryCode] [varchar](5) NULL,
	[CountryCapital] [varchar](100) NULL,
	[UserID] [int] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NULL,
	[StateCode] [varchar](5) NULL,
	[StateCapital] [varchar](100) NULL,
	[CountryID] [int] NULL,
	[UserID] [int] NULL,
	[CreationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[DisplayName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (5, N'Jamnagar', N'JAM', 6, 6, CAST(N'2024-10-29T15:44:41.523' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (6, N'Gondal', N'GDLt', 7, 6, CAST(N'2024-10-29T15:44:47.920' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (8, N'Jamnagar', N'JAM', 7, 6, CAST(N'2024-11-08T14:07:12.257' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (9, N'Rajkot', N'RJT', 7, 6, CAST(N'2024-11-08T18:01:25.757' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (10, N'Morbi', N'MB', 7, 6, CAST(N'2024-11-08T18:01:44.793' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (11, N'Ahmedabad', N'ADI', 7, 6, CAST(N'2024-11-08T18:01:57.847' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (12, N'Gandhinagar', N'GDN', 7, 6, CAST(N'2024-11-08T18:02:12.950' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (13, N'Junagadh', N'JDH', 7, 6, CAST(N'2024-11-08T18:02:25.277' AS DateTime))
INSERT [dbo].[City] ([CityID], [CityName], [CityCode], [StateID], [UserID], [CreationDate]) VALUES (14, N'Jetpur', N'JTR', 7, 6, CAST(N'2024-11-08T18:02:37.297' AS DateTime))
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactID], [CountryID], [StateID], [CityID], [UserID], [Name], [Gender], [MobileNo], [WhatsAppNo], [EmailID], [Address], [DoB], [FaceBookID], [InstagramID], [BloodGroup], [CreationDate]) VALUES (18, 17, 6, 5, 6, N'Achyut Dhaduk', N'Male', N'9726989368', N'8887778889', N'aman@gmail.com', N'gondal', CAST(N'2024-10-24T00:00:00.000' AS DateTime), N'qqq', N'qqq', N'B+', CAST(N'2024-10-29T15:46:26.280' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CountryID], [StateID], [CityID], [UserID], [Name], [Gender], [MobileNo], [WhatsAppNo], [EmailID], [Address], [DoB], [FaceBookID], [InstagramID], [BloodGroup], [CreationDate]) VALUES (19, 17, 6, 5, 6, N'Gautam', N'Male', N'9099945900', N'9992499945', N'gautam@gmail.com', N'rajkot', CAST(N'2024-11-09T00:00:00.000' AS DateTime), N'qqq', N'', N'A-', CAST(N'2024-11-05T16:49:52.310' AS DateTime))
INSERT [dbo].[Contact] ([ContactID], [CountryID], [StateID], [CityID], [UserID], [Name], [Gender], [MobileNo], [WhatsAppNo], [EmailID], [Address], [DoB], [FaceBookID], [InstagramID], [BloodGroup], [CreationDate]) VALUES (20, 16, 7, 6, 6, N'Kashyap', N'Male', N'9099945900', N'9992499945', N'KASHYAP@gmail.com', N'JAMNAGAR', CAST(N'2024-10-30T00:00:00.000' AS DateTime), N'qwwww', N'', N'A-', CAST(N'2024-11-05T17:58:12.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactCategory] ON 

INSERT [dbo].[ContactCategory] ([ContactCategoryID], [ContactCategoryName], [UserID], [CreationDate]) VALUES (8, N'Friend', 6, CAST(N'2024-10-29T15:45:25.707' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [ContactCategoryName], [UserID], [CreationDate]) VALUES (10, N'Family', 6, CAST(N'2024-11-05T16:49:30.297' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [ContactCategoryName], [UserID], [CreationDate]) VALUES (11, N'business', 6, CAST(N'2024-11-05T17:57:27.753' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [ContactCategoryName], [UserID], [CreationDate]) VALUES (12, N'type 1', 6, CAST(N'2024-11-05T17:57:34.373' AS DateTime))
INSERT [dbo].[ContactCategory] ([ContactCategoryID], [ContactCategoryName], [UserID], [CreationDate]) VALUES (13, N'type 2', 6, CAST(N'2024-11-05T17:57:41.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactWiseContactCategory] ON 

INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (26, 18, 8, 6, CAST(N'2024-10-29T15:46:26.283' AS DateTime))
INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (27, 19, 10, 6, CAST(N'2024-11-05T16:49:52.310' AS DateTime))
INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (28, 19, 8, 6, CAST(N'2024-11-05T16:49:52.310' AS DateTime))
INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (29, 20, 11, 6, CAST(N'2024-11-05T17:58:12.613' AS DateTime))
INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (30, 20, 10, 6, CAST(N'2024-11-05T17:58:12.617' AS DateTime))
INSERT [dbo].[ContactWiseContactCategory] ([ContactWiseContactCategoryID], [ContactID], [ContactCategoryID], [UserID], [CreationDate]) VALUES (31, 20, 12, 6, CAST(N'2024-11-05T17:58:12.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactWiseContactCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryCode], [CountryCapital], [UserID], [CreationDate]) VALUES (16, N'India', N'IN', N'New Delhi', 6, CAST(N'2024-10-29T15:34:01.393' AS DateTime))
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryCode], [CountryCapital], [UserID], [CreationDate]) VALUES (17, N'Brazil', N'BR', N'Rio', 6, CAST(N'2024-10-29T15:34:13.083' AS DateTime))
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryCode], [CountryCapital], [UserID], [CreationDate]) VALUES (18, N'United States Of America', N'USA', N'Washington DC', 6, CAST(N'2024-11-06T09:48:08.837' AS DateTime))
INSERT [dbo].[Country] ([CountryID], [CountryName], [CountryCode], [CountryCapital], [UserID], [CreationDate]) VALUES (19, N'Canada', N'CAD', N'Toronto', 6, CAST(N'2024-11-06T10:15:40.200' AS DateTime))
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [StateCapital], [CountryID], [UserID], [CreationDate]) VALUES (6, N'Rajasthan', N'RJ', N'Jaipur', 17, 6, CAST(N'2024-10-29T15:34:27.493' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [StateCapital], [CountryID], [UserID], [CreationDate]) VALUES (7, N'Gujarat', N'GJ', N'Gandhinagar', 16, 6, CAST(N'2024-10-29T15:34:40.327' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [StateCapital], [CountryID], [UserID], [CreationDate]) VALUES (9, N'Moscow', N'MS', N'Moscow Capital', 18, 6, CAST(N'2024-11-06T10:15:08.190' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [StateCapital], [CountryID], [UserID], [CreationDate]) VALUES (11, N'Rajasthan', N'RJt', N'Jaipur', 16, 6, CAST(N'2024-11-08T12:33:48.973' AS DateTime))
INSERT [dbo].[State] ([StateID], [StateName], [StateCode], [StateCapital], [CountryID], [UserID], [CreationDate]) VALUES (12, N'Rajasthant', N'dd', N'Jaipur', 19, 6, CAST(N'2024-11-09T09:55:44.837' AS DateTime))
SET IDENTITY_INSERT [dbo].[State] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [Password], [DisplayName], [Email], [CreationDate], [ModificationDate]) VALUES (6, N'aman_sangani', N'3c8317a275e875e8f750f544a08fac6f', N'Aman Sangani', N'sanganiaman1310@gmail.com', CAST(N'2024-10-29T15:33:49.450' AS DateTime), CAST(N'2024-10-29T15:33:49.450' AS DateTime))
INSERT [dbo].[User] ([UserID], [Username], [Password], [DisplayName], [Email], [CreationDate], [ModificationDate]) VALUES (7, N'gautam', N'3c8317a275e875e8f750f544a08fac6f', N'Gautam', N'21dce113@charusat.edu.in', CAST(N'2024-11-09T11:34:21.200' AS DateTime), CAST(N'2024-11-09T11:34:21.200' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Contact__7ED91AEE99CE77FB]    Script Date: 09-11-2024 06:50:34 PM ******/
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [UQ__Contact__7ED91AEE99CE77FB] UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Country__5D9B0D2C37449B36]    Script Date: 09-11-2024 06:50:34 PM ******/
ALTER TABLE [dbo].[Country] ADD UNIQUE NONCLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__536C85E4031E311E]    Script Date: 09-11-2024 06:50:34 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D10534EE80AF3A]    Script Date: 09-11-2024 06:50:34 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF__Contact__Creatio__797309D9]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ContactCategory] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ContactWiseContactCategory] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Country] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[State] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK__Contact__CityID__787EE5A0] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([CityID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK__Contact__CityID__787EE5A0]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK__Contact__Country__76969D2E] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK__Contact__Country__76969D2E]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK__Contact__StateID__778AC167] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK__Contact__StateID__778AC167]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK__Contact__UserID__7A672E12] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK__Contact__UserID__7A672E12]
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD  CONSTRAINT [FK__ContactWi__Conta__7E37BEF6] FOREIGN KEY([ContactID])
REFERENCES [dbo].[Contact] ([ContactID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory] CHECK CONSTRAINT [FK__ContactWi__Conta__7E37BEF6]
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[ContactWiseContactCategory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
/****** Object:  StoredProcedure [dbo].[PR_City_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_DeleteByPK]
    @CityID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[City]
    WHERE CityID = @CityID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_City_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_Insert]
    @CityName VARCHAR(100),
    @CityCode VARCHAR(5),
    @StateID INT,
    @UserID INT
AS
    INSERT INTO [dbo].[City]
        (CityName, CityCode, StateID, UserID)
    VALUES
        (@CityName, @CityCode, @StateID, @UserID);
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectAll]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectAll]
    @UserID INT
AS
    SELECT 
        CityID,
        CityName,
        CityCode
    FROM [dbo].[City]
    WHERE UserID = @UserID
    ORDER BY CityName;


GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByPK]
    @UserID INT,
	@CityID	int
AS
    SELECT
		city.[CityName],
		city.[CityCode],
		city.[StateID],
		state.[CountryID]
	FROM [dbo].[City] city
	INNER JOIN [dbo].[State] state ON city.StateID = state.StateID
    WHERE city.UserID = @UserID
	AND CityID = @CityID
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByStateID]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectByStateID]
    @StateID INT,
    @UserID INT
AS
    SELECT 
        CityID,
        CityName,
        CityCode
    FROM [dbo].[City]
    WHERE StateID = @StateID AND UserID = @UserID
    ORDER BY CityName;
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectByStateIDAndSearch]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_City_SelectByStateIDAndSearch]
    @StateID INT,
	@CityName	VARCHAR(100),
	@CityCode	VARCHAR(100),
    @UserID INT
AS
    SELECT 
        CityID,
        CityName,
        CityCode
    FROM [dbo].[City]
    WHERE StateID = @StateID AND UserID = @UserID
	AND
		(@CityName IS NULL OR CityName LIKE '%' + @CityName + '%')
		AND
		(@CityCode IS NULL OR CityCode LIKE '%' + @CityCode + '%')
    ORDER BY CityName;
GO
/****** Object:  StoredProcedure [dbo].[PR_City_SelectForDropDown]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_SelectForDropDown]
    @StateID INT,
    @UserID INT
AS
    SELECT 
        CityID,
        CityName
    FROM [dbo].[City]
    WHERE StateID = @StateID AND UserID = @UserID
    ORDER BY CityName;
GO
/****** Object:  StoredProcedure [dbo].[PR_City_UpdateByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_City_UpdateByPK]
    @CityID INT,
    @CityName VARCHAR(100),
    @CityCode VARCHAR(5),
    @StateID INT,
    @UserID INT
AS
    UPDATE [dbo].[City]
    SET
        CityName = @CityName,
        CityCode = @CityCode,
        StateID = @StateID
    WHERE CityID = @CityID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_DeleteByPK]
    @ContactID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[Contact]
    WHERE [dbo].[Contact].[ContactID] = @ContactID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Contact_Insert]
    @CountryID INT,
    @StateID INT,
    @CityID INT,
    @Name VARCHAR(100),
    @Gender VARCHAR(50),
    @MobileNo VARCHAR(15),
    @WhatsappNo VARCHAR(15),
    @EmailID VARCHAR(100),
    @Address VARCHAR(500),
    @DoB DATE,
    @FaceBookID VARCHAR(100),
    @InstagramID VARCHAR(100),
    @BloodGroup VARCHAR(5),
	@ContactID INT OUT,	
    @UserID INT	
AS
    INSERT INTO [dbo].[Contact]
        (CountryID, StateID, CityID, Name, Gender, MobileNo, WhatsAppNo, EmailID, Address, DoB, FaceBookID, InstagramID, BloodGroup, UserID)
    VALUES
        (@CountryID, @StateID, @CityID, @Name, @Gender, @MobileNo, @WhatsAppNo, @EmailID, @Address, @DoB, @FaceBookID, @InstagramID, @BloodGroup, @UserID);
 SET @ContactID = SCOPE_IDENTITY();
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectAll]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_Contact_SelectAll]
    @UserID INT
AS
    SELECT 
        contact.[ContactID],
        contact.[Name],
        STRING_AGG(cc.[ContactCategoryName], ', ') AS ContactCategory
    FROM 
        [dbo].[Contact] contact
    LEFT JOIN 
        [dbo].[ContactWiseContactCategory] cwc ON contact.ContactID = cwc.ContactID
    LEFT JOIN 
        [dbo].[ContactCategory] cc ON cwc.ContactCategoryID = cc.ContactCategoryID
    WHERE contact.UserID = @UserID
    GROUP BY 
        contact.[ContactID], 
        contact.[Name]
    ORDER BY contact.[Name];
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Contact_SelectByPK]
    @ContactID INT,
    @UserID INT
AS
	SELECT 
		contact.[ContactID],
		country.[CountryID],
		country.[CountryName],
		state.[StateID],
		state.[StateName],
		city.[CityID],
		city.[CityName],
		contact.[Name],
		contact.[Gender],
		contact.[MobileNo],
		contact.[WhatsAppNo],
		contact.[EmailID],
		contact.[Address],
		contact.[DoB],
		contact.[FaceBookID],
		contact.[InstagramID],
		contact.[BloodGroup]
	FROM [dbo].[Contact] contact
	JOIN [dbo].[Country] country ON contact.CountryID = country.CountryID
	JOIN [dbo].[State] state ON contact.StateID = state.StateID
	JOIN [dbo].[City] city ON contact.CityID = city.CityID
	WHERE contact.[ContactID] = @ContactID
    AND contact.UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_SelectForSearch]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_Contact_SelectForSearch]
	@CountryID		INT,
	@StateID		INT,
	@CityID			INT,
	@ContactName	VARCHAR(100),
	@ContactNo		VARCHAR(100),
	@Email			VARCHAR(100),
	@UserID INT
AS
	    SELECT 
        contact.[ContactID],
        contact.[Name],
        STRING_AGG(cc.[ContactCategoryName], ', ') AS ContactCategory
    FROM 
        [dbo].[Contact] contact
    LEFT JOIN 
        [dbo].[ContactWiseContactCategory] cwc ON contact.ContactID = cwc.ContactID
    LEFT JOIN 
        [dbo].[ContactCategory] cc ON cwc.ContactCategoryID = cc.ContactCategoryID
    WHERE contact.UserID = @UserID
	AND
		(@ContactName IS NULL OR Name LIKE '%' + @ContactName + '%')
		AND
		(@ContactNo IS NULL OR MobileNo LIKE @ContactNo + '%')
		AND
		(@Email IS NULL OR EmailID LIKE '%' + @Email + '%')
		AND
		(@CountryID IS NULL OR CountryID = @CountryID)
		AND
		(@StateID IS NULL OR StateID = @StateID)
		AND
		(@CityID IS NULL OR CityID LIKE @CityID)
    GROUP BY 
        contact.[ContactID], 
        contact.[Name]
    ORDER BY contact.[Name];

GO
/****** Object:  StoredProcedure [dbo].[PR_Contact_UpdateByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Contact_UpdateByPK]
    @ContactID INT,
    @CountryID INT,
    @StateID INT,
    @CityID INT,
    @Name VARCHAR(100),
    @Gender VARCHAR(50),
    @MobileNo VARCHAR(15),
    @WhatsAppNo VARCHAR(15),
    @EmailID VARCHAR(100),
    @Address VARCHAR(500),
    @DoB DATE,
    @FaceBookID VARCHAR(100),
    @InstagramID VARCHAR(100),
    @BloodGroup VARCHAR(5),
    @UserID INT
AS
    UPDATE [dbo].[Contact]
    SET 
        CountryID = @CountryID,
        StateID = @StateID,
        CityID = @CityID,
        Name = @Name,
        Gender = @Gender,
        MobileNo = @MobileNo,
        WhatsAppNo = @WhatsAppNo,
        EmailID = @EmailID,
        Address = @Address,
        DoB = @DoB,
        FaceBookID = @FaceBookID,
        InstagramID = @InstagramID,
        BloodGroup = @BloodGroup
    WHERE ContactID = @ContactID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_DeleteByPK]
    @ContactCategoryID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[ContactCategory]
    WHERE ContactCategoryID = @ContactCategoryID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_Insert]
    @ContactCategoryName VARCHAR(100),
    @UserID INT
AS
    INSERT INTO [dbo].[ContactCategory]
        (ContactCategoryName, UserID)
    VALUES
        (@ContactCategoryName, @UserID);
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectAll]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectAll]
    @UserID INT
AS
    SELECT 
        ContactCategoryID,
        ContactCategoryName
    FROM [dbo].[ContactCategory]
    WHERE UserID = @UserID
    ORDER BY ContactCategoryName;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_SelectByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_ContactCategory_SelectByPK]
    @ContactCategoryID INT,
    @UserID INT
AS
    SELECT 
        ContactCategoryID,
        ContactCategoryName
    FROM [dbo].[ContactCategory]
    WHERE ContactCategoryID = @ContactCategoryID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactCategory_UpdateByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactCategory_UpdateByPK]
    @ContactCategoryID INT,
    @ContactCategoryName VARCHAR(100),
    @UserID INT
AS
    UPDATE [dbo].[ContactCategory]
    SET 
        ContactCategoryName = @ContactCategoryName
    WHERE ContactCategoryID = @ContactCategoryID AND UserID = @UserID;

GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_DeleteByPK]
    @ContactID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[ContactWiseContactCategory]
    WHERE ContactID = @ContactID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_Insert]
    @ContactID INT,
    @ContactCategoryID INT,
    @UserID INT
AS
    INSERT INTO [dbo].[ContactWiseContactCategory]
        (ContactID, ContactCategoryID, UserID)
    VALUES
        (@ContactID, @ContactCategoryID, @UserID);
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_SelectAll]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_SelectAll]
    @UserID INT
AS
    SELECT 
        ContactWiseContactCategoryID,
        ContactID,
        ContactCategoryID
    FROM [dbo].[ContactWiseContactCategory]
    WHERE UserID = @UserID;

GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategory_SelectByContactID]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategory_SelectByContactID]
    @ContactID INT,
    @UserID INT
AS
    SELECT 
        ContactWiseContactCategoryID,
        ContactID,
        ContactCategoryID
    FROM [dbo].[ContactWiseContactCategory]
    WHERE ContactID = @ContactID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_ContactWiseContactCategoryID_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_ContactWiseContactCategoryID_Insert]
    @ContactID INT,
    @ContactCategoryID INT,
    @UserID INT
AS
    INSERT INTO [dbo].[ContactWiseContactCategory]
        (ContactID, ContactCategoryID, UserID)
    VALUES
        (@ContactID, @ContactCategoryID, @UserID);
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_DeleteByPK]
    @CountryID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[Country]
    WHERE CountryID = @CountryID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_Insert]
    @CountryName VARCHAR(100),
    @CountryCode VARCHAR(5),
    @CountryCapital VARCHAR(100),
    @UserID INT
AS
    INSERT INTO [dbo].[Country]
        (CountryName, CountryCode, CountryCapital, UserID)
    VALUES
        (@CountryName, @CountryCode, @CountryCapital, @UserID);

GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectAll]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Country_SelectAll]
    @UserID			INT,
	@CountryName	VARCHAR(100),
	@CountryCode	VARCHAR(100)
AS
    SELECT
        CountryID,
        CountryName,
        CountryCode,
        CountryCapital
    FROM [dbo].[Country]
    WHERE UserID = @UserID
	AND 
		(@CountryName IS NULL OR CountryName LIKE '%' + @CountryName + '%')
		AND
		(@CountryCode IS NULL OR CountryCode LIKE '%' + @CountryCode + '%')
    ORDER BY CountryName;
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectByPK]
    @CountryID INT,
    @UserID INT
AS
    SELECT 
        CountryID,
        CountryName,
        CountryCode,
        CountryCapital
    FROM [dbo].[Country]
    WHERE CountryID = @CountryID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_Country_SelectForDropDown]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_SelectForDropDown]
    @UserID INT
AS
    SELECT 
        CountryID,
        CountryName
    FROM [dbo].[Country]
    WHERE UserID = @UserID
    ORDER BY CountryName;

GO
/****** Object:  StoredProcedure [dbo].[PR_Country_UpdateByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Country_UpdateByPK]
    @CountryID INT,
    @CountryName VARCHAR(100),
    @CountryCode VARCHAR(5),
    @CountryCapital VARCHAR(100),
    @UserID INT
AS
    UPDATE Country
    SET 
        CountryName = @CountryName,
        CountryCode = @CountryCode,
        CountryCapital = @CountryCapital
    WHERE CountryID = @CountryID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_State_DeleteByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_DeleteByPK]
    @StateID INT,
    @UserID INT
AS
    DELETE FROM [dbo].[State]
    WHERE StateID = @StateID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_State_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_Insert]
    @StateName VARCHAR(100),
    @StateCode VARCHAR(5),
    @StateCapital VARCHAR(100),
    @CountryID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[State]
        (StateName, StateCode, StateCapital, CountryID, UserID)
    VALUES
        (@StateName, @StateCode, @StateCapital, @CountryID, @UserID);
END
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByCountryID]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectByCountryID]
    @CountryID INT,
    @UserID INT
AS
    SELECT 
        StateID,
        StateName,
        StateCode,
        StateCapital
    FROM [dbo].[State]
    WHERE CountryID = @CountryID AND UserID = @UserID
    ORDER BY StateName;
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByCountryIDAndSearch]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectByCountryIDAndSearch]
    @CountryID INT,
	@StateName VARCHAR(100),
	@StateCode VARCHAR(100),
	@StateCapital VARCHAR(100),
    @UserID INT
AS
    SELECT 
        StateID,
        StateName,
        StateCode,
        StateCapital
    FROM [dbo].[State]
    WHERE CountryID = @CountryID AND UserID = @UserID
	AND
		(@StateName IS NULL OR StateName LIKE '%' + @StateName + '%')
		AND
		(@StateCode IS NULL OR StateCode LIKE '%' + @StateCode + '%')
		AND
		(@StateCapital IS NULL OR StateCapital LIKE '%' + @StateCapital + '%')
    ORDER BY StateName;
GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_State_SelectByPK]
    @StateID INT,
    @UserID INT
AS
    SELECT 
        StateID,
        StateName,
        StateCode,
        StateCapital,
        CountryID
    FROM [dbo].[State]
    WHERE StateID = @StateID AND UserID = @UserID;

GO
/****** Object:  StoredProcedure [dbo].[PR_State_SelectForDropDown]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_SelectForDropDown]
    @CountryID INT,
    @UserID INT
AS
    SELECT 
        StateID,
        StateName
    FROM [dbo].[State]
    WHERE CountryID = @CountryID AND UserID = @UserID
    ORDER BY StateName;
GO
/****** Object:  StoredProcedure [dbo].[PR_State_UpdateByPK]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_State_UpdateByPK]
    @StateID INT,
    @StateName VARCHAR(100),
    @StateCode VARCHAR(5),
    @StateCapital VARCHAR(100),
    @CountryID INT,
    @UserID INT
AS
    UPDATE State
    SET
        StateName = @StateName,
        StateCode = @StateCode,
        StateCapital = @StateCapital,
        CountryID = @CountryID
    WHERE StateID = @StateID AND UserID = @UserID;
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Insert]
    @Username VARCHAR(50),
    @Password VARCHAR(500),
    @DisplayName VARCHAR(100),
    @Email VARCHAR(100)
AS
    INSERT INTO [dbo].[User] 
		(
			Username, 
			Password, 
			DisplayName, 
			Email
		)
    VALUES 
		(
			@Username,
			@Password, 
			@DisplayName,
			@Email
		)
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectForDropDown]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_SelectForDropDown]
AS
	SELECT 
		[dbo].[User].[UserID],
		[dbo].[User].[DisplayName]
	FROM [dbo].[User]
	ORDER BY [dbo].[User].[DisplayName]
GO
/****** Object:  StoredProcedure [dbo].[PR_User_ValidateLogin]    Script Date: 09-11-2024 06:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_ValidateLogin]
    @Username VARCHAR(50),
    @Password VARCHAR(500)
AS
    SELECT 
		UserID,
		Username,
		DisplayName,
		Email
    FROM [dbo].[User]
    WHERE Username = @Username AND Password = @Password
GO
