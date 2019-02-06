# Data types

!!! note
    This section of the documentation is currently under construction. If your question is not answered here,
    please [contact us](https://stjude.cloud/contact)!

St. Jude Cloud hosts both raw genomic data files and processed results files:

| File Type   | Short Description                                                                            | Details                          |
| ----------- | -------------------------------------------------------------------------------------------- | -------------------------------- |
| BAM         | HG38 aligned BAM files produced by [Microsoft Genomics Service][msgen]                       | [Click here](#bam-files)         |
| gVCF        | [Genomic VCF][gvcf-spec] files produced by [Microsoft Genomics Service][msgen]               | [Click here](#gvcf-files)        |
| Somatic VCF | Curated list of somatic variants produced by the St. Jude somatic variant analysis pipeline | [Click here](#somatic-vcf-files) |
| CNV | list of somatic copy number alterations produced by St. Jude CONSERTING pipeline | [Click here](#cnv-files) |


#### BAM files

In St. Jude Cloud, we stored aligned sequence reads in the ubiquitous BAM file format. BAM files were produced by the [Microsoft Genomics Service][msgen] aligned to HG38 (GRCh38 no alt analysis set). For more information about how Microsoft Genomics produces BAM files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].

For more information on SAM/BAM files, please refer to the [SAM/BAM specification][bam-spec]. 

#### gVCF files

We provide gVCF files produced by the [Microsoft Genomics Service][msgen]. gVCF files are derived from the BAM files produced above as called by [GATK's haplotype caller][gatk-haplotype-caller]. Today, we defer to [the official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files. For more information about how Microsoft Genomics produces gVCF files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].

#### Somatic VCF files

Somatic VCF files contain HG38 based SNV/Indel variant calls from the St. Jude somatic variant analysis pipeline as follows. Broadly speaking:

1. Reads were aligned to HG19 using [bwa backtrack][bwa] (`bwa aln` + `bwa sampe`) using default parameters.
2. Post processing of aligned reads was performed using [Picard][picard] `CleanSam` and `MarkDuplicates`.
3. Variants were called using the [Bambino][bambino-paper] variant caller (you can download by navigating [here][bambino-program] and searching for "Bambino package").
4. Variants were post-processed using an in-house post-processing pipeline that cleans and annotates variants. This pipeline is not currently publicly available.
5. Variants were manually reviewed by analysts and published with [the relevant Pediatric Cancer Genome Project (PCGP) paper][pcgp-landing-page].
6. Post-publication, variants were lifted over to HG38 (the original HG19 coordinates are stored in the `HG19` INFO field.).

For more information on variants for each of the individuals, please refer to the relevant PCGP paper. For more information on the variant calling format (VCF), please see the latest specification for VCF document listed [here][hts-specs].


#### CNV files

CNV files contain copy number alteration (CNA) analysis results for paired tumor-normal WGS samples. Files are produced by running paired tumor-normal BAM files through the [CONSERTING][conserting] pipeline which identifies CNA through iterative analysis of (i) local segmentation by read depth within boundaries identified by structural variation (SV) breakpoints followed by (ii) segment merging and local SV analysis. [CREST][crest] was used to identify local SV breakpoints. CNV files contain the following information:

| Field | Description |
|--------| ------------|
|chrom | chromosome |
|loc.start| start of segment|
|loc.end| end of segment |
|num.mark| number of windows retained in the segment (gaps and windows with low mappability are excluded)|
|length.ratio| The ratio between the length of the used windows to the genomic length|
|seg.mean| The estimated GC corrected difference signal (2 copy gain will have a seg.mean of 1)|
|GMean| The mean coverage in the germline sample (a value of 1 represents diploid)|
|DMean| The mean coverage in the tumor sample|
|LogRatio| Log2 ratio between tumor and normal coverage|
|Quality score| A empirical score used in merging |
|SV_Matching| whether the boundary of the segments were supported by SVs (3: both ends supported, 2: right end supported, 1: left end supported, 0: neither end supported)|


[crest]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3527068/
[conserting]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4591043/
[bwa]: http://bio-bwa.sourceforge.net/
[picard]: https://broadinstitute.github.io/picard/
[bambino-paper]: https://academic.oup.com/bioinformatics/article/27/6/865/236751
[bambino-program]: https://www.stjuderesearch.org/site/lab/zhang
[pcgp-landing-page]: https://www.stjude.org/research/pediatric-cancer-genome-project.html
[hts-specs]: https://samtools.github.io/hts-specs/
[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[msgen-whitepaper]: https://azure.microsoft.com/en-us/resources/accelerate-precision-medicine-with-microsoft-genomics/
[gatk-haplotype-caller]: https://software.broadinstitute.org/gatk/documentation/tooldocs/3.8-0/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php
[gvcf-spec]:https://software.broadinstitute.org/gatk/documentation/article?id=11004
[gvcf-diff-from-vcf]: https://software.broadinstitute.org/gatk/documentation/article?id=4017
[bam-spec]: https://samtools.github.io/hts-specs/SAMv1.pdf

