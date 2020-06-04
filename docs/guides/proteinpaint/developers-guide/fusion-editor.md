## `fusioneditor:{}`

Will launch the [[Fusion
Editor]{.underline}](https://drive.google.com/open?id=1DRVzE_WenG490eRYB7VGFOygtSqtF5L97rhK0HOUCNY),
value is an object, keys:

-   input:"... ..."
    -   A long string of fusion gene data (from CICERO output). \\n as line break, tab separates columns, first line is header, refer to [[Format
        specification]{.underline}](https://drive.google.com/open?id=1klDZ0MHVkQTW2-lCu_AvpRE4_FcbhdB-yI17wNdPaOM)
-   urls:[ URL1, URL2, ... ]
    -   List of URLs of text files as input, format of each file should match specification: [Format specification](https://drive.google.com/open?id=1klDZ0MHVkQTW2-lCu_AvpRE4_FcbhdB-yI17wNdPaOM)
    -   "urls" will be ignored if "input" is set.
-   dataname
    -   Name of this dataset

Example:
[https://proteinpaint.stjude.org/examples/fusioneditor.html](https://proteinpaint.stjude.org/examples/fusioneditor.html)
