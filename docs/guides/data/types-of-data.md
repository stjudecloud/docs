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

In St. Jude Cloud, we stored aligned sequence reads in the ubiquitous BAM file format. BAM files were produced by the [Microsoft Genomics Service][msgen] aligned to HG38 (GRCh38 no alt analysis set). For more information about how Microsoft Genomics produces BAM files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].

For more information on SAM/BAM files, please refer to the [SAM/BAM specification][bam-spec]. 

#### gVCF files

We provide gVCF files produced by the [Microsoft Genomics Service][msgen]. gVCF files are derived from the BAM files produced above as called by [GATK's haplotype caller][gatk-haplotype-caller]. Today, we defer to [the official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files. For more information about how Microsoft Genomics produces gVCF files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].


[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[msgen-whitepaper]: https://azure.microsoft.com/en-us/resources/accelerate-precision-medicine-with-microsoft-genomics/
[gatk-haplotype-caller]: https://software.broadinstitute.org/gatk/documentation/tooldocs/3.8-0/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php
[gvcf-spec]:https://software.broadinstitute.org/gatk/documentation/article?id=11004
[gvcf-diff-from-vcf]: https://software.broadinstitute.org/gatk/documentation/article?id=4017
[bam-spec]: https://samtools.github.io/hts-specs/SAMv1.pdf