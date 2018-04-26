/*
Navicat SQL Server Data Transfer

Source Server         : FeedBox
Source Server Version : 140000
Source Host           : 192.168.9.4:1433
Source Database       : FeedBox
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 140000
File Encoding         : 65001

Date: 2018-04-26 21:16:57
*/


-- ----------------------------
-- Table structure for tray_type_manage
-- ----------------------------
DROP TABLE [dbo].[tray_type_manage]
GO
CREATE TABLE [dbo].[tray_type_manage] (
[tray_id] varchar(100) NOT NULL ,
[tray_type] int NULL ,
[onoff] int NULL ,
[alert_color] varchar(20) NULL ,
[tray_name] varchar(50) NULL ,
[alarm_time_s] datetime NULL ,
[alarm_time_e] datetime NULL 
)


GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tray_type_manage', 
'COLUMN', N'tray_id')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'tray_id'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'主键'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'tray_id'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tray_type_manage', 
'COLUMN', N'tray_type')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'托盘类型(1:缸体、2:缸盖、3:曲轴、4:连杆、5:平衡轴)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'tray_type'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'托盘类型(1:缸体、2:缸盖、3:曲轴、4:连杆、5:平衡轴)'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'tray_type'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tray_type_manage', 
'COLUMN', N'onoff')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'是否开启报警'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'onoff'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'是否开启报警'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'onoff'
GO
IF ((SELECT COUNT(*) from fn_listextendedproperty('MS_Description', 
'SCHEMA', N'dbo', 
'TABLE', N'tray_type_manage', 
'COLUMN', N'alarm_time_s')) > 0) 
EXEC sp_updateextendedproperty @name = N'MS_Description', @value = N'报警开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'alarm_time_s'
ELSE
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'报警开始时间'
, @level0type = 'SCHEMA', @level0name = N'dbo'
, @level1type = 'TABLE', @level1name = N'tray_type_manage'
, @level2type = 'COLUMN', @level2name = N'alarm_time_s'
GO

-- ----------------------------
-- Records of tray_type_manage
-- ----------------------------
INSERT INTO [dbo].[tray_type_manage] ([tray_id], [tray_type], [onoff], [alert_color], [tray_name], [alarm_time_s], [alarm_time_e]) VALUES (N'1', N'33', N'33', N'3', N'3', N'2018-04-26 18:38:03.000', N'2018-04-28 18:38:07.000')
GO
GO

-- ----------------------------
-- Indexes structure for table tray_type_manage
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table tray_type_manage
-- ----------------------------
ALTER TABLE [dbo].[tray_type_manage] ADD PRIMARY KEY ([tray_id])
GO
