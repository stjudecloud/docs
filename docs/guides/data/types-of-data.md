# Data types

!!! note
    This section of the documentation is currently under construction. If your question is not answered here,
    please [contact us](https://stjude.cloud/contact)!

St. Jude Cloud hosts both raw genomic data files and processed results files:

| File Type   | Short Description                                                                            | Details                          |
| ----------- | -------------------------------------------------------------------------------------------- | -------------------------------- |
| BAM         | HG38 aligned BAM files produced by [Microsoft Genomics Service][msgen]                       | [Click here](#bam-files)         |
| gVCF        | [Genomic VCF][gvcf-spec] files produced by [Microsoft Genomics Service][msgen]               | [Click here](#gvcf-files)        |
| Somatic VCF | Curated list of somatic pipelines produced by the St. Jude somatic variant analysis pipeline | [Click here](#somatic-vcf-files) |

#### BAM files

A BAM file (.bam) is the binary version of a SAM file. A SAM file (.sam) is a tab-delimited text file that contains sequence alignment data.

#### gVCF files

Today, we defer to the [official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files.

#### Somatic VCF files

Somatic VCF files contain HG38 based SNV/Indel variant calls from the St. Jude somatic variant analysis pipeline as follows. Broadly speaking:

1. Reads were aligned to HG19 using [bwa backtrack][bwa] (`bwa aln` + `bwa sampe`) using default parameters.
2. Post processing of aligned reads was performed using [Picard][picard] `CleanSam` and `MarkDuplicates`.
3. Variants were called using the [Bambino][bambino-paper] variant caller (you can download by navigating [here][bambino-program] and searching for "Bambino package").
4. Variants were post-processed using a in-house post-processing pipeline that cleans and annotates variants. This pipeline is not currently publicly available.
5. Variants were manually reviewed by analysts and published with [the relevant Pediatric Cancer Genome Project (PCGP) paper][pcgp-landing-page].
6. Post-publication, variants were lifted over to HG38 (the original HG19 coordinates are stored in the `HG19` INFO field.).

For more information on variants for each of the individuals, please refer to the relevant PCGP paper. For more information on the variant calling format (VCF), please see the latest specification for VCF document listed [here][hts-specs].

[bwa]: http://bio-bwa.sourceforge.net/
[picard]: https://broadinstitute.github.io/picard/
[bambino-paper]: https://academic.oup.com/bioinformatics/article/27/6/865/236751
[bambino-program]: https://www.stjuderesearch.org/site/lab/zhang
[pcgp-landing-page]: https://www.stjude.org/research/pediatric-cancer-genome-project.html
[hts-specs]: https://samtools.github.io/hts-specs/
[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]:https://software.broadinstitute.org/gatk/documentation/article?id=11004
[gvcf-diff-from-vcf]: https://software.broadinstitute.org/gatk/documentation/article?id=4017