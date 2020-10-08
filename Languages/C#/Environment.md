---
title: C# Environment & Frameworks
tags: asp.net, blazor, razor, efcore, entityframework, csc, csi, dotnet, core
---

# Environmental tools and frameworks

## .NET Core

```
csi     // interactive repl
csc     // compiler
dotnet  // general development tools
nuget   // .net package management
```

[NuGet Home](https://www.nuget.org/)
[Microsoft Reference](https://docs.microsoft.com/en-us/dotnet/)


## Testing

`dotnet list package --outdated` can assist in keeping packages up to date.

The `coverlet.msbuild` package can help testing more informatively.

```
# install coverlet
dotnet add package coverlet.msbuild

# run on changes
dotnet watch --project <pathToTestProj> test /p:CollectCoverage=true \/p:CoverletOutputFormat=lcov /p:CoverletOutput=./obj/lcov.info
```

todo: make a script to ease setup


### Misc: Update All Packages

```cs
$regex = 'PackageReference Include="([^"]*)" Version="([^"]*)"'

Get-ChildItem -Recurse | Where-Object Extension -Like "*proj" | ForEach-Object {
    $projectName = $PSItem.Name
    $project = $PSItem.FullName
    Get-Content -Path $project |
    Select-String -Pattern $regex |
    ForEach-Object {
        $package = $PSItem.Matches.Groups[1].Value
        Write-Host -Object "Updating $package in $projectName..." -ForegroundColor Green
        Invoke-Expression -Command "dotnet add `"$project`" package $package"
    }
}
```