# Studies

St. Jude Cloud currently hosts data from 5 studies or [Data Access Units (DAU)](../../glossary.md#data-access-unit). See below for a brief description of each study. For a more detailed description please see the respective [Schedule 1(s)](../../citing-stjude-cloud.md#dataset-reference-table).

## Pediatric Cancer Genome Project (PCGP)
The Pediatric Cancer Genome Project is a collaboration between St. Jude Children's Research Hospital and the McDonnell Genome Institute at Washington University School of Medicine focused on discovering the genetic origins of pediatric cancer. This is a paired-tumor normal dataset of over 600 pediatric cancer patients. 

## St. Jude Lifetime (SJLIFE)
St. Jude Lifetime (SJLIFE) is a longevity study from St. Jude Children's Research Hospital that aims to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy. This dataset contains unpaired germline samples and does not contain tumor samples. 

## Clinical Genomics (Clinical Pilot and G4K)
Clinical Genomics is a cohort from St. Jude Children's Research Hospital, comprised of two studies: Clinical Pilot and Genomes4Kids. Clinical Pilot is a smaller, pilot study generated to asses the validity and accuracy of moving forward with the G4K study. These studies aim to identify all inherited and tumor-acquired (somatic) genome sequence and structural variants influencing the development and behavior of childhood tumors. These are both paired tumor-normal datasets.

## Sickle Cell Genome Project (SGP)
The Sickle Cell Genome Project (SGP) is a collaboration between St. Jude Children’s Research Hospital and Baylor College of Medicine focused on identifying genetic modifiers that contribute to various health complications in SCD patients. Additional objectives include, but are not limited to, developing accurate methods to characterize germline structural variants in highly homologous globin locus and blood typing. SGP is a germline-only dataset of SCD patients from birth to young adulthood.

## Childhood Cancer Survivor Study (CCSS)
CCSS is a multi-institutional, multi-disciplinary, NCI-funded collaborative resource established to evaluate long-term outcomes among survivors of childhood cancer. It is a retrospective cohort consisting of >24,000 five-year survivors of childhood cancer who were diagnosed between 1970-1999 at one of 31 participating centers in the U.S. and Canada. The primary purpose of this sequencing of CCSS participants is to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy. This dataset contains unpaired germline samples and does not contain tumor samples. 

!!! warning "Potential Bacterial Contamination"

    Samples for the Childhood Cancer Survivorship Study were collected by sending out Buccal swab kits to enrolled participants and having them complete the kits at home. This mechanism of collecting saliva and buccal cells for sequencing is highly desirable because of its non-invasive nature and ease of execution. However, collection of samples in this manner also has higher probability of contamination from external sources (as compared to, say, samples collected using blood). We have observed some samples in this cohort which suffer from bacterial contamination. To address this issue, we have taken the following steps:

    1. We have estimated the bacterial contamination rate and annotated each of the samples in the CCSS cohort. For each sample, you will find the estimated contamination rate in the `Description` field of the `SAMPLE_INFO.txt` file that is vended with your data (and as a property on the DNAnexus file). For information on this field, see the [Metadata specification](../../guides/data/metadata.md).
    2. Using this estimated contamination rate, we have removed 82 samples which exhibited large rates of bacterial contamination.
    3. For the remaining samples, we have provided the `BAM` file as aligned with `bwa mem` with default parameters. We have observed that there are instances of reads originating from bacterial contamination that are erroneously mapped to the human genome and display a *very* low mapping quality. Please be advised that we have kept these reads as they were aligned and have not yet made any attempt to unmap these reads. Any analysis you perform on these samples will need to take this into account!
    4. Last, we will be working over the coming months to unmap the reads originating from bacterial contamination and release updated `BAM` files along with the associated `gVCF` files from Microsoft Genomics Service.

    With any questions on the nature or implications of this warning, please contact us at [support@stjude.cloud](mailto:support@stjude.cloud).