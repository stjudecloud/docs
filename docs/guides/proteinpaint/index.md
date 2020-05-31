[ProteinPaint][viz-community-proteinpaint] is the flagship protein-based visualization tool created at St. Jude Children's Research Hospital. You can use it to examine the domains of genes, known isoforms of a given gene, hotspot mutations for single nucleotide variations (SNVs), insertions and deletions (Indels), and structural variations (SVs) in both pediatric and adult cancers, and RNA-seq expression of a given protein in different tumour types. 

There are two primary ways you can use ProteinPaint. You can use ProteinPaint to explore mutations our curated pediatric and adult cohorts using [PeCan][pecan] (ex: [TP53][pecan-tp53]). If you'd like to create and publish to the community your own visualizations with ProteinPaint, you can do so with the [Visualization Community][viz-community] (**still in development, available soon!**).

## Features


* Explore SNV and Indel mutations from the Pediatric, COSMIC, and ClinVar datasets ([learn more][loading-datasets]).
* Load custom protein domains and annotations ([learn more][custom-protein-domains]).
* Filtering of mutations based on class and origin ([learn more][filtering-mutations]).
    -   [[Viewing details about
        > mutations]{.underline}](https://docs.google.com/document/d/15Ob3Ll4D7dL1NycgTFKja4aX6unYwUoeMZHPXoEA0j0/edit?usp=sharing),
        > including disease chart and table

    -   [[Stratifying mutations based on cancer types and
        > subtypes]{.underline}](https://docs.google.com/document/d/1gQCypfjOhfRtv2hVVM16Ku5qVpLFAKFfiSshHeZXgNw/edit?usp=sharing)

    -   [[Submitting custom SNV/indel mutation
        > data]{.underline}](https://plus.google.com/+XinZhou_s/posts/B9iVVGAL2u9)

    -   [[Zooming in to browse mutations at nucleotide
        > level]{.underline}](https://plus.google.com/u/0/+XinZhou_s/posts/5Ji9ZkecaDD)

    -   [[Exporting figure or
        > data]{.underline}](https://docs.google.com/document/d/1jIcBtfBQaRBV8EdD3JclXfHSYYkmB_O4xGLoRiOiklA/edit?usp=sharing)

-   [[Exploring fusion
    > genes]{.underline}](https://docs.google.com/document/d/1BmKSLc4lPuwyUCcyak8jlgjMnkM-8sAzvnsGnaMcaV0/edit?usp=sharing)

-   [[Exploring Pediatric gene expression
    > data]{.underline}](https://docs.google.com/document/d/1bjgPWfXgwKl0E1yPQucTugklSV7DUaX3fbLFAt3o_RI/edit?usp=sharing),
    > including "rope graph", boxplots, and sunburst charts

-   [[Embedding ProteinPaint in your web
    > page]{.underline}](https://docs.google.com/document/d/1KNx4pVCKd4wgoHI4pjknBRTLrzYp6AL_D-j6MjcQSvQ/edit?usp=sharing)

### Using custom data

-   [[Making a study
    > view]{.underline}](https://drive.google.com/open?id=121SsSYiCb3NCU8jz0bF7UujFSN-1Y20b674dqa30iXE)

-   Loading a tab-delimited text files of mutations

    -   [[Launching the file upload
        > function]{.underline}](https://docs.google.com/document/d/15NtAMVNtLNxJ7YAWFk2P6iE2jYDR6YSnXb46HVujT3g/edit?usp=sharing)

    -   [[User
        > interface]{.underline}](https://docs.google.com/document/d/1HhknffsTwWTS6Dmz-7kFnPGNs-nq_OqHcqRS64RJBS0/edit?usp=sharing),
        > see below for detailed description of each component

        -   [[Gene
            > table]{.underline}](https://docs.google.com/document/d/1NrH1H-FUWJtEKLk69V-k8uaYHOr9YO2obM9ZLZslEQ0/edit?usp=sharing)

        -   [[Sample
            > table]{.underline}](https://docs.google.com/document/d/1buFKS9CN6HNjdFKNh1sJwULeJESQ7ftZntF52dpjFrY/edit?usp=sharing)

        -   [[Heatmap]{.underline}](https://docs.google.com/document/d/1JA9O4dUSwCga4Ua4DK3vbG0x9JGtKuI3j-9gjb6Tz6U/edit?usp=sharing)

        -   [[Disease pie
            > charts]{.underline}](https://docs.google.com/document/d/1HQcTva3svRAgICllbrDeNEoXmfc-mYl3hjqVULUQmxw/edit?usp=sharing)

    -   Data formats:

        -   [[SNV and
            > indel]{.underline}](https://docs.google.com/document/d/1OJ9aXq2_-a3BfIQdKLYCYzrJRTpu4_9i3gephTY-Z38/edit?usp=sharing),
            > supports both MAF and customized format

            -   Example: [[Loading TCGA MAF
                > file]{.underline}](https://docs.google.com/document/d/1Aexsd7eYxPIm2FnIIDmDOajLfVv7zl9xyxzt55kFUYc/edit?usp=sharing)

        -   [[SV and fusion
            > transcript]{.underline}](https://drive.google.com/open?id=1klDZ0MHVkQTW2-lCu_AvpRE4_FcbhdB-yI17wNdPaOM)

        -   [[CNV]{.underline}](https://drive.google.com/open?id=1WHptqOWNf96V0bYEDpj-EsKZGYnbBNc9aQIrhzdEJaU):
            > copy number change

        -   [[ITD: internal tandem
            > duplication]{.underline}](https://drive.google.com/open?id=1Bh9awBsraoHbV8iWXv_3oDeXMsjIAHaOKHr973IJyZc)

        -   [[Intragenic
            > deletion]{.underline}](https://drive.google.com/open?id=1tWbf3rg3BmVIZPGGPk023P0aBkDw_ry5XuZLGyGodyg)

        -   [[Truncation: N-loss or
            > C-loss]{.underline}](https://drive.google.com/open?id=1P1g-Y8r30pSKfan1BhYZcsUtSk7wRb4plaO1S-JCJr4)

### Using genome browser

-   Quick links

    -   Human

        -   [[https://proteinpaint.stjude.org/?block=1&genome=hg19]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=hg19)

        -   [[https://proteinpaint.stjude.org/?block=1&genome=hg38]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=hg38)

    -   Mouse

        -   [[https://proteinpaint.stjude.org/?block=1&genome=mm9]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=mm9)

        -   [[https://proteinpaint.stjude.org/?block=1&genome=mm10]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=mm10)

    -   Fruit fly

        -   [[https://proteinpaint.stjude.org/?block=1&genome=dm3]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=dm3)

        -   [[https://proteinpaint.stjude.org/?block=1&genome=dm6]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=dm6)

    -   Zebra fish

        -   [[https://proteinpaint.stjude.org/?block=1&genome=danRer10]{.underline}](https://proteinpaint.stjude.org/?block=1&genome=danRer10)

-   [[Adding
    > tracks]{.underline}](https://drive.google.com/open?id=1ZnPZKSSajWyNISSLELMozKxrZHQbdxQkkkQFnxw6zTs)

    -   [[VCF]{.underline}](https://drive.google.com/open?id=1dbuYeQR6cgkpzcPaIChRFtXwolJVheoTr9NEW_Mfthw),
        > SNV/indel only

    -   bigWig, see "adding tracks"

    -   [[JSON-BED]{.underline}](https://drive.google.com/open?id=1GP81rer7YEb0RpIej2XXfx-k7SCAL1Od9At_oczf06A)

    -   [[Splice
        > junction]{.underline}](https://drive.google.com/open?id=1PFva3Mn-U4VPNW0vHHC-CSnYBeotRnqbhCMQPmyLQG4)

    -   [[Genomic profile + gene
        > value]{.underline}](https://drive.google.com/open?id=1yrRpDUZWSRGuCa0snGwRuo721WRHgdYTX7GWIsZ_fSY)

    -   [[BAMpile]{.underline}](https://drive.google.com/open?id=1ZS0v_t1WvZ4NX8LRhWRM9twl-M3IZt7b4tRCPKyYW1M)

![](../../images/guides/proteinpaint/index/media/image1.png){width="7.1in"
height="7.041666666666667in"}

[pecan]: https://pecan.stjude.cloud
[viz-community]: https://viz.stjude.cloud
[pecan-tp53]: https://pecan.stjude.org/proteinpaint/TP53
[viz-community-proteinpaint]: https://viz.stjude.cloud/tools/proteinpaint

[custom-protein-domains]: ./custom-protein-domains.md
[loading-datasets]: ./loading-datasets.md
[filtering-mutations]: ./filtering-mutations.md