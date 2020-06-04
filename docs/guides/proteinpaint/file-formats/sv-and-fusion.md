**Tabular data format for SV and fusion events**

First line must be the header line, with following columns.

-   gene\_a

    -   gene on 5\' end of a fusion. Do not apply value for intergenic break-end.

-   isoform\_a

    -   The RefSeq/Ensembl accession of gene\_a. Leave blank for intergenic break-end.

-   chr\_a

    -   Chromosome name of gene\_a. In case of intergenic translocation, use the 5\' end of the break point. Use name "chr10" but not "10".

-   position\_a

    -   Chromosomal position of the 5\' end break point, 0-based.

-   strand\_a

    -   \+ or -

-   gene\_b

    -   Gene on 3\' end of a fusion. In case of intergenic translocation, leave unspecified.

-   isoform\_b

    -   The RefSeq/Ensembl accession of gene\_b. Leave blank for intergenic break-end.

-   chr\_b

    -   Chromosome name of gene\_b. In case of intergenic translocation, use the 3\' end of the break point.

-   position\_b

    -   Chromosomal position of the 3\' end break point, 0-based.

-   strand\_b

    -   + or -

Optional columns:

-   Patient

-   Sample

-   Sampletype

Order of column doesn't matter.

Lines starting with "#" will be ignored.
