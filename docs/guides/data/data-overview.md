!!! note "Summary"

    1. Data in St. Jude Cloud is grouped into different data access units (DAUs) which usually correspond to large-scale sequencing initiatives at St. Jude. 
    2. Individuals can apply for access to DAUs on a case-by-case basis for a specific amount of time (usually 1 year).
    3. Access to data in a given DAU is assessed by the corresponding data access committee (DAC) who assess a variety of factors to grant access.
    4. There are a number of terms of use and restrictions outlined in the [data access agreement](https://platform.stjude.cloud/access_form). Everyone who will be working with the data must read and understand these terms.

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
    For example, if you make a request asking for all of St. Jude's Acute 
    Lymphoblastic Leukemia sequencing data, you might be asking for data from 
    multiple different projects here at St. Jude. For the sake of the example,
    let's say the data you want is spread across three different DAUs. Once
    you place a request, your application will be routed to the corresponding
    three data access committees for approval. Since each DAC is made up of
    different individuals using different criteria for evaluation, you may or
    may not be approved for access to all of the files. 

#### Embargo dates

The embargo date specifies the date that a publishing embargo on the file in question has been lifted. Publishing using any of the files _before_ the embargo date has passed is strictly prohibited as outlined in the data access agreement. Typically, samples from the same Data Access
Unit all have the same embargo date, as they would have been released on St.
Jude Cloud at the same time.

**Current Embargo Dates**

| Data Access Unit                 | Embargo Date      |
| -------------------------------- | ----------------- |
| Pediatric Cancer Genome Project  | July 23, 2018     |
| St. Jude LIFE                    | January 15, 2019  |
| Clinical Genomics                | January 15, 2019  |
| Sickle Cell Genome Project       | September 1, 2019 |

### Frequently asked questions

**Q. Where can I find the embargo dates?**

**A.** All of our samples are marked with an embargo date. 
You can find this by looking at the tags for each file or in the
`SAMPLE_INFO.txt` file that is included with each data request. 
Select a sample and click info to see more.

![](../../images/guides/data/embargo-date-1.png)
![](../../images/guides/data/embargo-date-2.png)

[msgen]: https://azure.microsoft.com/en-us/services/genomics/
[gvcf-spec]: https://gatkforums.broadinstitute.org/gatk/discussion/11004/gvcf-genomic-variant-call-format
[gvcf-diff-from-vcf]: https://gatkforums.broadinstitute.org/gatk/discussion/4017/what-is-a-gvcf-and-how-is-it-different-from-a-regular-vcf
