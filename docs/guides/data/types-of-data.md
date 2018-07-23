# Data types

!!! note
    This section of the documentation is currently under construction. If your question is not answered here,
    please [contact us](https://stjude.cloud/contact)!

St. Jude Cloud hosts both raw genomic data files and processed results files:

| File Type | Description                                                                    | Details                   |
|-----------|--------------------------------------------------------------------------------|---------------------------|
| BAM       | HG38 aligned BAM files produced by [Microsoft Genomics Service][msgen]         | [Click here](#bam-files)  |
| gVCF      | [Genomic VCF][gvcf-spec] files produced by [Microsoft Genomics Service][msgen] | [Click here](#gvcf-files) |
|           |                                                                                |                           |

#### BAM files

A BAM file (.bam) is the binary version of a SAM file. A SAM file (.sam) is a tab-delimited text file that contains sequence alignment data.

#### gVCF files

Today, we defer to the [official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files.


[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]:https://software.broadinstitute.org/gatk/documentation/article?id=11004
[gvcf-diff-from-vcf]: https://software.broadinstitute.org/gatk/documentation/article?id=4017