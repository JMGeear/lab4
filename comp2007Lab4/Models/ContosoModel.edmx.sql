
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 07/22/2015 12:02:11
-- Generated from EDMX file: C:\Users\Jeff\Documents\GitHub\comp2007Lab4\comp2007Lab4\Models\ContosoModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [comp2007];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Courses_DepartmentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Courses] DROP CONSTRAINT [FK_Courses_DepartmentID];
GO
IF OBJECT_ID(N'[dbo].[FK_Enrollments_CourseID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT [FK_Enrollments_CourseID];
GO
IF OBJECT_ID(N'[dbo].[FK_Enrollments_StudentID]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Enrollments] DROP CONSTRAINT [FK_Enrollments_StudentID];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[Departments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departments];
GO
IF OBJECT_ID(N'[dbo].[Enrollments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Enrollments];
GO
IF OBJECT_ID(N'[dbo].[Students]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Students];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [CourseID] int IDENTITY(1,1) NOT NULL,
    [Title] varchar(100)  NOT NULL,
    [Credits] int  NOT NULL,
    [DepartmentID] int  NOT NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [DepartmentID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Budget] decimal(18,2)  NULL
);
GO

-- Creating table 'Enrollments'
CREATE TABLE [dbo].[Enrollments] (
    [EnrollmentID] int IDENTITY(1,1) NOT NULL,
    [CourseID] int  NOT NULL,
    [StudentID] int  NOT NULL,
    [Grade] int  NULL
);
GO

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentID] int IDENTITY(1,1) NOT NULL,
    [LastName] varchar(50)  NOT NULL,
    [FirstMidName] varchar(50)  NOT NULL,
    [EnrollmentDate] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CourseID] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([CourseID] ASC);
GO

-- Creating primary key on [DepartmentID] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([DepartmentID] ASC);
GO

-- Creating primary key on [EnrollmentID] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [PK_Enrollments]
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC);
GO

-- Creating primary key on [StudentID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [DepartmentID] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_Courses_DepartmentID]
    FOREIGN KEY ([DepartmentID])
    REFERENCES [dbo].[Departments]
        ([DepartmentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Courses_DepartmentID'
CREATE INDEX [IX_FK_Courses_DepartmentID]
ON [dbo].[Courses]
    ([DepartmentID]);
GO

-- Creating foreign key on [CourseID] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [FK_Enrollments_CourseID]
    FOREIGN KEY ([CourseID])
    REFERENCES [dbo].[Courses]
        ([CourseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Enrollments_CourseID'
CREATE INDEX [IX_FK_Enrollments_CourseID]
ON [dbo].[Enrollments]
    ([CourseID]);
GO

-- Creating foreign key on [StudentID] in table 'Enrollments'
ALTER TABLE [dbo].[Enrollments]
ADD CONSTRAINT [FK_Enrollments_StudentID]
    FOREIGN KEY ([StudentID])
    REFERENCES [dbo].[Students]
        ([StudentID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Enrollments_StudentID'
CREATE INDEX [IX_FK_Enrollments_StudentID]
ON [dbo].[Enrollments]
    ([StudentID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------