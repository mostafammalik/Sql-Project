USE [e-commerce]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[name] [char](10) NULL,
	[email] [varchar](50) NOT NULL,
	[rules] [char](10) NULL,
 CONSTRAINT [PK_admin] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categry]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](100) NULL,
 CONSTRAINT [PK_categry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contain]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contain](
	[id_product] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[number_of_unites] [int] NULL,
	[customer_id] [int] NOT NULL,
 CONSTRAINT [PK_contain] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC,
	[id_order] ASC,
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[ssn] [int] IDENTITY(1,1) NOT NULL,
	[fname] [char](10) NULL,
	[lname] [char](10) NULL,
	[gen] [char](10) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[make]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[make](
	[id_cust] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_make] PRIMARY KEY CLUSTERED 
(
	[id_cust] ASC,
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newcontain]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newcontain](
	[id_product] [int] NOT NULL,
	[id_order] [int] NOT NULL,
	[number_of_unites] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_price]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_price](
	[orderid] [int] NULL,
	[total] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[totalprice] [int] NULL,
	[id_tracking] [char](10) NULL,
	[payment_method] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[dt_exp] [date] NULL,
	[prod_date] [date] NULL,
	[id_catagry] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stuff]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stuff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[supplier_id] [int] NOT NULL,
	[role] [nvarchar](200) NULL,
 CONSTRAINT [PK_stuff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[url_web] [varchar](50) NULL,
 CONSTRAINT [PK_supply] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supply]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supply](
	[id_supplier] [int] NOT NULL,
	[id_prod] [int] NOT NULL,
 CONSTRAINT [PK_supply_1] PRIMARY KEY CLUSTERED 
(
	[id_supplier] ASC,
	[id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tracking_details]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tracking_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_no] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tracking_details] PRIMARY KEY CLUSTERED 
(
	[order_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehichle]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehichle](
	[ssn] [char](10) NOT NULL,
	[color] [nchar](10) NULL,
	[id_staff] [int] NULL,
	[Suplier_id] [int] NOT NULL,
 CONSTRAINT [PK_vehichle] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[website]    Script Date: 7/4/2024 3:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[website](
	[url] [varchar](50) NOT NULL,
	[name] [char](10) NULL,
	[admin_email] [varchar](50) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[contain] ADD  CONSTRAINT [DF_contain_number_of_unites]  DEFAULT ((1)) FOR [number_of_unites]
GO
ALTER TABLE [dbo].[contain]  WITH CHECK ADD  CONSTRAINT [FK_contain_customer] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([ssn])
GO
ALTER TABLE [dbo].[contain] CHECK CONSTRAINT [FK_contain_customer]
GO
ALTER TABLE [dbo].[make]  WITH CHECK ADD  CONSTRAINT [FK_make_customer] FOREIGN KEY([id_cust])
REFERENCES [dbo].[customer] ([ssn])
GO
ALTER TABLE [dbo].[make] CHECK CONSTRAINT [FK_make_customer]
GO
ALTER TABLE [dbo].[make]  WITH CHECK ADD  CONSTRAINT [FK_make_order] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[make] CHECK CONSTRAINT [FK_make_order]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_categry] FOREIGN KEY([id_catagry])
REFERENCES [dbo].[categry] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_categry]
GO
ALTER TABLE [dbo].[stuff]  WITH CHECK ADD  CONSTRAINT [FK_stuff_supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[stuff] CHECK CONSTRAINT [FK_stuff_supplier]
GO
ALTER TABLE [dbo].[supplier]  WITH CHECK ADD  CONSTRAINT [FK_supplier_Table_1] FOREIGN KEY([url_web])
REFERENCES [dbo].[website] ([url])
GO
ALTER TABLE [dbo].[supplier] CHECK CONSTRAINT [FK_supplier_Table_1]
GO
ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_product] FOREIGN KEY([id_prod])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_product]
GO
ALTER TABLE [dbo].[supply]  WITH CHECK ADD  CONSTRAINT [FK_supply_supplier] FOREIGN KEY([id_supplier])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[supply] CHECK CONSTRAINT [FK_supply_supplier]
GO
ALTER TABLE [dbo].[vehichle]  WITH CHECK ADD  CONSTRAINT [FK_vehichle_stuff] FOREIGN KEY([id_staff])
REFERENCES [dbo].[stuff] ([id])
GO
ALTER TABLE [dbo].[vehichle] CHECK CONSTRAINT [FK_vehichle_stuff]
GO
ALTER TABLE [dbo].[vehichle]  WITH CHECK ADD  CONSTRAINT [FK_vehichle_supplier] FOREIGN KEY([Suplier_id])
REFERENCES [dbo].[supplier] ([id])
GO
ALTER TABLE [dbo].[vehichle] CHECK CONSTRAINT [FK_vehichle_supplier]
GO
ALTER TABLE [dbo].[website]  WITH CHECK ADD  CONSTRAINT [FK_website_admin] FOREIGN KEY([admin_email])
REFERENCES [dbo].[admin] ([email])
GO
ALTER TABLE [dbo].[website] CHECK CONSTRAINT [FK_website_admin]
GO
