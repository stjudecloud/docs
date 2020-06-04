## `studyview:{}`

(this part is being updated)

Loads a study view by accepting various types of data.

For mutation data including SNV/indel, ITD, sv/fusion, truncation,
intragenic deletion, CNV, data should be submitted as a string variable
that contain the entire content of a text file.

```javascript
studyview: {
    snvindel:"a string, \n as line breaks, first line is header",
    svjson:"sv/fusion/itd/trunctation/deletion data in json format … ",
    cnv:"cnv data in tabular format, \n as line breaks, first line is header ", 
    name:"name of this dataset",
    genome:"hg19",
}
```

The "studyview" object is very similar to the [[JSON definition of
study]{.underline}](https://drive.google.com/open?id=121SsSYiCb3NCU8jz0bF7UujFSN-1Y20b674dqa30iXE),
with most attributes applicable here, except these:

-   mutationset : \[\]

-   dbexpression : {}

## `study:"path/to/studyconfigfile"`

Loads a study view from a server-side JSON file.

Value is the JSON file path starting from \<TP\> path.

[[Visit here for JSON file
format]{.underline}](https://drive.google.com/open?id=121SsSYiCb3NCU8jz0bF7UujFSN-1Y20b674dqa30iXE).