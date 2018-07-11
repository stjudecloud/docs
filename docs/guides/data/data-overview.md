### Data access

!!! note "Summary"

    1. Data in St. Jude Cloud is grouped into different data access units (DAUs) which roughly correspond to projects. 
    2. Users are given to DAUs on a case-by-case basis for limited amount of time.
    3. Access to data in a given DAU is assessed by the corresponding data access committee (DAC) on a case-by-case basis.
    4. There are a number of terms of use and restrictions outlined in the [data access agreement](https://platform.stjude.cloud/access_form). We ask that everyone
        who will be analyzing the data has read and understands these terms.

Data in St. Jude Cloud is grouped into multiple **data access units** (DAUs),
which are independent projects/data sources with different governance structures. 
Each DAU has a separate **data access committee** (DAC) that evaluates incoming 
data requests based on a variety of factors. Access is granted at the DAU level
based on the decision of each DAC. The first time you request access to files in 
a DAU, it is required that you fill out a DAA (which handles contemplated use and
other legally binding terms). After you've been approved once, you can continue
checking out files from that DAU until your access expires (generally after 
1 year) and you need to renew.

!!! example
    For instance, if you make a request asking for all our St. Jude's Acute 
    Lymphoblastic Leukemia sequencing data, you might be asking for data from 
    multiple different projects here at St. Jude. For the sake of the example,
    let's say the data you want is spread across three different DAUs. Once
    you place a request, your application will be routed to the corresponding
    three data access committees for approval. Since each DAC is made up of
    different individuals using different criteria for evaluation, you may or
    may not be approved for access to all of the files. 

#### Embargo dates

An embargo date is the time at which access to data is allowed to users
for publishing purposes. Typically, samples from the same Data Access
Unit all have the same embargo date, as they are usually released on St.
Jude Cloud at the same time. Publishing any results derived from this data 
before this embargo date is not permitted as outlined in the data access agreement.

**Current Embargo Dates**

| Data Access Unit                 | Embargo Date     |
| -------------------------------- | ---------------- |
| Pediatric Cancer Genome Project  | July 23, 2018    |
| St. Jude LIFE                    | January 15, 2019 |
| Clinical Genomics                | January 15, 2019 |

### Data types

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

!!! todo
    Information about BAM files.

#### gVCF files

Today, we defer to the [official specification document][gvcf-spec] from the Broad Institute, as well as [this discussion][gvcf-diff-from-vcf] on the difference between VCF and gVCF files.

### Frequently asked questions

**Q. Where can I find the embargo dates?**

A. All of our samples are marked with an embargo date. 
You can find this by looking at the tags for each file or in the
`SAMPLE_INFO.txt` file that is included with each data request. 
Select a sample and click info to see more.

!!! todo
    This needs to be an image of a data access request, not the DAU.


![](../../images/guides/data/embargo-date-1.png)
![](../../images/guides/data/embargo-date-2.png)

[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]: https://gatkforums.broadinstitute.org/gatk/discussion/11004/gvcf-genomic-variant-call-format
[gvcf-diff-from-vcf]: https://gatkforums.broadinstitute.org/gatk/discussion/4017/what-is-a-gvcf-and-how-is-it-different-from-a-regular-vcf
