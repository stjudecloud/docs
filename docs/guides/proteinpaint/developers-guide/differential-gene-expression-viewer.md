## `mavolcanoplot:{}`

Will launch the differential gene expression viewer that renders the
data in MA-plot and Volcano-plot.

Keys:

-   **input:"... ..."**
    -   A long string of differential gene expression data.
-   **url:"..."**
    -   The URL of a single text file of the differential gene expression data, based on [format specification](https://docs.google.com/document/d/1gEhywyMzMQRM10NFvsObw1yDSWxVY7pxYjsQ2-nd6x4/edit?usp=sharing).
-   **dataname:"whatever"**
    -   Name of the dataset
-   **tracks:[]**
    -   Optional. Provides a set of tracks to be displayed over the selected gene when clicking a gene in the MA/Volcano plot.
    -   Supported tracks:
        -   bigWig
        -   Stranded bigWig
        -   [Refer to this tutorial for declaring tracks](https://docs.google.com/document/d/1ZnPZKSSajWyNISSLELMozKxrZHQbdxQkkkQFnxw6zTs/edit?usp=sharing)
    -   This requires the values in the "gene" column of the differential expression file to be valid gene names, so that the genomic position can be derived based on the gene name for launching the genome browser.

**Note for browsing stranded bigWig tracks on DNANexus:**

The bigWig format file must be named as following to be recognized:

-   *.posStrand.bw
-   *.negStrand.bw
