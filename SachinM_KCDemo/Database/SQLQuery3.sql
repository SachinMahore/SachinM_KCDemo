USE [SachinM_KCDemo]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBookList]    Script Date: 09/06/2020 1:16:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetBookList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetBookList]
GO
/****** Object:  Table [dbo].[tbl_Book]    Script Date: 09/06/2020 1:16:18 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Book]') AND type in (N'U'))
DROP TABLE [dbo].[tbl_Book]
GO
/****** Object:  Table [dbo].[tbl_Book]    Script Date: 09/06/2020 1:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tbl_Book]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tbl_Book](
	[BookID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[ISBN] [nvarchar](20) NULL,
	[Author] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Photo] [nvarchar](500) NULL,
 CONSTRAINT [PK_tbl_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[tbl_Book] ON 

GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (1, N'test book updated by API', N'452563568657', N'Sachin Mahore', N'Thkis is test bokk for PUT Bookstor aPI', N'51Wrlbko5QL.jpg')
GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (2, N'Manipulation and Dark Psychology', N'654445865895', N'Daniel Thompson', N'Manipulation and dark psychology strategies are utilized by individuals around us consistently to manipulate, pressure, and impact us to get what they need.

Dark psychology is the art and study of manipulation and mind control. While psychology is the study of human conduct and is integral to our contemplations, activities, and connections, the term dark psychology is the wonder by which individuals use strategies of inspiration, influence, manipulate and intimidation to get what they need.', N'51EiKVEXH8L._SL500_.jpg')
GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (3, N'Find Me: A Novel Paperback', N'523565865986', N' André Aciman', N'No novel in recent memory has spoken more movingly to contemporary readers about the nature of love than André Aciman’s haunting Call Me by Your Name. First published in 2007, it was hailed as “a love letter, an invocation . . . an exceptionally beautiful book', N'51xabESgKYL._AC_SX184_.jpg')
GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (4, N'The Patron Saint of Pregnant Girls', N'452535658578', N'Ursula Hegi', N'In the summer of 1878, the Ludwig Zirkus arrives on Nordstrand in Germany, to the delight of the island’s people. But after the show, a Hundred-Year Wave roars from the Nordsee and claims three young children', N'51XNdBVEb8L._SX336_BO1,204,203,200_.jpg')
GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (5, N'School Zone - Big Preschool Workbook', N'452451253526', N'School Zone', N'School Zone products shipped and sold by Amazon are genuine and authentic. Products sold by other sellers may be of lesser quality and are not guaranteed by School Zone.

Find our complete line of educational resources at Amazon.com/SchoolZonePublishing.', N'61xTjuVrwsL._AC_SX184_.jpg')
GO
INSERT [dbo].[tbl_Book] ([BookID], [Name], [ISBN], [Author], [Description], [Photo]) VALUES (6, N'Shyamchi Aai (Marathi Edition)', N'125654565656', N'Pandurang Sane ', N'Shyamchi Aai is an autobiography of Sane Guruji belonging to a Brahmin family in Konkan region of rural Maharashtra during British Raj. Sane Guruji (now an adult), fondly called Shyam during his childhood, is narrating his memories to a group of children in a nightly sitting. Chapters in the book are named ratra meaning "night" in Marathi. They are named first night, second night and so on. Every passing 5 the story takes you into the fa amily setting in rural Konkan and its beautiful seaside landscapes with adjoining ranges of Sahyadri. This book is representation of the love of mother for her child', N'51Cby1rEN8L._SX331_BO1,204,203,200_.jpg')
GO
SET IDENTITY_INSERT [dbo].[tbl_Book] OFF
GO
/****** Object:  StoredProcedure [dbo].[usp_GetBookList]    Script Date: 09/06/2020 1:16:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetBookList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[usp_GetBookList] AS' 
END
GO
ALTER PROCEDURE [dbo].[usp_GetBookList]
	@SearchText	VARCHAR(50)=NULL
AS
BEGIN
   IF (@SearchText=NULL)
	BEGIN
	SELECT	[BookID]      ,[Name]      ,[Description]      ,[Author]      ,[ISBN]  ,[Photo]    	FROM tbl_Book
		WHERE Name LIKE '%'+@SearchText+'%' OR @SearchText IS NULL  ORDER BY BookID ASC
	END
	ELSE
	BEGIN
	SELECT	[BookID]      ,[Name]      ,[Description]      ,[Author]      ,[ISBN]  ,[Photo]    	FROM tbl_Book
	END
END

GO
