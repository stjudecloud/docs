#### What is a Data Access Agreement?

A St. Jude Cloud **Data Access Agreement (DAA)** is a legally binding document outlining a number of terms and conditions to which anyone working with St. Jude Cloud data must agree.
We do not negotiate the terms of this document unless terms are found to be in conflict with the institution's state law. Filling out the Data Access Agreement carefully and completely is crucial to having your request approved promptly.
[Click Here](../../guides/forms/how-to-fill-out-DAA) for a step by step guide on how to fill out the DAA.

If you have incompletely or incorrectly filled out your DAA and would like to upload a revised form, [Click Here](../../guides/forms/how-to-fill-out-DAA#uploading-a-revised-daa) for instructions.

Once you have submitted a correctly filled out DAA and have been granted access to one or more [Data Access Units (DAUs)](#what-is-a-data-access-unit), you can continue checking out files from those DAUs until your access expires. Access is generally granted for 1 year, at which point you must submit an Extension Addendum to continue using the data. [Click Here](../../guides/forms/how-to-fill-out-Extension) for a step-by-step guide on how to fill out the Extension Addendum.

#### What is a Data Access Committee?

A St. Jude Cloud **Data Access Committee (DAC)** is group of St. Jude researchers who oversee access to a particular [Data Access Unit (DAU)](#what-is-a-data-access-unit) and evaluate incoming data requests.

The first time you request access to files in 
a DAU, it is required that you fill out a [Data Access Agreement (DAA)](#what-is-a-data-access-agreement). Access is granted at the DAU level based on the decision of each DAC upon reviewing the DAA.

!!! example
    For example, if you make a request asking for all of St. Jude's Acute 
    Lymphoblastic Leukemia sequencing data, you might be asking for data from 
    multiple different projects (DAUs) here at St. Jude. For the sake of the example,
    let's say the data you want is spread across three different DAUs. Once
    you place a request, your application will be routed to the corresponding
    three data access committees for approval. Since each DAC is made up of
    different individuals using different criteria for evaluation, you may or
    may not be approved for access to all of the files. 

#### What is a Data Access Unit?

A St. Jude Cloud **Data Access Unit (DAU)** is a grouping of data that typically corresponds to a project, study, or dataset generated at the same time at the same institution. Each DAU has its own governing body of researchers, the [Data Access Committee](#what-is-a-data-access-committee), who preside over the data and who may grant or deny access. We currently have the 5 DAUs detailed below.

##### Pediatric Cancer Genome Project (PCGP)
PCGP is a paired-tumor normal dataset focused on discovering the genetic origins of pediatric cancer.
The Pediatric Cancer Genome Project is a collaboration between St. Jude Children's Research Hospital and the McDonnell Genome Institute at Washington University School of Medicine that sequenced the genomes of over 600 pediatric cancer patients. 

##### St. Jude Lifetime (SJLIFE)
SJLIFE is a germline-only dataset focused on studying the long-term adverse outcomes associated with cancer and cancer-related therapy.
St. Jude Lifetime (SJLIFE) is a longevity study from St. Jude Children's Research Hospital that aims to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy. This cohort contains unpaired germline samples and does not contain tumor samples. 

##### Clinical Genomics (Clinical Pilot and G4K)
Clinical Genomics is a paired tumor-normal dataset focused on identifying variants that influence the development and behavior of childhood tumors.
Clinical Genomics is a cohort from St. Jude Children's Research Hospital, comprised of two studies: Clinical Pilot and Genomes4Kids. Clinical Pilot is a smaller, pilot study generated to asses the validity and accuracy of moving forward with the G4K study. These studies aim to identify all inherited and tumor-acquired (somatic) genome sequence and structural variants influencing the development and behavior of childhood tumors. 

##### Sickle Cell Genome Project (SGP)
SGP is a germline-only dataset of Sickle Cell Disease (SCD) patients from birth to young adulthood.
The Sickle Cell Genome Project (SGP) is a collaboration between St. Jude Children’s Research Hospital and Baylor College of Medicine focused on identifying genetic modifiers that contribute to various health complications in SCD patients. Additional objectives include, but are not limited to, developing accurate methods to characterize germline structural variants in highly homologous globin locus and blood typing.

##### Childhood Cancer Survivor Study (CCSS)
CCSS is a germline-only dataset consisting of whole genome sequencing of childhood cancer survivors.
CCSS is a multi-institutional, multi-disciplinary, NCI-funded collaborative resource established to evaluate long-term outcomes among survivors of childhood cancer. It is a retrospective cohort consisting of >24,000 five-year survivors of childhood cancer who were diagnosed between 1970-1999 at one of 31 participating centers in the U.S. and Canada. The primary purpose of this sequencing of CCSS participants is to identify all inherited genome sequence and structural variants influencing the development of childhood cancer and occurrence of long-term adverse outcomes associated with cancer and cancer-related therapy.

!!! warning "Potential Bacterial Contamination"

    Samples for the Childhood Cancer Survivorship Study were collected by sending out Buccal swab kits to enrolled participants and having them complete the kits at home. This mechanism of collecting saliva and buccal cells for sequencing is highly desirable because of its uninvasive nature and ease of execution. However, collection of samples in this manner also has higher probability of contamination from external sources (as compared to, say, samples collected using blood). We have observed some samples in this cohort which suffer from bacterial contamination. To address this issue, we have taken the following steps:

    1. We have estimated the bacterial contamination rate and annotated each of the samples in the CCSS cohort. For each sample, you will find the estimated contamination rate in the `Description` field of the `SAMPLE_INFO.txt` file that is vended with your data (and as a property on the DNAnexus file). For information on this field, see the [Metadata specification](./guides/data/metadata.md).
    2. Using this estimated contamination rate, we have removed 82 samples which exhibited large rates of bacterial contamination.
    3. For the remaining samples, we have provided the `BAM` file as aligned with `bwa mem` with default parameters. We have observed that there are instances of reads originating from bacterial contamination that are erroneously mapped to the human genome and display a *very* low mapping quality. Please be advised that we have kept these reads as they were aligned and have not yet made any attempt to unmap these reads. Any analysis you perform on these samples will need to take this into account!
    4. Last, we will be working over the coming months to unmap the reads originating from bacterial contamination and release updated `BAM` files along with the associated `gVCF` files from Microsoft Genomics Service.

    With any questions on the nature or implications of this warning, please contact us at [support@stjude.cloud](mailto:support@stjude.cloud).

#### What is an Embargo Date?

The **Embargo Date** specifies the date that a publishing embargo on the file in question has been lifted. Publishing using any of the files _before_ the embargo date has passed is strictly prohibited as outlined in the [Data Access Agreement (DAA)](#what-is-a-data-access-agreement). Typically, samples from the same [Data Access Unit (DAU)](#what-is-a-data-access-unit) all have the same embargo date, as they would have been released on St. Jude Cloud at the same time.

**Current Embargo Dates**

| Data Access Unit                 | Embargo Date      |
| -------------------------------- | ----------------- |
| Pediatric Cancer Genome Project  | July 23, 2018     |
| St. Jude LIFE                    | January 15, 2019  |
| Clinical Genomics                | January 15, 2019  |
| Sickle Cell Genome Project       | September 1, 2019 |
| Childhood Cancer Survivor Study | November 1, 2019 |

#### Where can I find the Embargo Date?

All of our samples are marked with an embargo date.
You can find this by looking at the tags for each file or in the
`SAMPLE_INFO.txt` file that is included with each data request.
Select a sample and click info to see more.

![](../images/guides/data/embargo-date-1.png)
![](../images/guides/data/embargo-date-2.png)

#### Will I be charged for using St. Jude Cloud?

Any copy of the St. Jude data you receive is considered "sponsored",
  so you do not have to pay a fee to store this data in St. Jude
  Cloud. Although you may be prompted to enter billing information, you will not
be charged for anything with the exception of the following actions:

*  You will be charged for any *derivative* files stored on the St. Jude Cloud, such as results files obtained through running analyses workflows.
* There is a small monthly storage fee associated for any of your own data you upload to the cloud.
* If you elect to *download* any data from SJCloud, you will be
  charged an egress fee by DNAnexus. This fee is usually negligible
  unless you are downloading entire cohorts. We are actively
  investigating ways to minimize or eliminate these costs.
* If you run any of our analysis workflows (such as Rapid RNA-Seq, WARDEN, etc) or your own workflows that you have uploaded and packaged into the cloud, you will be charged for the
  compute resources used in producing the results as well as storage
  fees associated with storing the results files.


#### How can I delete my account?

If you'd like to delete your account, please email DNAnexus support at
<support@dnanexus.com> with the following email.

    Hi DNAnexus,

      Would you please assist me in deleting my St. Jude Cloud account? My username is _____.

    Thank you!

#### Where can I find the Terms of Service or the Privacy Policy?

You can find the Terms of Service
[here](https://stjude.cloud/terms-of-use.html) and the Privacy Policy
[here](https://platform.stjude.cloud/privacy).


[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]: https://gatkforums.broadinstitute.org/gatk/discussion/11004/gvcf-genomic-variant-call-format
[gvcf-diff-from-vcf]: https://gatkforums.broadinstitute.org/gatk/discussion/4017/what-is-a-gvcf-and-how-is-it-different-from-a-regular-vcf
