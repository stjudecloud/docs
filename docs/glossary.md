### Data Access Agreement

A St. Jude Cloud **Data Access Agreement (DAA)** is a legally binding document outlining a number of terms and conditions to which anyone working with St. Jude Cloud data must agree.
We do not negotiate the terms of this document unless terms are found to be in conflict with the institution's state law. Filling out the Data Access Agreement carefully and completely is crucial to having your request approved promptly.
[Click Here](./guides/forms/how-to-fill-out-DAA) for a step by step guide on how to fill out the DAA.

If you have incompletely or incorrectly filled out your DAA and would like to upload a revised form, [Click Here](./guides/forms/how-to-fill-out-DAA#uploading-a-revised-daa) for instructions.

Once you have submitted a correctly filled out DAA and have been granted access to one or more [Data Access Units (DAUs)](#data-access-unit), you can continue checking out files from those DAUs until your access expires. Access is generally granted for 1 year, at which point you must submit an Extension Addendum to continue using the data. [Click Here](./guides/forms/how-to-fill-out-Extension) for a step-by-step guide on how to fill out the Extension Addendum.

### Data Access Committee

A St. Jude Cloud **Data Access Committee (DAC)** is group of St. Jude researchers who oversee access to a particular [Data Access Unit (DAU)](#data-access-unit) and evaluate incoming data requests.

The first time you request access to files in 
a DAU, it is required that you fill out a [Data Access Agreement (DAA)](#data-access-agreement). Access is granted at the DAU level based on the decision of each DAC upon reviewing the DAA.

!!! example
    For example, if you make a request asking for all of St. Jude's Acute 
    Lymphoblastic Leukemia sequencing data, you might be asking for data from 
    multiple different projects (DAUs) here at St. Jude. For the sake of the example,
    let's say the data you want is spread across three different DAUs. Once
    you place a request, your application will be routed to the corresponding
    three data access committees for approval. Since each DAC is made up of
    different individuals using different criteria for evaluation, you may or
    may not be approved for access to all of the files. 

### Data Access Unit

A St. Jude Cloud **Data Access Unit (DAU)** is a grouping of data that typically corresponds to a project, study, or dataset generated at the same time at the same institution. Each DAU has its own governing body of researchers, the [Data Access Committee](#data-access-committee), who preside over the data and who may grant or deny access. We currently have 5 DAUs: Pediatric Cancer Genome Project (PCGP), St. Jude Lifetime Cohort Study (SJLIFE), Genomes for Kids (G4K) and Clinical Genomics, Sickle Cell Genome Project (SGP), and Childhood Cancer Survivor Study (CCSS).

!!! warning "Potential Bacterial Contamination"

    Samples for the Childhood Cancer Survivorship Study were collected by sending out Buccal swab kits to enrolled participants and having them complete the kits at home. This mechanism of collecting saliva and buccal cells for sequencing is highly desirable because of its non-invasive nature and ease of execution. However, collection of samples in this manner also has higher probability of contamination from external sources (as compared to, say, samples collected using blood). We have observed some samples in this cohort which suffer from bacterial contamination. To address this issue, we have taken the following steps:

    1. We have estimated the bacterial contamination rate and annotated each of the samples in the CCSS cohort. For each sample, you will find the estimated contamination rate in the `Description` field of the `SAMPLE_INFO.txt` file that is vended with your data (and as a property on the DNAnexus file). For information on this field, see the [Metadata specification](./guides/data/metadata.md).
    2. Using this estimated contamination rate, we have removed 82 samples which exhibited large rates of bacterial contamination.
    3. For the remaining samples, we have provided the `BAM` file as aligned with `bwa mem` with default parameters. We have observed that there are instances of reads originating from bacterial contamination that are erroneously mapped to the human genome and display a *very* low mapping quality. Please be advised that we have kept these reads as they were aligned and have not yet made any attempt to unmap these reads. Any analysis you perform on these samples will need to take this into account!
    4. Last, we will be working over the coming months to unmap the reads originating from bacterial contamination and release updated `BAM` files along with the associated `gVCF` files from Microsoft Genomics Service.

    With any questions on the nature or implications of this warning, please contact us at [support@stjude.cloud](mailto:support@stjude.cloud).

### Embargo Date

The **Embargo Date** specifies the date that a publishing embargo on the file in question has been lifted. Publishing using any of the files _before_ the embargo date has passed is strictly prohibited as outlined in the [Data Access Agreement (DAA)](#data-access-agreement). Typically, samples from the same [Data Access Unit (DAU)](#data-access-unit) all have the same embargo date, as they would have been released on St. Jude Cloud at the same time.

**Current Embargo Dates**

| Data Access Unit                 | Embargo Date      |
| -------------------------------- | ----------------- |
| Pediatric Cancer Genome Project  | July 23, 2018     |
| St. Jude LIFE                    | January 15, 2019  |
| Clinical Genomics                | January 15, 2019  |
| Sickle Cell Genome Project       | September 1, 2019 |
| Childhood Cancer Survivor Study | November 1, 2019 |
