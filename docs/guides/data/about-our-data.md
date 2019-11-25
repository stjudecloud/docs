#About Our Data

## File Formats

St. Jude Cloud hosts both raw genomic data files and processed results files:

| File Type   | Short Description                                                                                                 | Details                          |
| ----------- | ----------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| BAM         | HG38 aligned BAM files produced by [Microsoft Genomics Service][msgen] (DNA-Seq) or STAR 2-pass mapping (RNA-Seq). | [Click here](#bam-files)         |
| gVCF        | [Genomic VCF][gvcf-spec] files produced by [Microsoft Genomics Service][msgen].                                    | [Click here](#gvcf-files)        |
| Somatic VCF | Curated list of somatic variants produced by the St. Jude somatic variant analysis pipeline.                       | [Click here](#somatic-vcf-files) |
| CNV         | List of somatic copy number alterations produced by St. Jude CONSERTING pipeline.                                  | [Click here](#cnv-files)         |


### BAM files

In St. Jude Cloud, we store aligned sequence reads in BAM file format for whole genome sequencing, whole exome sequencing, and RNA-seq. For more information on SAM/BAM files, please refer to the [SAM/BAM specification][bam-spec]. For research samples, we require the standard 30X coverage for whole genome and 100X for whole exome sequencing. For clinical samples, we require higher coverage, 45X, for whole genome sequencing due to tumor purity issues found in clinical tumor specimens. For RNA-Seq, since only a subset of genes are expressed in a specific tissue, we require 30% of the exons to have 20X coverage in order to ensure that at least 30% of the expressed genes have sufficient coverage.

### gVCF files

We provide gVCF files produced by the [Microsoft Genomics Service][msgen]. gVCF files are derived from the BAM files produced above as called by [GATK's haplotype caller][gatk-haplotype-caller]. Today, we defer to [the official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files. For more information about how Microsoft Genomics produces gVCF files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].

### Somatic VCF files

Somatic VCF files contain HG38 based SNV/Indel variant calls from the St. Jude somatic variant analysis pipeline as follows. Broadly speaking:

1. Reads were aligned to HG19 using [bwa backtrack][bwa] (`bwa aln` + `bwa sampe`) using default parameters.
2. Post processing of aligned reads was performed using [Picard][picard] `CleanSam` and `MarkDuplicates`.
3. Variants were called using the [Bambino][bambino-paper] variant caller (you can download Bambino [here][bambino-download] or by navigating to the [Zhang Lab page][bambino-program] where the  "Bambino package" is listed as a dependency under the CONSERTING section).
4. Variants were post-processed using an in-house post-processing pipeline that cleans and annotates variants. This pipeline is not currently publicly available.
5. Variants were manually reviewed by analysts and published with [the relevant Pediatric Cancer Genome Project (PCGP) paper][pcgp-landing-page].
6. Post-publication, variants were lifted over to HG38 (the original HG19 coordinates are stored in the `HG19` INFO field.).

!!! note
    **Our Somatic VCF files were designed specifically for St. Jude Cloud visualization purposes. Variants in these files were manually curated from analyses across multiple sequencing types including WGS and WES.**  
    For more information on variants for each of the individuals, please refer to the relevant PCGP paper. For more information on the variant calling format (VCF), please see the latest specification for VCF document listed [here][hts-specs].


### CNV files

CNV files contain copy number alteration (CNA) analysis results for paired tumor-normal WGS samples. Files are produced by running paired tumor-normal BAM files through the [CONSERTING][conserting] pipeline which identifies CNA through iterative analysis of (i) local segmentation by read depth within boundaries identified by structural variation (SV) breakpoints followed by (ii) segment merging and local SV analysis. [CREST][crest] was used to identify local SV breakpoints. CNV files contain the following information:

| Field         | Description                                                                                                                                                  |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| chrom         | chromosome                                                                                                                                                   |
| loc.start     | start of segment                                                                                                                                             |
| loc.end       | end of segment                                                                                                                                               |
| num.mark      | number of windows retained in the segment (gaps and windows with low mappability are excluded)                                                               |
| length.ratio  | The ratio between the length of the used windows to the genomic length                                                                                       |
| seg.mean      | The estimated GC corrected difference signal (2 copy gain will have a seg.mean of 1)                                                                         |
| GMean         | The mean coverage in the germline sample (a value of 1 represents diploid)                                                                                   |
| DMean         | The mean coverage in the tumor sample                                                                                                                        |
| LogRatio      | Log2 ratio between tumor and normal coverage                                                                                                                 |
| Quality score | A empirical score used in merging                                                                                                                            |
| SV_Matching   | Whether the boundary of the segments were supported by SVs (3: both ends supported, 2: right end supported, 1: left end supported, 0: neither end supported) |


[crest]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3527068/
[conserting]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4591043/
[bwa]: http://bio-bwa.sourceforge.net/
[picard]: https://broadinstitute.github.io/picard/
[bambino-paper]: https://academic.oup.com/bioinformatics/article/27/6/865/236751
[bambino-program]: https://www.stjuderesearch.org/site/lab/zhang
[bambino-download]: http://ftp.stjude.org/pub/software/conserting/bambino-1.0.jar
[pcgp-landing-page]: https://www.stjude.org/research/pediatric-cancer-genome-project.html
[hts-specs]: https://samtools.github.io/hts-specs/
[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[msgen-whitepaper]: https://azure.microsoft.com/en-us/resources/accelerate-precision-medicine-with-microsoft-genomics/
[gatk-haplotype-caller]: https://software.broadinstitute.org/gatk/documentation/tooldocs/3.8-0/org_broadinstitute_gatk_tools_walkers_haplotypecaller_HaplotypeCaller.php
[gvcf-spec]:https://software.broadinstitute.org/gatk/documentation/article?id=11004
[gvcf-diff-from-vcf]: https://software.broadinstitute.org/gatk/documentation/article?id=4017
[bam-spec]: https://samtools.github.io/hts-specs/SAMv1.pdf
[star-manual]: https://github.com/alexdobin/STAR/blob/7283af27e84839e93ecf7ed6a14c8ff675fdf79c/doc/STARmanual.pdf
[ercc]: https://www.thermofisher.com/order/catalog/product/4456740










##Sequencing Information 

### Whole Genome and Whole Exome
Whole Genome Sequence (WGS) and Whole Exome Sequence (WES) BAM files were produced by the [Microsoft Genomics Service][msgen] aligned to HG38 (GRCh38 no alt analysis set). For more information about how Microsoft Genomics produces BAM files or any other questions regarding data generation, please refer to [the official Microsoft Genomics whitepaper][msgen-whitepaper].

### RNA-Seq

RNA-Seq BAM files are mapped to HG38 + [ERCC Spike In Sequences][ercc] (commonly used for normalization of expression analyses). For alignment, `STAR` v2.5.3a 2-pass mapping followed by `Picard MarkDuplicates`. Below is the `STAR` command used during alignment. For more information about any of the parameters used, please refer to the [STAR manual][star-manual] for v2.5.3a.

```bash
    STAR \
        --runThreadN $NUM_THREADS \                           # $NUM_THREADS is the number of threads to parallelize the alignment across (generally we use 4).
        --genomeDir $GENOME_DIR \                             # $GENOME_DIR is a STAR reference directory containing HG38 and ERCC Spike In sequences.
        --readFilesIn $READ_FILES \                           # $READ_FILES are the input FastQ files to align.
        --limitBAMsortRAM $MEMORY_LIMIT \                     # $MEMORY_LIMIT is a upper limit on the amount of RAM to use in the alignment.
        --outFileNamePrefix $OUT_FILE_PREFIX \
        --outSAMtype BAM SortedByCoordinate \
        --outSAMstrandField intronMotif \
        --outSAMattributes NH   HI   AS   nM   NM   MD   XS \
        --outSAMunmapped Within \
        --outSAMattrRGline $RGs \                             # $RGs is the read group information for each FastQ passed in $READ_FILES.
        --outFilterMultimapNmax 20 \
        --outFilterMultimapScoreRange 1 \
        --outFilterScoreMinOverLread 0.66 \
        --outFilterMatchNminOverLread 0.66 \
        --outFilterMismatchNmax 10 \
        --alignIntronMax 500000 \
        --alignMatesGapMax 1000000 \
        --alignSJDBoverhangMin 1 \
        --sjdbScore 2 \
        --twopassMode Basic
```

##Data Access Units
A Data Access Unit is a grouping of data that typically corresponds to a dataset generated at the same time at the same institution, and can also correspond to a specific study. Each DAU has its own Data Access Committee, which contains the researchers who reside over the data. Each Data Access Committee has its own protocols for approving access to their DAU. Please [contact us](mailto:support@stjude.cloud) if you have questions about committee approval protocols. [Basic clinical data](#clinical-and-phenotypic-information) is available for relevant subjects in each DAU. 

### Pediatric Cancer Genome Project (PCGP)
**PCGP is a paired-tumor normal dataset focused on discovering the genetic origins of pediatric cancer.**
The Pediatric Cancer Genome Project is a collaboration between St. Jude Children's Research Hospital and the McDonnell Genome Institute at Washington University School of Medicine that sequenced the genomes of over 600 pediatric cancer patients. 

### St. Jude Lifetime (SJLIFE)
**SJLIFE is a germline-only dataset focused on studying the long-term adverse outcomes associated with cancer and cancer-related therapy.**
St. Jude Lifetime (SJLIFE) is a longevity study from St. Jude Children's Research Hospital that aims to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy. This cohort contains unpaired germline samples and does not contain tumor samples. 

### Clinical Genomics (Clinical Pilot, G4K, and RTCG)
**Clinical Genomics is a paired tumor-normal dataset focused on identifying variants that influence the development and behavior of childhood tumors.**
Clinical Genomics is a cohort from St. Jude Children's Research Hospital, comprised of three studies: Clinical Pilot, Genomes4Kids, and Real-time Clinical Genomics. Clinical Pilot is a smaller, pilot study generated to asses the validity and accuracy of moving forward with the G4K study. The RTCG study aims to release Clinical Genomics data in real time to the research community. The goal of these studies is to identify all inherited and tumor-acquired (somatic) genome sequence and structural variants influencing the development and behavior of childhood tumors. 

### Sickle Cell Genome Project (SGP)
**SGP is a germline-only dataset of Sickle Cell Disease (SCD) patients from birth to young adulthood.**
The Sickle Cell Genome Project (SGP) is a collaboration between St. Jude Children’s Research Hospital and Baylor College of Medicine focused on identifying genetic modifiers that contribute to various health complications in SCD patients. Additional objectives include, but are not limited to, developing accurate methods to characterize germline structural variants in highly homologous globin locus and blood typing.

### Childhood Cancer Survivor Study (CCSS)
**CCSS is a germline-only dataset consisting of whole genome sequencing of childhood cancer survivors.**
CCSS is a multi-institutional, multi-disciplinary, NCI-funded collaborative resource established to evaluate long-term outcomes among survivors of childhood cancer. It is a retrospective cohort consisting of >24,000 five-year survivors of childhood cancer who were diagnosed between 1970-1999 at one of 31 participating centers in the U.S. and Canada. The primary purpose of this sequencing of CCSS participants is to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy. 

!!! warning "CCSS: Potential Bacterial Contamination"

    Samples for the Childhood Cancer Survivorship Study were collected by sending out Buccal swab kits to enrolled participants and having them complete the kits at home. This mechanism of collecting saliva and buccal cells for sequencing is highly desirable because of its non-invasive nature and ease of execution. However, collection of samples in this manner also has higher probability of contamination from external sources (as compared to, say, samples collected using blood). We have observed some samples in this cohort which suffer from bacterial contamination. To address this issue, we have taken the following steps:

    1. We have estimated the bacterial contamination rate and annotated each of the samples in the CCSS cohort. For each sample, you will find the estimated contamination rate in the `Description` field of the `SAMPLE_INFO.txt` file that is vended with your data (and as a property on the DNAnexus file). For information on this field, see the [Metadata specification](#metadata).
    2. Using this estimated contamination rate, we have removed 82 samples which exhibited large rates of bacterial contamination.
    3. For the remaining samples, we have provided the `BAM` file as aligned with `bwa mem` with default parameters. We have observed that there are instances of reads originating from bacterial contamination that are erroneously mapped to the human genome and display a *very* low mapping quality. Please be advised that we have kept these reads as they were aligned and have not yet made any attempt to unmap these reads. Any analysis you perform on these samples will need to take this into account!
    4. Last, we will be working over the coming months to unmap the reads originating from bacterial contamination and release updated `BAM` files along with the associated `gVCF` files from Microsoft Genomics Service.

    With any questions on the nature or implications of this warning, please contact us at [support@stjude.cloud](mailto:support@stjude.cloud).












## Metadata 

Each data request includes a text file called `SAMPLE_INFO.txt` that provides a number of file level properties (sample identifiers, clinical attributes, etc).

### Standard Metadata

 Below are the set of tags which *may* exist for any given file in St. Jude Cloud. All optional metadata will have `sj_` prepended to their tag name.

| Property        | Description                                                                            |
| --------------- | -------------------------------------------------------------------------------------- |
| file_path       | The path to the file in your St. Jude Cloud project.                                   |
| subject_name    | A unique subject identifier assigned internally at St. Jude.                           |
| sample_name     | A unique sample identifier assigned internally at St. Jude.                            |
| sample_type     | One of Autopsy, Cell line, Diagnosis, Germline, Metastasis, Relapse, or Xenograft      |
| sequencing_type | Whether the file was generated from Whole Genome (WGS), Whole Exome (WES), or RNA-Seq. |
| file_type       | One of the [file types](../../guides/data/types-of-data) available in St. Jude Cloud   |
| description     | Optional field that may contain additional file information.                           |
| sj_diseases          | Short disease identifier assigned at the time of genomic sequencing. Note that this diagnosis may be refined after undergoing genomic testing. When including diagnosis in your analysis, we recommend you use `attr_diagnosis`, which is the most up to date value for diagnosis. |
| sj_datasets          | If present, the datasets in the data browser which this file is associated with.                                                                                                                                                                                                   |
| sj_pmid_accessions   | If the file was associated with a paper, the related [Pubmed][pubmed] accession number.                                                                                                                                                                                            |
| sj_ega_accessions    | If the file was associated with a paper, the related [EGA][ega] accession number.                                                                                                                                                                                                  |
| sj_dataset_accession | If present, the permanent accession number assigned in St. Jude Cloud.                                                                                                                                                                                                             |
| sj_embargo_date      | The [embargo date](../../glossary.md#embargo-date), which specifies the first date which the files can be used in a publication.                                                                                                                                               |

### Clinical and Phenotypic Information

Also included is a set of phenotypic information queried from the physician or research team's records at the time of sample submission to St. Jude Cloud. These are all considered to be *optional*, as the level of information gathered for each sample varies. If empty, the physician or research team did not indicate a value for the field. All basic clinical or phenotypic information will have `attr_` prepended to their tag name.

| Property                   | Description                                                                                                                                                                                                                                                                |
| ---------------------      | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| attr_age_at_diagnosis      | Age at first diagnosis. This field is normalized as a decimal value. If empty, the physician or research team did not indicate a value for this field.                                             |
| attr_diagnosis             | Primary diagnosis reported by the clinic.                                                                                               |
| attr_ethnicity             | Self-reported ethnicity. Values are normalized according to the [US Census Bureau classifications][censusburea]. |
| attr_race                  | Self-reported race. Values are normalized according to the [US Census Bureau classifications][censusburea].      |
| attr_sex                   | Self-reported sex.                                                                                               |
| attr_oncotree_disease_code | The disease code (assigned at the time of genomic sequencing) as specified by [Oncotree Version 2019-03-01][oncotree_2019_03_01]

### Short Disease Code Mapping

Embedded in both the filename and the `SAMPLE_INFO.txt` file that comes with your data request will be a list of short diagnosis codes (`sj_diseases`). These short codes were assigned at the time that the sample was sent for sequencing, and they are not necessarily the final diagnosis (`attr_diagnosis`). For instance, the diagnosis is often refined as the sample undergoes genomic testing. Below, we include a table of short disease code to long disease name mappings so you can interpret what these abbreviations mean.

| Short Disease Code | Long Diagnosis Description                                |
| ------------------ | --------------------------------------------------------- |
| ACT                | Adrenocortical Carcinoma                                  |
| AEL                | Acute erythroid leukemia (AML M6)                         |
| ALCL               | Anaplastic Large Cell Lymphoma                            |
| ALL                | Acute Lymphoblastic Leukemia                              |
| ALS                | Amyotrophic Lateral Sclerosis ("Lou Gehrig\'s Disease"")" |
| ALZ                | Alzheimer's Disease                                       |
| AML                | Acute Myeloid Leukemia                                    |
| AMLM               | Acute Megakaryoblastic Leukemia                           |
| ANEM               | Anemia                                                    |
| ASPS               | Alveolar Soft Part Sarcoma                                |
| AUL                | Acute Undifferentiated Leukemia                           |
| BALL               | B-cell Acute Lymphoblastic Leukemia                       |
| BCC                | Basal Cell Carcinoma                                      |
| BLACA              | Bladder Cancer                                            |
| BT                 | Brain Tumor                                               |
| CA                 | Carcinoma                                                 |
| CBF                | Acute Myeloid Leukemia - Core Binding Factor subtype      |
| CLL                | Chronic Lymphocytic Leukemia                              |
| CML                | Chronic Myelogenous Leukemia                              |
| CMML               | Chronic Myelomonocytic Leukemia                           |
| CMV                | Cytomegalovirus                                           |
| CNS                | Central Nervous System                                    |
| CPC                | Choroid Plexus Carcinoma                                  |
| CRC                | Colorectal Cancer                                         |
| CS                 | Chondrosarcoma                                            |
| CTP                | Congenital Thrombocytopenia                               |
| DIPG               | Diffuse Intrinsic Pontine Glioma                          |
| DLBCL              | Diffuse Large B-cell Lymphoma                             |
| DOWN               | Down Syndrome                                             |
| DSRCT              | Desmoplastic Small Round Cell Tumor                       |
| E2A                | B-Lineage Acute Lymphoblastic Leukemia - E2A-PBX1 subtype |
| ECD                | Erdheim-Chester Disease                                   |
| EPD                | Ependymoma                                                |
| ERG                | Acute Lymphoblastic Leukemia - ERG alteration subtype     |
| ETV                | Acute Lymphoblastic Leukemia - ETV6-RUNX1 fusion subtype  |
| EWS                | Ewing's Sarcoma                                           |
| GCT                | Germ Cell Tumor                                           |
| GENBN              | General Bone                                              |
| GENKY              | General Kidney                                            |
| GENLK              | General Leukemia                                          |
| GICT               | Giant Cell Tumor                                          |
| GIST               | Gastrointestinal Stromal Tumor                            |
| HB                 | Hepatoblastoma                                            |
| HGG                | High Grade Glioma                                         |
| HGS                | High Grade Sarcoma                                        |
| HIST               | Histiocytosis                                             |
| HL                 | Hodgkin's Lymphoma                                        |
| HM                 | Hematopoietic Malignancies                                |
| HS                 | Hidradenitis Suppurativa                                  |
| HYPER              | Acute Lymphoblastic Leukemia - Hyperdiploid subtype       |
| HYPO               | Acute Lymphoblastic Leukemia - Hypodiploid subtype        |
| IFS                | Infantile Fibromyosarcoma                                 |
| INF                | Acute Lymphoblastic Leukemia (Infant)                     |
| ITP                | Idiopathic Thrombocytopenia                               |
| JMML               | Juvenile Myelomonocytic Leukemia                          |
| LCH                | Langerhans Cell Histiocytocis                             |
| LGG                | Low Grade Glioma                                          |
| LM                 | Liver Malignancies                                        |
| MB                 | Medulloblastoma                                           |
| MDS                | Myelodysplastic Syndrome                                  |
| MEL                | Melanoma                                                  |
| MLL                | Mixed Lineage Leukemia                                    |
| MM                 | Multiple Myeloma                                          |
| MPAL               | Acute Lymphoblastic Leukemia - Multi-phenotypic           |
| MPNST              | Malignant Peripheral Nerve Sheath Tumor                   |
| MRT                | Malignant Rhabdoid Tumour                                 |
| MYF                | Myelofibrosis                                             |
| NBL                | Neuroblastoma                                             |
| NEUTP              | Neutropenia                                               |
| NHL                | Non-Hodgkin's Lymphoma                                    |
| NM                 | Non-malignancy                                            |
| NORM               | Control Sample                                            |
| NPC                | Nasopharyngeal Carcinoma                                  |
| NPCA               | Nasopharyngeal Carcinoma                                  |
| OS                 | Osteosarcoma                                              |
| PF                 | Posterior Fossa                                           |
| PGL                | Paraganglioma                                             |
| PHALL              | Acute Lymphoblastic Leukemia - BCR-ABL1 fusion subtype    |
| PHCML              | Ph+ Chronic Myeloid Leukemia                              |
| PML                | Promyelocitic Leukemia                                    |
| PRAD               | Prostate Adenocarcoma                                     |
| PSO                | Psoriasis                                                 |
| RB                 | Retinoblastoma                                            |
| RCC                | Renal cell carcinoma                                      |
| RECA               | Renal Cancer                                              |
| RHB                | Rhabdomyosarcoma                                          |
| SBO                | Spina Bifida Occulta                                      |
| SCD                | Sickle Cell Disease                                       |
| SCZ                | Schizophrenia                                             |
| SS                 | Synovial Sarcoma                                          |
| ST                 | Solid Tumor                                               |
| STS                | Soft Tissue Sarcoma                                       |
| TALL               | T-cell Acute Lymphoblastic Leukemia                       |
| TCP                | Thrombocytopenia                                          |
| TESCA              | Testicular Cancer                                         |
| THCA               | Thyroid Carcinoma                                         |
| WLM                | Wilms' tumor                                              |


[pubmed]: https://www.ncbi.nlm.nih.gov/pubmed/
[ega]: https://www.ebi.ac.uk/ega/home
[censusburea]: https://www.census.gov/mso/www/training/pdf/race-ethnicity-onepager.pdf
[oncotree_2019_03_01]: http://oncotree.mskcc.org/#/home?version=oncotree_2019_03_01
