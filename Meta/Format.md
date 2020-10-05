---
title: Notebook format description
keywords: format
---

# notebook format

doesn't require graphics: 
	write in terminal MD

requires math:
	write in katex

requires graphics:
	write in terminal MD,
	organize graphics in folder
	suffix the folder with .gfx
	and name the folder the same
	name as the file itself

## terminal MD

write all keywords in italic and bold to enable
crawling of keywords to be automated

```md
---
title : the title of the note/article
keywords : buzzword, word, more words, end
?description : optional cohesive rundown of contents?
---

# Header 1
## Header 2
### Header 3

*italic*
**bold**

`code inline`
```code multiline```

$ Math $
$$ Multiline Math $$

[text](link)
![alt](imgURL)
```