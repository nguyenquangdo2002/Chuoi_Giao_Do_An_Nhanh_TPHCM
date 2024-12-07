Create database [quickbite411]
GO
USE [quickbite411]
GO
------------Bước 1 : 
/****** Object:  Table [dbo].[Contacts]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Flag] [int] NOT NULL,
	[Reply] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Links]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Links](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[TableId] [int] NULL,
 CONSTRAINT [PK_dbo.Links] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[TableId] [int] NULL,
	[ParentId] [int] NULL,
	[Position] [nvarchar](max) NULL,
	[Orders] [int] NOT NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Posts]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topid] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Created_At] [datetime] NOT NULL,
	[Created_By] [int] NULL,
	[Updated_At] [datetime] NOT NULL,
	[Updated_By] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRate]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rate] [float] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[UName] [nvarchar](50) NULL,
	[CreateAt] [datetime] NULL,
 CONSTRAINT [PK_ProductRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Sliders]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Link] [nvarchar](max) NULL,
	[Position] [nvarchar](max) NULL,
	[Img] [nvarchar](max) NULL,
	[Orders] [int] NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NULL,
	[Metadesc] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Topics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE Promotion (
    PromoID VARCHAR(10) PRIMARY KEY,  -- Promotion ID
    StartDate DATE,                    -- Start Date
    EndDate DATE,                      -- End Date
    Discount DECIMAL(5, 2)             -- Discount Percentage
);
/****** Object:  Table [dbo].[Categorys]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[ParentId] [int] NULL,
	[Orders] [int] NULL,
	[Metakey] [nvarchar](max) NULL,
	[Metadesc] [nvarchar](max) NULL,
	[Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Categorys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Slug] [nvarchar](max) NULL,
	[CateID] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[NewPromotion] [nvarchar](max) NULL,
	[Installment] [int] NOT NULL,
	[Discount] [int] NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Specification] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProPrice] [float] NOT NULL,
	[MetaKey] [nvarchar](max) NULL,
	[MetaDesc] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Created_by] [int] NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Updated_by] [int] NOT NULL,
	[ProRate] [float] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[OrderDetails]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Stores](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [Address] [nvarchar](max) NOT NULL,
    [Latitude] [float] NOT NULL,
    [Longitude] [float] NOT NULL,
    [OpenHours] [nvarchar](max) NOT NULL,
    [Description] [nvarchar](max) NULL,
    [MenuUrl] [nvarchar](max) NULL,
    [DeliveryUrl] [nvarchar](max) NULL,
    [Created_at] [datetime] NULL,
	[Created_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Updated_by] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_dbo.Stores] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Orders]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL ,
	[Code] [nvarchar](max) NULL,
	[CustemerId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ExportDate] [datetime] NULL,
	[DeliveryAddress] [nvarchar](max) NULL,
	[DeliveryName] [nvarchar](max) NULL,
	[DeliveryPhone] [nvarchar](max) NULL,
	[DeliveryEmail] [nvarchar](max) NULL,
	[Updated_by] [int] NULL,
	[Updated_at] [datetime] NULL,
	[Status] [int] NULL,
	[Trash] [int] NULL,
	[DeliveryPaymentMethod] [nvarchar](max) NULL,
	[StatusPayment] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/19/2021 12:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Gender] [int] NOT NULL,
	[Phone] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Access] [int] NOT NULL,
	[StoreId] [int] NOT NULL ,
	[Status] [int] NOT NULL,
	[Created_at] [datetime] NOT NULL,
	[Created_by] [int] NOT NULL,
	[Updated_at] [datetime] NOT NULL,
	[Updated_by] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders] WITH CHECK ADD CONSTRAINT [fk_orders_stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores]([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_stores] 
GO
ALTER TABLE [dbo].[Users] WITH CHECK ADD CONSTRAINT [fk_users_stores] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores]([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [fk_users_stores]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Categorys] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_category]
GO
--ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderDetails_order] FOREIGN KEY([OrderId])
--REFERENCES [dbo].[Orders] ([Id])
--GO
--ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderDetails_order]
--GO

--DROP TABLE dbo.Stores;
--DROP TABLE dbo.Orders;
--DROP TABLE dbo.Users;

ALTER TABLE [dbo].[ProductRate] ADD  CONSTRAINT [DF_ProductRate_Rate]  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [ProRate]
GO
--------------------xoa khoa ngoai orderdetail den order
ALTER TABLE [dbo].[OrderDetails] DROP CONSTRAINT [fk_orderDetails_order];

ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderDetails_order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderDetails_order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [fk_orderDetails_product2] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [fk_orderDetails_product2]
GO
--------------------xoa khoa ngoai order den users
--ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [fk_orders_users_ID];

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_users_ID] FOREIGN KEY([CustemerId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_orders_users_ID]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [fk_poste_topicc] FOREIGN KEY([Topid])
REFERENCES [dbo].[Topics] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [fk_poste_topicc]
GO
--ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_category] FOREIGN KEY([CateID])
--REFERENCES [dbo].[Categorys] ([Id])
--GO
--ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_category]

-- Xóa các ràng buộc khóa ngoại trong bảng Products
--ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_product_create];
--ALTER TABLE [dbo].[Products] DROP CONSTRAINT [fk_product_update];

---- Xóa các ràng buộc khóa ngoại trong bảng Topics
--ALTER TABLE [dbo].[Topics] DROP CONSTRAINT [fk_topic_create];
--ALTER TABLE [dbo].[Topics] DROP CONSTRAINT [fk_topic_update];

GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_create] FOREIGN KEY([Created_by])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_create]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [fk_product_update] FOREIGN KEY([Updated_by])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [fk_product_update]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [fk_topic_create] FOREIGN KEY([Created_by])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [fk_topic_create]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [fk_topic_update] FOREIGN KEY([Updated_by])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [fk_topic_update]
GO

------------------------------------------------------------------------------------

-- INSERT
SET IDENTITY_INSERT [dbo].[Stores] ON 
INSERT INTO [dbo].[Stores] 
(
    [Id],  -- Chỉ định giá trị cho cột ID
    [Address], 
    [Latitude], 
    [Longitude], 
    [OpenHours], 
    [Description], 
    [MenuUrl], 
    [DeliveryUrl], 
    [Created_at], 
    [Created_by], 
    [Updated_at], 
    [Updated_by], 
    [Status]
) 
VALUES 
(
    1,                                  -- Giá trị ID bạn muốn chỉ định
    '111 Main St, Ho Chi Minh City',   -- Địa chỉ
    10.7769,                            -- Vĩ độ
    106.6951,                           -- Kinh độ
    '08:00 AM - 10:00 PM',             -- Giờ mở cửa
    'Chuyên phục vụ món ăn nhanh',     -- Mô tả
    'http://example.com/menu',         -- URL menu
    'http://example.com/delivery',     -- URL giao hàng
    GETDATE(),                         -- Ngày tạo (hiện tại)
    1,                                  -- Người tạo (ID người dùng)
    NULL,                               -- Ngày cập nhật (null nếu chưa cập nhật)
    NULL,                               -- Người cập nhật (null nếu chưa cập nhật)
    1                                   -- Trạng thái (1 cho hoạt động)
);
INSERT INTO [dbo].[Stores] 
(
    [Id],  -- Chỉ định giá trị cho cột ID
    [Address], 
    [Latitude], 
    [Longitude], 
    [OpenHours], 
    [Description], 
    [MenuUrl], 
    [DeliveryUrl], 
    [Created_at], 
    [Created_by], 
    [Updated_at], 
    [Updated_by], 
    [Status]
) 
VALUES 
(
    2,                                  -- Giá trị ID bạn muốn chỉ định
    '123 Main St, Ho Chi Minh City',   -- Địa chỉ
    10.7769,                            -- Vĩ độ
    106.6951,                           -- Kinh độ
    '08:00 AM - 10:00 PM',             -- Giờ mở cửa
    'Chuyên phục vụ món ăn nhanh',     -- Mô tả
    'http://example.com/menu',         -- URL menu
    'http://example.com/delivery',     -- URL giao hàng
    GETDATE(),                         -- Ngày tạo (hiện tại)
    1,                                  -- Người tạo (ID người dùng)
    NULL,                               -- Ngày cập nhật (null nếu chưa cập nhật)
    NULL,                               -- Người cập nhật (null nếu chưa cập nhật)
    1                                   -- Trạng thái (1 cho hoạt động)
);

SET IDENTITY_INSERT [dbo].[Stores] OFF 
select * from [dbo].[Stores]

SET IDENTITY_INSERT [dbo].[Categorys] ON 

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (1, N'Combo Nhóm', N'combo-nhom', 8, NULL, N'Combo nhóm', N'Combo nhóm', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (2, N'Combo', N'combo', 0, NULL, N'Combo', N'Combo', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (3, N'Combo 1 người', N'combo-1-nguoi', 8, NULL, N'Combo 1 người', N'Combo 1 người', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (8, N'Đồ uống', N'do-uong', 0, NULL, N'Đồ uống', N'Đồ uống', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (19, N'test', N'test', 0, NULL, N'test', N'test', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (22, N'Burger', N'burger', 0, NULL, N'Burger', N'Burger', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (23, N'Pizza', N'pizza', 0, NULL, N'Pizza', N'Pizza', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (24, N'Gà rán', N'ga-ran', 0, NULL, N'Gà rán', N'Gà rán', GETDATE(), 1, GETDATE(), 1, 1)

INSERT [dbo].[Categorys] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (25, N'Thức uống', N'thuc-uong', 0, NULL, N'Thức uống', N'Thức uống', GETDATE(), 1, GETDATE(), 1, 1)

SET IDENTITY_INSERT [dbo].[Categorys] OFF

-- Xóa dữ liệu có ID = 8 và ID = 9
DELETE FROM [dbo].[Categorys] WHERE Id IN (1,2,3)
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Lê Gia Lai', N'lelaii200398@gmail.com', 364242261, N'1', N'1', 1, N'Đã trả lời', CAST(N'2021-02-14T09:56:30.000' AS DateTime), CAST(N'2021-02-16T19:38:35.147' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (2, N'd', N'd@gmail.com', 1, N'1', N'1', 1, N'ok', CAST(N'2021-02-14T22:34:46.000' AS DateTime), CAST(N'2021-02-16T22:34:44.707' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Lê Gia Lai', N'lelaii200398@gmail.com', 364242261, N'Test liên hệ 1', N'Test liên hệ 1', 0, NULL, CAST(N'2021-02-18T17:04:26.477' AS DateTime), CAST(N'2021-02-18T17:04:26.477' AS DateTime), 1, 1)
INSERT [dbo].[Contacts] ([Id], [FullName], [Email], [Phone], [Title], [Detail], [Flag], [Reply], [Created_at], [Updated_at], [Updated_by], [Status]) VALUES (4, N'Lê Gia Lai', N'lelaii200398@gmail.com', 364242261, N'Test liên hệ 1', N'Test liên hệ 1', 0, NULL, CAST(N'2021-02-18T17:31:37.407' AS DateTime), CAST(N'2021-02-18T17:31:37.407' AS DateTime), 1, 1)

SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Links] ON 

SET IDENTITY_INSERT [dbo].[Links] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (1, N'Liên hệ', N'lien-he', N'page', NULL, 0, N'mainmenu', 1, CAST(N'2021-02-14T09:56:13.000' AS DateTime), NULL, CAST(N'2021-02-18T17:38:08.937' AS DateTime), 1, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (2, N'Tin tức', N'tin-tuc', N'custom', NULL, 0, N'mainmenu', 1, CAST(N'2021-02-15T09:23:14.240' AS DateTime), NULL, CAST(N'2021-02-15T09:23:16.033' AS DateTime), 1, 1)
INSERT [dbo].[Menus] ([Id], [Name], [Link], [Type], [TableId], [ParentId], [Position], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (3, N'Giới thiệu', N'gioi-thieu', N'page', 5, 0, N'mainmenu', 1, CAST(N'2021-02-15T09:32:52.000' AS DateTime), NULL, CAST(N'2021-02-16T20:26:33.993' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity], [Amount]) VALUES (1, 1, 255, 3100000, 2, 6200000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
select * from dbo.Products
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id],[StoreId], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (1,1, N'20210214090220', 1, GETDATE(), GETDATE(), N'123 tăng nhơn phú', N'Lê Gia Lai', N'01', N'lelaii200398@gmail.com', 1, GETDATE(), 3, 0, NULL, 0)
--INSERT [dbo].[Orders] ([Id],[StoreId], [Code], [CustemerId], [CreateDate], [ExportDate], [DeliveryAddress], [DeliveryName], [DeliveryPhone], [DeliveryEmail], [Updated_by], [Updated_at], [Status], [Trash], [DeliveryPaymentMethod], [StatusPayment]) VALUES (28, N'20210415090410', 20, CAST(N'2021-04-15T21:39:10.323' AS DateTime), NULL, N'204 Hoang Mai', N'Quang Anh Tong', N'098723972', N'123@gmail.com', NULL, NULL, 1, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
--SET IDENTITY_INSERT [dbo].[Posts] ON 

--SET IDENTITY_INSERT [dbo].[Posts] OFF
--GO

DELETE FROM [dbo].[Posts] WHERE [Id] >= 9;

SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Topid], [Title], [Slug], [Detail], [Img], [Type], [MetaKey], [MetaDesc], [Created_At], [Created_By], [Updated_At], [Updated_By], [Status]) 
VALUES (9, 5, N'gioi thieu', N'gioi-thieu', N'<p># Được thành lập từ 1987 tại NewYork...</p>', N'gioi-thieu.png', N'page', NULL, NULL, GETDATE(), 28, GETDATE(), 28, 1)

SET IDENTITY_INSERT [dbo].[Posts] OFF
select * from dbo.Posts

SET IDENTITY_INSERT [dbo].[ProductRate] ON 

INSERT [dbo].[ProductRate] ([ID], [ProductID], [UserID], [Rate], [Comment], [UName], [CreateAt]) VALUES (19, 57, 20, 5, N'', N'Quang Anh Tong', CAST(N'2021-04-15T21:37:28.723' AS DateTime))
INSERT [dbo].[ProductRate] ([ID], [ProductID], [UserID], [Rate], [Comment], [UName], [CreateAt]) VALUES (20, 45, 20, 5, N'ok', N'Quang Anh Tong', CAST(N'2021-04-15T21:38:50.150' AS DateTime))
INSERT [dbo].[ProductRate] ([ID], [ProductID], [UserID], [Rate], [Comment], [UName], [CreateAt]) VALUES (21, 45, 20, 3, N'', N'Quang Anh Tong', CAST(N'2021-04-15T21:39:18.077' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductRate] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (5, N'slider watch site', N'slider-watch-site', N'slideshow', N'slider-watch-site.jpg', 2, CAST(N'2021-03-31T15:46:15.663' AS DateTime), 21, CAST(N'2021-03-31T15:46:15.663' AS DateTime), 21, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (6, N'banner 2', N'banner-2', N'slideshow', N'banner-2.jpg', 5, CAST(N'2021-03-31T16:38:46.437' AS DateTime), 21, CAST(N'2021-03-31T16:38:46.437' AS DateTime), 21, 1)
INSERT [dbo].[Sliders] ([Id], [Name], [Link], [Position], [Img], [Orders], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) VALUES (7, N'banner 3', N'banner-3', N'slideshow', N'banner-3.jpg', 5, CAST(N'2021-03-31T16:38:57.000' AS DateTime), 21, CAST(N'2021-03-31T16:39:51.747' AS DateTime), 21, 1)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Topics] ON 

INSERT [dbo].[Topics] ([Id], [Name], [Slug], [ParentId], [Orders], [Metakey], [Metadesc], [Created_at], [Created_by], [Updated_at], [Updated_by], [Status]) 
VALUES (5, N'Thông tin web', N'thong-tin-web', 0, NULL, N'Về chúng tôi', N'Thông tin web',getdate(), 1, getdate(), 1, 1)
SET IDENTITY_INSERT [dbo].[Topics] OFF
GO
--SET IDENTITY_INSERT [dbo].[Users] ON 
--INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access],[StoreId], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) 
--VALUES (1, N'Antonday', N'admin', N'xMpCOKC5I4INzFCab3WEmw==', N'1@gmail.com', 1, 123, N'123 tăng nhơn phú', N'le-gia-lai.jpg', 1, 2, 1, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-04T14:12:22.817' AS DateTime), 20)

----INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access],[StoreId], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (1, N'Antonday', N'admin', N'xMpCOKC5I4INzFCab3WEmw==', N'1@gmail.com', 1, 123, N'123 tăng nhơn phú', N'le-gia-lai.jpg', 1,1, 1, CAST(N'2020-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2021-03-04T14:12:22.817' AS DateTime), 20)
----INSERT [dbo].[Users] ([ID], [FullName], [Name], [Password], [Email], [Gender], [Phone], [Address], [Image], [Access],[StoreId], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by]) VALUES (28, NULL, NULL, N'xMpCOKC5I4INzFCab3WEmw==', N'admins3@gmail.com', 1,1, 0, NULL, N'', 0, 0, CAST(N'2021-04-14T17:42:59.787' AS DateTime), 1, CAST(N'2021-04-14T17:42:59.787' AS DateTime), 27)
--SET IDENTITY_INSERT [dbo].[Users] OFF
--GO
-- Bật IDENTITY_INSERT cho bảng Users
SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT INTO [dbo].[Users] 
(
    [ID],
    [FullName], 
    [Name], 
    [Password], 
    [Email], 
    [Gender], 
    [Phone], 
    [Address], 
    [Image], 
    [Access], 
    [StoreId], 
    [Status], 
    [Created_at], 
    [Created_by],   -- Cung cấp giá trị cho cột này
    [Updated_at], 
    [Updated_by]
) 
VALUES 
(
    1,
    N'admin',                          -- Tên đầy đủ
    N'admin',                          -- Tên đăng nhập
    N'xMpCOKC5I4INzFCab3WEmw==',      -- Mật khẩu đã mã hóa
    N'admin@example.com',              -- Email
    1,                                  -- Giới tính
    123456789,                         -- Số điện thoại
    N'Địa chỉ của admin',              -- Địa chỉ
    N'admin.jpg',                      -- Hình ảnh
    1,                                  -- Quyền truy cập
    2,                                  -- StoreId
    1,                                  -- Trạng thái
    GETDATE(),                         -- Ngày tạo
    1,                                  -- Người tạo (cung cấp giá trị hợp lệ)
    GETDATE(),                         -- Ngày cập nhật (cung cấp giá trị)
    1                                -- Người cập nhật (có thể để NULL nếu cho phép)
);

SET IDENTITY_INSERT [dbo].[Users] OFF;

SELECT * FROM [dbo].[Users];


--select * from Products
--DELETE FROM [dbo].[Products]
--WHERE [Name] IN (N'HEINZ', N'PAUL', N'SKY', N'MONSOON', N'WIND', N'HAZE', N'DAWN', N'SERENE', N'AUTUMN', N'MOON');
----


-----------du lieu them san pham--------------------------------------------------
--Burger
--1
--DELETE FROM [dbo].[Products] WHERE Id >=1
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Gà Quay Flava', N'burger-ga-quay-flava', 22, 'burger_ga_quay_flava.jpg', 0, 0, 10, N'Burger với gà quay hương vị Flava đặc biệt', N'Gà quay giòn, vị Flava hấp dẫn', N'Thịt gà, rau, sốt đặc biệt, bánh mì', 65000, 50, 58500, N'burger gà quay, gà flava, fast food', N'Burger gà quay với vị Flava đặc trưng', 1, GETDATE(), 1, GETDATE(), 1, 4.7);
--2
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Zinger', N'burger-zinger', 22, 'burger_zinger.jpg', 1, 0, 10, 
     N'Burger Zinger với miếng gà tẩm bột giòn rụm, kết hợp cùng rau tươi mát và sốt đặc biệt, tạo nên hương vị khó quên.', 
     N'Burger Zinger là món ăn yêu thích của nhiều người với lớp vỏ gà chiên giòn tan, thấm đẫm gia vị đậm đà. Bên trong là rau tươi xanh, sốt đặc trưng và bánh mì mềm, tất cả tạo nên một trải nghiệm ăn uống tuyệt vời. Thích hợp cho những ai muốn thưởng thức hương vị giòn, cay và đầy hấp dẫn.', 
     N'Thành phần: Thịt gà chiên giòn, rau xà lách, cà chua, sốt mayonnaise, bánh mì mềm', 
     75000, 50, 67500, N'burger zinger, gà chiên giòn, fast food', 
     N'Burger Zinger với lớp vỏ gà giòn rụm, thơm ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

--3
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Tôm', N'burger-tom', 22, 'burger_tom.jpg', 0, 0, 12, 
     N'Burger Tôm với nhân tôm chiên vàng giòn, vị ngọt tự nhiên của tôm kết hợp với sốt mayonnaise mịn màng, đem lại cảm giác mới lạ.', 
     N'Burger Tôm là món ăn độc đáo với nhân tôm chiên giòn bên trong bánh mì mềm. Tôm được lựa chọn kỹ lưỡng, chiên vàng đều, kết hợp cùng rau tươi và sốt mayonnaise béo ngậy, mang lại một trải nghiệm phong phú cho vị giác. Phù hợp cho những ai thích sự mới lạ và hương vị từ biển.', 
     N'Thành phần: Tôm chiên giòn, xà lách, cà chua, sốt mayonnaise, bánh mì', 
     80000, 40, 70400, N'burger tôm, tôm chiên, fast food', 
     N'Burger Tôm giòn tan với hương vị biển', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);

--4
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Gà Quay', N'burger-ga-quay', 22, 'burger_ga_quay.jpg', 1, 0, 8, 
     N'Burger Gà Quay với miếng gà quay mềm thơm, kết hợp cùng rau xanh và sốt đặc biệt, mang lại hương vị đậm đà khó cưỡng.', 
     N'Burger Gà Quay là món ăn đậm chất truyền thống với miếng gà quay mềm mịn, thơm phức. Gà được quay chín vừa phải, giữ được độ ngọt và mềm tự nhiên, hòa quyện với rau tươi và sốt đặc biệt. Phần bánh mì mềm mại giúp hoàn thiện món ăn, tạo ra một sự kết hợp hương vị độc đáo.', 
     N'Thành phần: Gà quay, rau xà lách, cà chua, sốt đặc biệt, bánh mì mềm', 
     70000, 55, 64400, N'burger gà quay, gà quay, fast food', 
     N'Burger Gà Quay với hương vị thơm ngon, đậm đà', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger với 3 loại xốt mới và vỏ bánh than tre thủ công', N'burger-3-xot-moi-vo-banh-than-tre', 22, 'burger_3_xot_moi_vo_banh_than_tre.jpg', 1, 0, 10, 
     N'Burger độc đáo với 3 loại xốt thơm ngon và vỏ bánh đen độc quyền.', 
     N'Burger này mang đến trải nghiệm thú vị với vỏ bánh than tre thủ công, kết hợp hoàn hảo với 3 loại xốt mới lạ: xốt BBQ, xốt tỏi và xốt cay. Miếng thịt bò tươi ngon được nướng vừa chín tới, đi kèm với rau xanh tươi mát, mang lại hương vị thơm ngon và hấp dẫn.', 
     N'Thành phần: Bánh mì than tre, thịt bò, xốt BBQ, xốt tỏi, xốt cay, rau xanh', 
     85000, 40, 76500, N'burger, xốt mới, bánh than tre', 
     N'Burger với vỏ bánh than tre và 3 loại xốt độc đáo', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger phô mai vòng', N'burger-pho-mai-vong', 22, 'burger_pho_mai_vong.jpg', 1, 0, 12, 
     N'Burger với miếng phô mai hình vòng lớn, thơm ngon và hấp dẫn.', 
     N'Món Burger này đặc biệt với phô mai hình vòng lớn được nướng chảy, kết hợp với thịt bò tươi, rau củ và các loại xốt ngon. Đặc biệt, phần bánh mì mềm mại bên ngoài giúp nâng tầm trải nghiệm ẩm thực.', 
     N'Thành phần: Bánh mì, thịt bò, phô mai, rau xanh, xốt', 
     75000, 50, 67500, N'burger, phô mai, món ngon', 
     N'Burger phô mai vòng thơm ngon, đậm đà', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger bò phô mai (Size M)', N'burger-bo-pho-mai-size-m', 22, 'burger_bo_pho_mai_size_m.jpg', 1, 0, 15, 
     N'Burger bò với phô mai béo ngậy, kích cỡ vừa.', 
     N'Món ăn tuyệt vời cho những ai yêu thích sự kết hợp hoàn hảo giữa thịt bò và phô mai. Miếng thịt bò được nướng chín tới, thêm lớp phô mai béo ngậy tan chảy, cùng với rau củ tươi mát.', 
     N'Thành phần: Bánh mì, thịt bò, phô mai, rau xanh, xốt', 
     80000, 30, 72000, N'burger, bò, phô mai', 
     N'Burger bò phô mai cỡ vừa, hương vị tuyệt hảo', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Tempura Rau Củ & Bò nướng lửa hồng với vỏ bánh đen', N'burger-tempura-rau-cu-bo-nuong-lua-hong', 22, 'burger_tempura_rau_cu_bo_nuong_lua_hong.jpg', 1, 0, 15, 
     N'Burger với tempura rau củ và bò nướng lửa hồng, cùng vỏ bánh đen độc đáo.', 
     N'Món Burger độc đáo này kết hợp giữa tempura rau củ giòn rụm và miếng thịt bò nướng lửa hồng, tạo nên sự hòa quyện hoàn hảo. Vỏ bánh đen không chỉ đẹp mắt mà còn mang đến hương vị mới lạ.', 
     N'Thành phần: Bánh mì đen, bò nướng, tempura rau củ, xốt', 
     95000, 25, 85500, N'burger, tempura, rau củ', 
     N'Burger tempura rau củ & bò nướng lửa hồng hấp dẫn', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger bò nướng Whopper (cỡ vừa)', N'burger-bo-nuong-whopper-co-vua', 22, 'burger_bo_nuong_whopper_co_vua.jpg', 1, 0, 15, 
     N'Burger bò nướng Whopper với hương vị thơm ngon đặc trưng.', 
     N'Món Burger này là lựa chọn lý tưởng cho những ai yêu thích thịt bò nướng. Với kích cỡ vừa, miếng thịt bò được nướng chín tới, kèm theo các loại rau củ tươi và xốt đặc biệt.', 
     N'Thành phần: Bánh mì, thịt bò nướng, rau xanh, xốt', 
     85000, 40, 76500, N'burger, Whopper, bò nướng', 
     N'Burger bò nướng Whopper cỡ vừa, ngon tuyệt', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Burger Cá giòn', N'burger-ca-gion', 22, 'burger_ca_gion.jpg', 1, 0, 10, 
     N'Burger với cá giòn, lớp vỏ giòn tan.', 
     N'Món Burger này nổi bật với miếng cá tươi ngon được chiên giòn, bên trong là thịt cá mềm mại, kèm theo rau xanh và xốt tươi mát. Đây là một lựa chọn tuyệt vời cho những ai yêu thích hải sản.', 
     N'Thành phần: Bánh mì, cá chiên giòn, rau xanh, xốt', 
     65000, 50, 58500, N'burger, cá, hải sản', 
     N'Burger cá giòn với hương vị tươi ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);


--piza
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Hải Sản Pesto Xanh', N'pizza-hai-san-pesto-xanh', 23, 'pizza_hai_san_pesto_xanh.jpg', 1, 0, 12, 
     N'Pizza Hải Sản Pesto Xanh với lớp sốt pesto độc đáo, kết hợp cùng các loại hải sản tươi ngon tạo nên hương vị đặc biệt.', 
     N'Pizza Hải Sản Pesto Xanh là sự kết hợp hoàn hảo giữa sốt pesto xanh đậm đà và các loại hải sản tươi sống như tôm, mực và ngao. Sốt pesto với húng quế tươi, tỏi và dầu olive mang đến hương vị nhẹ nhàng nhưng thơm ngon, hoà quyện cùng hải sản để tạo nên một món pizza độc đáo và giàu dinh dưỡng. Đế bánh giòn tan kết hợp cùng lớp phô mai mozzarella tan chảy, làm tăng thêm độ béo ngậy và hấp dẫn cho món ăn.', 
     N'Thành phần: Sốt pesto xanh, tôm, mực, ngao, phô mai mozzarella, đế bánh giòn', 
     85000, 40, 74800, N'pizza hải sản, pizza pesto xanh, pizza húng quế, fast food', 
     N'Pizza hải sản pesto xanh với hương vị tươi ngon và độc đáo', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

--
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Tôm Cocktail', N'pizza-tom-cocktail', 23, 'pizza_tom_cocktail.jpg', 0, 0, 15, 
     N'Pizza Tôm Cocktail với lớp tôm tươi ngon, sốt cocktail và phô mai mềm mịn.', 
     N'Pizza Tôm Cocktail là món pizza đặc biệt với lớp topping từ những con tôm tươi chắc thịt, kết hợp cùng sốt cocktail đặc biệt với vị chua nhẹ và ngọt thanh, tạo nên một hương vị tươi mới, hấp dẫn. Tôm được nướng vừa chín tới để giữ được độ ngọt tự nhiên, cùng với phô mai mozzarella tan chảy, tạo nên một chiếc pizza đầy màu sắc và thơm ngon. Đây là lựa chọn hoàn hảo cho những ai yêu thích hải sản và thích sự khác biệt trong hương vị.', 
     N'Thành phần: Tôm tươi, sốt cocktail, phô mai mozzarella, đế bánh giòn', 
     90000, 35, 76500, N'pizza tôm cocktail, pizza hải sản, fast food', 
     N'Pizza Tôm Cocktail với hương vị tươi mát của biển', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);
--
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Hải Sản Cocktail', N'pizza-hai-san-cocktail', 23, 'pizza_hai_san_cocktail.jpg', 1, 0, 10, 
     N'Pizza Hải Sản Cocktail với sự kết hợp của tôm, mực và ngao, hòa quyện cùng sốt cocktail thơm ngon.', 
     N'Pizza Hải Sản Cocktail là sự lựa chọn tuyệt vời cho những tín đồ hải sản, với lớp topping gồm tôm, mực và ngao tươi, được nướng đến độ chín hoàn hảo. Sốt cocktail độc đáo làm nổi bật vị ngọt tự nhiên của hải sản, kết hợp với phô mai mozzarella tan chảy tạo ra một món ăn phong phú về hương vị. Đế bánh giòn tan bên ngoài, mềm bên trong, tất cả tạo nên một chiếc pizza hải sản thực sự ngon miệng và hấp dẫn.', 
     N'Thành phần: Tôm, mực, ngao, sốt cocktail, phô mai mozzarella, đế bánh giòn', 
     95000, 45, 85500, N'pizza hải sản cocktail, pizza hải sản, fast food', 
     N'Pizza Hải Sản Cocktail với hương vị tươi ngon, đậm đà của biển', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);
--
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Hải Sản Nhiệt Đới', N'pizza-hai-san-nhiet-doi', 23, 'pizza_hai_san_nhiet_doi.jpg', 1, 0, 8, 
     N'Pizza Hải Sản Nhiệt Đới với sự kết hợp của các loại hải sản và trái cây nhiệt đới mang lại hương vị mới lạ.', 
     N'Pizza Hải Sản Nhiệt Đới là món ăn độc đáo với sự kết hợp giữa hải sản tươi ngon và hương vị ngọt dịu từ các loại trái cây nhiệt đới như dứa và xoài. Lớp topping gồm tôm, mực, ngao cùng với phô mai mozzarella và trái cây, tạo nên hương vị cân bằng giữa ngọt, mặn và béo ngậy. Đế bánh giòn rụm làm nền cho sự phong phú về màu sắc và hương vị, khiến cho món pizza này trở thành lựa chọn hoàn hảo cho những ai thích khám phá hương vị mới lạ.', 
     N'Thành phần: Tôm, mực, ngao, dứa, xoài, phô mai mozzarella, đế bánh giòn', 
     100000, 40, 92000, N'pizza hải sản nhiệt đới, pizza trái cây, fast food', 
     N'Pizza Hải Sản Nhiệt Đới độc đáo với hương vị trái cây', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Aloha', N'pizza-aloha', 23, 'pizza_aloha.jpg', 1, 0, 10, 
     N'Pizza Aloha kết hợp hài hòa giữa thịt nguội và dứa, tạo nên hương vị ngọt ngào và đậm đà.', 
     N'Pizza Aloha mang hương vị nhiệt đới với sự hòa quyện hoàn hảo giữa thịt nguội và những lát dứa tươi ngọt, tạo nên một sự kết hợp độc đáo giữa vị mặn và ngọt. Đế bánh được nướng giòn kết hợp cùng lớp phô mai mozzarella tan chảy, tạo thành món ăn thú vị và hấp dẫn. Đây là lựa chọn tuyệt vời cho những ai thích trải nghiệm sự tươi mới và nhẹ nhàng từ hương vị của dứa kết hợp với vị béo ngậy của phô mai và thịt nguội.', 
     N'Thành phần: Thịt nguội, dứa, phô mai mozzarella, đế bánh giòn', 
     75000, 60, 67500, N'pizza aloha, pizza dứa, pizza nhiệt đới, fast food', 
     N'Pizza Aloha nhiệt đới với thịt nguội và dứa', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Thịt Xông Khói', N'pizza-thit-xong-khoi', 23, 'pizza_thit_xong_khoi.jpg', 1, 0, 15, 
     N'Pizza Thịt Xông Khói đậm đà với lớp thịt xông khói và phô mai thơm ngon.', 
     N'Pizza Thịt Xông Khói là sự lựa chọn lý tưởng cho những ai yêu thích hương vị đậm đà của thịt xông khói. Với lớp topping từ thịt xông khói được nướng vừa tới để giữ nguyên độ mềm và vị ngọt, hòa quyện cùng lớp phô mai mozzarella tan chảy và đế bánh giòn, món pizza này đem đến hương vị mặn mà, béo ngậy và thơm lừng. Mỗi miếng pizza là sự pha trộn hoàn hảo giữa phô mai và thịt xông khói, khiến thực khách khó có thể cưỡng lại.', 
     N'Thành phần: Thịt xông khói, phô mai mozzarella, đế bánh giòn', 
     85000, 50, 72250, N'pizza thịt xông khói, pizza thịt, fast food', 
     N'Pizza Thịt Xông Khói đậm đà', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Thịt Nguội Kiểu Canada', N'pizza-thit-nguoi-kieu-canada', 23, 'pizza_thit_nguoi_canada.jpg', 1, 0, 10, 
     N'Pizza Thịt Nguội Kiểu Canada với thịt nguội thơm ngon và phô mai phong phú.', 
     N'Pizza Thịt Nguội Kiểu Canada là món pizza nổi tiếng với lớp topping từ thịt nguội nhập khẩu và phô mai mozzarella dày đặc. Hương vị thịt nguội kiểu Canada đậm đà và ngọt nhẹ kết hợp với lớp đế bánh giòn, mềm mại tạo nên trải nghiệm thú vị và đầy hấp dẫn cho thực khách. Đây là món pizza lý tưởng cho những bữa tiệc gia đình hoặc buổi tụ tập bạn bè, đem lại cảm giác no đủ và hài lòng.', 
     N'Thành phần: Thịt nguội kiểu Canada, phô mai mozzarella, đế bánh giòn', 
     95000, 40, 85500, N'pizza thịt nguội canada, pizza thịt nguội, fast food', 
     N'Pizza Thịt Nguội Kiểu Canada đậm đà hương vị', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pizza Gà Nướng 3 Vị', N'pizza-ga-nuong-3-vi', 23, 'pizza_ga_nuong_3_vi.jpg', 1, 0, 12, 
     N'Pizza Gà Nướng 3 Vị với sự kết hợp của các loại sốt khác nhau tạo nên hương vị đa dạng.', 
     N'Pizza Gà Nướng 3 Vị là món pizza độc đáo với phần thịt gà nướng thơm lừng, kết hợp cùng ba loại sốt phong phú bao gồm BBQ, Teriyaki và sốt cay. Thịt gà được nướng vàng ruộm, vừa mềm vừa ngọt thịt, hòa quyện với hương vị đậm đà của từng loại sốt. Lớp phô mai mozzarella tan chảy làm tăng thêm độ béo ngậy và quyến rũ cho mỗi miếng pizza. Đây là món ăn lý tưởng cho những ai yêu thích hương vị gà nướng và muốn trải nghiệm nhiều loại sốt khác nhau trên cùng một chiếc pizza.', 
     N'Thành phần: Thịt gà nướng, sốt BBQ, sốt Teriyaki, sốt cay, phô mai mozzarella, đế bánh giòn', 
     98000, 45, 86240, N'pizza gà nướng, pizza ba vị, fast food', 
     N'Pizza Gà Nướng 3 Vị đa dạng với nhiều loại sốt', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);

--Gà rán

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'1 Miếng Gà Rán', N'1-mieng-ga-ran', 24, '1-mieng-ga-ran.jpg', 
     1, 0, 10, 
     N'Miếng gà rán giòn tan với lớp vỏ giòn đặc trưng.', 
     N'1 Miếng Gà Rán là sự lựa chọn lý tưởng cho bữa ăn nhẹ. Với lớp vỏ vàng ươm, giòn tan, bên trong là thịt gà ngọt mềm và giữ trọn độ ẩm. Công thức tẩm ướp độc đáo giúp từng miếng gà đậm đà, ngon miệng mà vẫn dễ ăn. Thích hợp cho những ai muốn thưởng thức hương vị gà rán truyền thống mà không cần quá nhiều.', 
     N'Thành phần: Thịt gà tươi, gia vị độc quyền, lớp vỏ giòn tan', 
     30000, 100, 27000, 
     N'1 miếng gà rán, gà rán, fast food', 
     N'1 Miếng Gà Rán giòn tan', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'2 Miếng Gà Rán', N'2-mieng-ga-ran', 24, '2-mieng-ga-ran.jpg', 
     1, 0, 12, 
     N'Hai miếng gà rán giòn tan, phù hợp cho bữa ăn trưa nhẹ nhàng.', 
     N'2 Miếng Gà Rán mang đến sự lựa chọn hoàn hảo cho bữa ăn no hơn với hai miếng gà thơm giòn. Lớp vỏ ngoài giòn rụm, bao bọc lấy phần thịt gà mềm ngọt bên trong, giữ nguyên hương vị đậm đà, chuẩn vị. Thưởng thức hai miếng gà giúp bạn no đủ mà vẫn tận hưởng trọn vẹn hương vị truyền thống của món gà rán.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc biệt, lớp vỏ giòn', 
     55000, 80, 48400, 
     N'2 miếng gà rán, gà rán, fast food', 
     N'2 Miếng Gà Rán giòn rụm', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'3 Cánh Gà Hot Wings', N'3-canh-ga-hot-wings', 24, '3-canh-ga-hot-wings.jpg', 
     1, 0, 15, 
     N'Ba cánh gà cay nóng hổi, giòn rụm với hương vị cay đặc trưng.', 
     N'3 Cánh Gà Hot Wings là lựa chọn lý tưởng cho những ai thích vị cay nồng. Cánh gà được tẩm ướp với các loại gia vị đặc biệt, mang đến hương vị cay nóng mà vẫn giòn rụm. Thịt cánh mềm ngọt, ngấm đều gia vị, tạo cảm giác vừa cay vừa thơm khi thưởng thức. Một phần tuyệt vời cho buổi ăn nhẹ hoặc thêm gia vị cho bữa chính.', 
     N'Thành phần: Cánh gà, gia vị cay, lớp vỏ giòn', 
     40000, 60, 34000, 
     N'cánh gà hot wings, gà cay, fast food', 
     N'3 Cánh Gà Hot Wings cay ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'6 Miếng Gà Rán', N'6-mieng-ga-ran', 24, '6-mieng-ga-ran.jpg', 
     1, 0, 18, 
     N'Sáu miếng gà rán giòn, lý tưởng cho bữa ăn gia đình.', 
     N'6 Miếng Gà Rán là phần ăn lý tưởng cho cả gia đình hoặc nhóm bạn. Mỗi miếng gà rán đều được chế biến với lớp vỏ vàng ruộm, giòn tan, bên trong là thịt gà mềm ngọt, thấm đẫm gia vị. Đây là sự kết hợp hoàn hảo giữa hương vị đậm đà và độ giòn rụm, khiến cả gia đình có thể thưởng thức cùng nhau trong bữa ăn vui vẻ và no đủ.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc trưng, lớp vỏ giòn', 
     150000, 40, 123000, 
     N'6 miếng gà rán, gà rán, fast food', 
     N'6 Miếng Gà Rán cho gia đình', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'5 Cánh Gà Hot Wings', N'5-canh-ga-hot-wings', 24, '5-canh-ga-hot-wings.jpg', 
     1, 0, 15, 
     N'Năm cánh gà giòn cay, dành cho các tín đồ của hương vị mạnh mẽ.', 
     N'5 Cánh Gà Hot Wings là lựa chọn hoàn hảo cho những ai yêu thích sự cay nồng. Với gia vị đặc biệt tạo nên hương vị đậm đà, từng cánh gà giữ được độ giòn tan và phần thịt ngọt, mềm, thơm lừng. Phần ăn này rất phù hợp cho buổi gặp mặt bạn bè hoặc gia đình, mang lại trải nghiệm ăn uống sảng khoái.', 
     N'Thành phần: Cánh gà, gia vị cay đặc biệt, lớp vỏ giòn', 
     70000, 50, 59500, 
     N'5 cánh gà hot wings, gà cay, fast food', 
     N'5 Cánh Gà Hot Wings ngon cay', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'2 Gà Rán Tenders Vị Nguyên Bản', N'2-ga-ran-tenders-vi-nguyen-ban', 24, '2-ga-ran-tenders-vi-nguyen-ban.jpg', 
     1, 0, 10, 
     N'Hai miếng gà rán tenders giòn, vị nguyên bản đặc trưng.', 
     N'2 Gà Rán Tenders Vị Nguyên Bản là lựa chọn tuyệt vời cho một bữa ăn nhẹ. Mỗi miếng tender được chế biến với lớp vỏ giòn tan bên ngoài, giữ nguyên hương vị tự nhiên của thịt gà bên trong. Được tẩm ướp theo công thức đặc biệt, gà rán tenders có vị ngon vừa miệng, mang đến sự kết hợp hài hòa giữa độ giòn và vị ngọt tự nhiên của thịt gà.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc trưng, lớp vỏ giòn', 
     45000, 100, 40500, 
     N'2 gà rán tenders, gà rán, vị nguyên bản, fast food', 
     N'2 Gà Rán Tenders Vị Nguyên Bản thơm ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);
	 INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'3 Gà Rán Tenders Vị Nguyên Bản', N'3-ga-ran-tenders-vi-nguyen-ban', 24, '3-ga-ran-tenders-vi-nguyen-ban.jpg', 
     1, 0, 12, 
     N'Ba miếng gà rán tenders vị nguyên bản giòn tan.', 
     N'3 Gà Rán Tenders Vị Nguyên Bản mang đến trải nghiệm đậm đà cho bữa ăn của bạn. Với lớp vỏ ngoài vàng rụm, giòn tan cùng phần thịt gà mềm ngọt bên trong, mỗi miếng tender là sự hòa quyện giữa hương vị tự nhiên và gia vị đặc trưng. Thích hợp cho bữa ăn nhẹ hoặc thêm vào phần ăn chính, giúp bạn thưởng thức hương vị gà rán nguyên bản đầy hấp dẫn.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc biệt, lớp vỏ giòn', 
     65000, 80, 57200, 
     N'3 gà rán tenders, gà rán, vị nguyên bản, fast food', 
     N'3 Gà Rán Tenders Vị Nguyên Bản thơm giòn', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'5 Gà Rán Tenders Vị Nguyên Bản', N'5-ga-ran-tenders-vi-nguyen-ban', 24, '5-ga-ran-tenders-vi-nguyen-ban.jpg', 
     1, 0, 15, 
     N'Năm miếng gà rán tenders giòn rụm, vị nguyên bản đậm đà.', 
     N'5 Gà Rán Tenders Vị Nguyên Bản là phần ăn lý tưởng cho các tín đồ gà rán. Với công thức tẩm ướp độc quyền và lớp vỏ giòn rụm, những miếng gà mềm ngọt bên trong mang đến hương vị đậm đà, tự nhiên. Sản phẩm này phù hợp cho buổi tụ tập bạn bè hoặc bữa ăn gia đình, giúp mọi người cùng chia sẻ và thưởng thức món gà rán đặc trưng.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc biệt, lớp vỏ giòn', 
     100000, 50, 85000, 
     N'5 gà rán tenders, gà rán, vị nguyên bản, fast food', 
     N'5 Gà Rán Tenders Vị Nguyên Bản giòn ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'10 Gà Rán Tenders Vị Nguyên Bản', N'10-ga-ran-tenders-vi-nguyen-ban', 24, '10-ga-ran-tenders-vi-nguyen-ban.jpg', 
     1, 0, 20, 
     N'Mười miếng gà rán tenders thơm ngon, hoàn hảo cho mọi bữa tiệc.', 
     N'10 Gà Rán Tenders Vị Nguyên Bản là phần ăn phong phú dành cho các buổi tiệc hoặc các cuộc gặp mặt. Mỗi miếng tender đều được tẩm ướp vừa phải, giòn tan bên ngoài và ngọt mềm bên trong, mang đến trải nghiệm hương vị gà rán truyền thống tuyệt vời. Một lựa chọn hoàn hảo để chia sẻ với mọi người và làm phong phú thêm bữa ăn.', 
     N'Thành phần: Thịt gà tươi, gia vị đặc trưng, lớp vỏ giòn', 
     190000, 30, 152000, 
     N'10 gà rán tenders, gà rán, vị nguyên bản, fast food', 
     N'10 Gà Rán Tenders Vị Nguyên Bản cho bữa tiệc', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);

--Thức uống
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pepsi Lon', N'pepsi-lon', 25, 'pepsilon.jpg', 1, 0, 5, 
     N'Nước giải khát có ga Pepsi lon 330ml, vị nguyên bản đầy sảng khoái.', 
     N'Pepsi lon mang đến hương vị mát lạnh và sảng khoái với mỗi ngụm. Thức uống có ga này thích hợp cho mọi dịp, giúp bạn thêm phần năng động, tươi mới với hương vị độc đáo, dễ uống.', 
     N'Thành phần: Nước, đường, carbon dioxide, hương liệu tự nhiên', 
     12000, 150, 11400, 
     N'pepsi lon, nước giải khát, nước có ga', 
     N'Pepsi lon mát lạnh, sảng khoái', 
     1, GETDATE(), 1, GETDATE(), 1, 4.4);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'7Up Lon', N'7up-lon', 25, '7uplon.jpg', 1, 0, 8, 
     N'Nước giải khát có ga 7Up lon 330ml, vị chanh tươi mát tự nhiên.', 
     N'7Up lon mang đến vị chanh mát lành kết hợp với bọt ga sảng khoái. Thức uống này giúp xua tan cơn khát và tạo cảm giác tươi mới trong từng ngụm uống, thích hợp cho mọi bữa ăn hoặc các buổi tiệc vui vẻ.', 
     N'Thành phần: Nước, đường, carbon dioxide, hương chanh tự nhiên', 
     13000, 120, 11900, 
     N'7up lon, nước giải khát, nước có ga, vị chanh', 
     N'7Up lon vị chanh mát lạnh', 
     1, GETDATE(), 1, GETDATE(), 1, 4.3);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Aquafina 500ml', N'aquafina-500ml', 25, 'aquafina500ml.jpg', 1, 0, 0, 
     N'Nước tinh khiết Aquafina chai 500ml, giúp cơ thể sảng khoái và tươi mới.', 
     N'Aquafina 500ml là nước tinh khiết lý tưởng để cung cấp độ ẩm cho cơ thể. Với quy trình lọc hiện đại, Aquafina mang đến nước sạch, an toàn, giúp cơ thể giữ vững sức khỏe và tươi mới mỗi ngày.', 
     N'Thành phần: Nước tinh khiết', 
     8000, 200, 8000, 
     N'aquafina, nước tinh khiết, nước uống, aquafina 500ml', 
     N'Nước tinh khiết Aquafina chai 500ml', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Trà Đào', N'tra-dao', 25, 'tradao.jpg', 1, 0, 10, 
     N'Trá đào thơm mát với hương vị tự nhiên từ đào tươi.', 
     N'Trá đào là lựa chọn tuyệt vời cho những ai yêu thích vị ngọt dịu và hương đào tự nhiên. Với sự tươi mát từ lá trà, kết hợp cùng hương đào ngọt ngào, thức uống này mang lại cảm giác thư giãn và thoải mái.', 
     N'Thành phần: Nước, đường, hương đào, trà đen', 
     18000, 80, 16200, 
     N'trá đào, nước giải khát, trà trái cây, trà đào', 
     N'Trá đào hương vị tự nhiên', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'1 Sô-cô-la Sữa Đá', N'socola-sua-da', 25, 'socolasuada.jpg', 1, 0, 10, 
     N'Sô-cô-la sữa đá thơm ngon với vị ngọt và mát lạnh.', 
     N'Sô-cô-la sữa đá là thức uống hoàn hảo cho những ngày hè nắng nóng. Vị sô-cô-la ngọt ngào kết hợp với đá lạnh mang lại sự tươi mới và sảng khoái cho mỗi ngụm uống.', 
     N'Thành phần: Sô-cô-la, sữa, đá', 
     25000, 60, 22500, 
     N'sô-cô-la sữa đá, nước giải khát, sô-cô-la', 
     N'Sô-cô-la sữa đá thơm ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);

INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Sô-cô-la Sữa Nóng', N'socola-sua-nong', 25, 'socolasuanong.jpg', 1, 0, 5, 
     N'Sô-cô-la sữa nóng với hương vị thơm ngọt, phù hợp cho những ngày lạnh.', 
     N'Sô-cô-la sữa nóng mang lại cảm giác ấm áp với vị ngọt dịu của sữa và sô-cô-la, là thức uống lý tưởng để thư giãn trong những ngày lạnh giá hoặc khi bạn cần một chút thư thái.', 
     N'Thành phần: Sô-cô-la, sữa', 
     28000, 50, 26600, 
     N'sô cô la sữa nóng, nước giải khát, đồ uống nóng', 
     N'Sô-cô-la sữa nóng thơm ngon, ấm áp', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Trà Chanh Lipton (Lớn)', N'tra-chanh-lipton-lon', 25, 'trachanhliptonlon.jpg', 1, 0, 10, 
     N'Trá chanh Lipton cỡ lớn, vị chanh tươi mát và thơm ngon.', 
     N'Trá chanh Lipton (Lớn) mang lại hương vị chanh tươi mới, nhẹ nhàng kết hợp với trà Lipton nổi tiếng. Thức uống giúp giải khát hiệu quả, thích hợp cho những ngày nóng nực hoặc khi bạn cần nạp năng lượng.', 
     N'Thành phần: Trà Lipton, chanh, đường', 
     20000, 60, 18000, 
     N'trá chanh, lipton, nước giải khát, trà lipton lớn', 
     N'Trá chanh Lipton cỡ lớn tươi mát', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Trà Chanh Lipton (Vừa)', N'tra-chanh-lipton-vua', 25, 'trachanhliptonvua.jpg', 1, 0, 10, 
     N'Trá chanh Lipton cỡ vừa, hương chanh thơm mát.', 
     N'Trá chanh Lipton (Vừa) là thức uống lý tưởng cho những ai yêu thích vị chanh dịu nhẹ cùng hương trà tươi mới. Sự kết hợp hoàn hảo này sẽ mang lại trải nghiệm thư giãn và tươi mát.', 
     N'Thành phần: Trà Lipton, chanh, đường', 
     15000, 70, 13500, 
     N'trá chanh, lipton, nước giải khát, trà lipton vừa', 
     N'Trá chanh Lipton cỡ vừa mát lạnh', 
     1, GETDATE(), 1, GETDATE(), 1, 4.4);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Pepsi Không Calo Lon', N'pepsi-khong-calo-lon', 25, 'pepsikhongcalolon.jpg', 1, 0, 8, 
     N'Pepsi không calo với hương vị nguyên bản, lon 330ml.', 
     N'Pepsi Không Calo Lon mang lại sự sảng khoái mà không làm bạn lo ngại về calo. Vị ngọt tự nhiên và hương vị độc đáo từ Pepsi giúp bạn tận hưởng mà không ảnh hưởng đến chế độ dinh dưỡng.', 
     N'Thành phần: Nước, hương liệu tự nhiên, không calo', 
     14000, 100, 12800, 
     N'pepsi không calo, nước giải khát không đường, pepsi', 
     N'Pepsi Không Calo lon 330ml tươi mát', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);

---combo nhóm
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo nhóm 2', N'combo-nhom-2', 1, 'combonhom2.jpg', 0, 0, 10, 
     N'Gồm các món chính và nước uống cho 2 người', 
     N'Combo hoàn hảo dành cho hai người, gồm các món chính như gà rán, burger và khoai tây chiên, đi kèm là đồ uống mát lạnh giúp bữa ăn thêm phần trọn vẹn.', 
     N'Thành phần chính: Gà rán, burger, khoai tây chiên, nước ngọt', 
     160000, 30, 144000, 
     N'combo nhóm 2, bữa ăn cho hai người, fast food', 
     N'Combo nhóm 2 hoàn hảo cho 2 người', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo nhóm 3', N'combo-nhom-3', 1, 'combonhom3.jpg', 0, 0, 12, 
     N'Bao gồm các món ăn chính và thức uống cho 3 người', 
     N'Lựa chọn tuyệt vời cho nhóm 3 người, với các phần gà rán giòn, burger hấp dẫn, khoai tây chiên vàng rụm, và nước ngọt đi kèm, đáp ứng khẩu vị đa dạng.', 
     N'Thành phần chính: Gà rán, burger, khoai tây chiên, nước ngọt', 
     240000, 25, 211200, 
     N'combo nhóm 3, bữa ăn cho ba người, fast food', 
     N'Combo nhóm 3 lý tưởng cho nhóm bạn bè', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo nhóm 4', N'combo-nhom-4', 1, 'combonhom4.jpg', 0, 0, 15, 
     N'Combo bữa ăn đầy đủ cho 4 người', 
     N'Combo nhóm 4 là lựa chọn hoàn hảo cho gia đình hoặc nhóm bạn 4 người. Combo bao gồm nhiều món như gà rán, burger, khoai tây chiên và nước uống, tất cả đều được chế biến tươi ngon và hấp dẫn.', 
     N'Thành phần chính: Gà rán, burger, khoai tây chiên, nước ngọt', 
     320000, 20, 272000, 
     N'combo nhóm 4, bữa ăn gia đình, fast food', 
     N'Combo nhóm 4 đầy đủ cho bữa ăn gia đình', 
     1, GETDATE(), 1, GETDATE(), 1, 4.8);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo nhóm 5', N'combo-nhom-5', 1, 'combonhom5.jpg', 0, 0, 18, 
     N'Combo thịnh soạn cho nhóm 5 người', 
     N'Combo nhóm 5 cung cấp các món ăn ngon miệng, đầy đặn, đủ cho 5 người, gồm gà rán, burger, khoai tây chiên và nước uống. Đây là lựa chọn tuyệt vời cho nhóm bạn hoặc gia đình.', 
     N'Thành phần chính: Gà rán, burger, khoai tây chiên, nước ngọt', 
     400000, 15, 328000, 
     N'combo nhóm 5, bữa ăn nhóm, fast food', 
     N'Combo nhóm 5 cho bữa ăn đông vui', 
     1, GETDATE(), 1, GETDATE(), 1, 4.9);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo nhóm 6', N'combo-nhom-6', 1, 'combonhom6.jpg', 0, 0, 20, 
     N'Bữa ăn đầy đặn cho nhóm 6 người', 
     N'Combo nhóm 6 là lựa chọn hoàn hảo cho bữa tiệc nhỏ hoặc nhóm đông người. Combo này bao gồm phần ăn đầy đủ với gà rán, burger, khoai tây chiên và nước uống, đáp ứng đủ cho 6 người.', 
     N'Thành phần chính: Gà rán, burger, khoai tây chiên, nước ngọt', 
     480000, 10, 384000, 
     N'combo nhóm 6, bữa ăn nhóm, fast food', 
     N'Combo nhóm 6 thịnh soạn cho bữa tiệc', 
     1, GETDATE(), 1, GETDATE(), 1, 5.0);
--- combo 1 nguoi
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Gà Rán 1', N'combo-ga-ran-1', 1, 'combo_garan1.jpg', 1, 0, 10, 
     N'Combo gồm 1 miếng gà rán giòn và nước ngọt', 
     N'Bữa ăn nhanh và tiện lợi với miếng gà rán giòn tan cùng nước ngọt mát lạnh, phù hợp cho bữa ăn nhẹ nhưng vẫn đầy năng lượng.', 
     N'Thành phần chính: Gà rán, nước ngọt', 
     65000, 50, 58500, 
     N'combo gà rán 1, gà rán, fast food', 
     N'Combo Gà Rán 1 với hương vị truyền thống', 
     1, GETDATE(), 1, GETDATE(), 1, 4.4);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Gà Rán 2', N'combo-ga-ran-2', 1, 'combo_garan2.jpg', 1, 0, 12, 
     N'Bao gồm 2 miếng gà rán và 1 lon nước ngọt', 
     N'Lý tưởng cho những ai muốn no lâu với hai miếng gà rán giòn tan kết hợp nước ngọt mát lạnh, giúp bữa ăn thêm phong phú.', 
     N'Thành phần chính: Gà rán, nước ngọt', 
     120000, 40, 105600, 
     N'combo gà rán 2, gà rán, fast food', 
     N'Combo Gà Rán 2 no lâu', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Gà Quay', N'combo-ga-quay', 1, 'combo_gaquay.jpg', 1, 0, 10, 
     N'Gồm gà quay thấm vị và nước uống', 
     N'Món gà quay đậm vị, chín mềm bên trong và da ngoài giòn tan, kết hợp nước uống sảng khoái, tạo nên bữa ăn thơm ngon.', 
     N'Thành phần chính: Gà quay, nước ngọt', 
     90000, 50, 81000, 
     N'combo gà quay, gà quay, fast food', 
     N'Combo Gà Quay thơm ngon', 
     1, GETDATE(), 1, GETDATE(), 1, 4.6);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Phi-lê Gà Quay', N'combo-phile-ga-quay', 1, 'combo_philegaquay.jpg', 1, 0, 10, 
     N'Gồm phi-lê gà quay mềm và nước uống', 
     N'Thưởng thức miếng phi-lê gà quay mềm mọng với lớp da ngoài giòn rụm, cùng nước ngọt mát lạnh tạo nên bữa ăn hài hòa, thơm ngon.', 
     N'Thành phần chính: Phi-lê gà quay, nước ngọt', 
     95000, 50, 85500, 
     N'combo phi lê gà quay, gà quay, fast food', 
     N'Combo Phi-lê Gà Quay mềm mọng', 
     1, GETDATE(), 1, GETDATE(), 1, 4.7);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Burger Tôm', N'combo-burger-tom', 1, 'combo_burgertom.jpg', 1, 0, 10, 
     N'Burger tôm giòn rụm và nước uống', 
     N'Vị ngọt tự nhiên từ tôm kết hợp lớp bánh mềm, tạo nên burger đặc biệt cho tín đồ hải sản. Đi kèm là nước uống mát lạnh, combo này thật lý tưởng cho bữa trưa.', 
     N'Thành phần chính: Burger tôm, nước ngọt', 
     85000, 50, 76500, 
     N'combo burger tôm, burger tôm, fast food', 
     N'Combo Burger Tôm cho bữa trưa nhẹ nhàng', 
     1, GETDATE(), 1, GETDATE(), 1, 4.4);
INSERT INTO [dbo].[Products] 
    ([Name], [Slug], [CateID], [Image], [NewPromotion], [Installment], [Discount], [Detail], [Description], [Specification], [Price], [Quantity], [ProPrice], [MetaKey], [MetaDesc], [Status], [Created_at], [Created_by], [Updated_at], [Updated_by], [ProRate])
VALUES
    (N'Combo Burger Zinger', N'combo-burger-zinger', 1, 'combo_burgerzinger.jpg', 1, 0, 10, 
     N'Burger gà Zinger giòn cay cùng nước uống', 
     N'Burger Zinger với lớp vỏ giòn rụm, vị cay nhẹ nhàng tạo cảm giác kích thích vị giác, kèm nước ngọt giúp bữa ăn trở nên cân bằng và hoàn hảo.', 
     N'Thành phần chính: Burger Zinger, nước ngọt', 
     88000, 50, 79200, 
     N'combo burger zinger, burger gà cay, fast food', 
     N'Combo Burger Zinger vị cay nồng', 
     1, GETDATE(), 1, GETDATE(), 1, 4.5);















	 select * from [dbo].[Products]
	CREATE TABLE CART (
    CartID INT PRIMARY KEY,          -- Cart ID
    UsersID INT,                     -- User ID
    ProductsID INT,                  -- Product ID
    Quantity INT,                    -- Quantity
    FOREIGN KEY (UsersID) REFERENCES dbo.Users(ID),       -- Foreign key referencing Users table
    FOREIGN KEY (ProductsID) REFERENCES dbo.Products(ID)   -- Foreign key referencing Products table
);

--DROP TABLE CART;
select * from dbo.Stores
select * from dbo.OrderDetails
select * from dbo.Users
select * from dbo.OrderDetails
--DELETE FROM [DBO].OrderDetails 
--WHERE [ID] = 2 ;
--DELETE FROM [DBO].[Orders]
--WHERE [ID] = 3 ;
DELETE FROM [dbo].[Posts]
WHERE [ID] = 10;
select * from dbo.Posts
DELETE FROM [dbo].Orders
WHERE [ID] = 4;
select * from dbo.Orders
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Order
FOREIGN KEY (OrderId)
REFERENCES Orders(Id)
ON DELETE CASCADE;
select * from Orders

DELETE FROM [dbo].OrderDetails
WHERE [ID] = 4;
DELETE FROM [dbo].Orders
WHERE [ID] = 4;

select * from dbo.Users
DELETE FROM [dbo].Users
WHERE [ID] = 20;