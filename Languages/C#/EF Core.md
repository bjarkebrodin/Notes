---
title: .Net entity framework core
keywords: efcore, migrations
---

# [EFCore Ressources](https://docs.microsoft.com/en-us/ef/core/)

## [Database Provider Packages](https://docs.microsoft.com/en-us/ef/core/providers/?tabs=dotnet-core-cli)

[`Npgsql.EntityFrameworkCore.PostgreSQL`](https://www.npgsql.org/efcore/)
[`Microsoft.EntityFrameworkCore.SqlServer`](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.SqlServer)
[`Microsoft.EntityFrameworkCore.Sqlite`](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Sqlite)
[`MySql.Data.EntityFrameworkCore`](https://www.nuget.org/packages/MySql.Data.EntityFrameworkCore)

## Namespacing

[`Microsoft.EntityFrameworkCore`](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore/5.0.0-rc.1.20451.13)
[`Microsoft.EntityFrameworkCore.Design`](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Design/)
[`Microsoft.EntityFrameworkCore.Tools`](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Tools/)


## Data Annotations

*TL;DR : Primitives are non-nullable unless appended `?` both in C# and SQL*
Nullability of primitive properties can be inferred by EFCore by checking whether the datatype is nullable or not. `int` would be non-nullable and `int?` would be nullable, both in C# and in the database schema, makes sense.

Annotation relevant namespaces
`System.ComponentModel.DataAnnotations`
`System.ComponentModel.DataAnnotations.Schema`

#### The Annotations
```cs
[Key]
[Required]
[Column(TypeName = "value")]
```

## [Migrations](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/?tabs=dotnet-core-cli)

#### Prerequesites

```shell
dotnet tool install --global dotnet-ef
dotnet add package Microsoft.EntityFrameworkCore.Design
```

#### InitialCreate

Crawl the project for tables and create a migration, then update/create the database with the migration.

```ps
dotnet ef migrations add InitialCreate
dotnet ef database update
```


## Misc Tools

[Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/what-is?view=sql-server-ver15)