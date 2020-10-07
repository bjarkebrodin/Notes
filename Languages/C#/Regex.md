---
title: C# Regex use
tags: c#, regex, regular, expression, string matching
---

# Regular expressions in C#

C# regex utilities can be found within the namespace `System.Text.RegularExpressions`.

## Regex use

Check if string contains digits

```cs
string pattern = @"\d+";
Match match = Regex.Match("22", pattern);
bool isMatch = match.Success;
```

Find multiple values matching groups

```cs
string word_pattern = @"[a-zA-Z]+",
       middle_names = $"({word_pattern} *)+",
       name_pattern = $"^(?<firstName>{word_pattern})( (?<middleNames>{middle_names}))? (?<lastName>{word_pattern})$";

string me = "Bjarke Brodin Larsen";

Match match = Regex.Match(me, name_pattern);

string first = match.Groups["firstName"].ToString(),
       middle = match.Groups["middleNames"].ToString(),
       last = match.Groups["lastName"].ToString();
```

// todo : Backreferencing and smart stuff