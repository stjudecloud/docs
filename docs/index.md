# Getting Started

## Introduction

Welcome to the St. Jude Cloud documentation! Here, you'll find the
authoritative guides for accessing SJ Cloud data, running analysis workflows (ours or your own) on the cloud,
and exploring curated data from numerous published studies by St. Jude and our collaborating institutions. For a brief overview of
everything St. Jude Cloud provides, we recommend that you watch the video
on [our home page](https://stjude.cloud).

Sign up [here](https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-subscribe/) to receive email notifications when we add new datasets, analysis pipelines, or other exciting features.

## Features

You can leverage many different capabilities of St. Jude Cloud in your research, such as:

* See what [raw genomics data](https://platform.stjude.cloud/requests/diseases) we have to share. You can browse by diagnosis, publication, or curated dataset while applying a number of different filters.
* Run your tools on *our* data by [requesting data](./guides/data/data-request.md) and packaging your tools in a secure cloud environment. See this [guide](./guides/data/creating-a-cloud-app.md) for an example.
* Run our in house analysis workflows on *your* data by [moving your data](./guides/data/data-transfer-app.md) to the cloud and selecting a [workflow](#analysis-workflows) to run. See this [guide](./guides/tools/rapid-rnaseq.md) for an example. 
* Explore St. Jude datasets through interactive visualizations that we have packaged for the community. For example, visit [PeCan](https://pecan.stjude.cloud) to visually investigate pediatric cancer mutation data.
* Create manuscript quaility figures with *your* data for use in publications or to host on your website with [ProteinPaint](https://pecan.stjude.cloud/proteinpaint/TP53) or [GenomePaint](https://genomepaint.stjude.cloud/). See the [ProteinPaint](./guides/portals/pecan.md#proteinpaint) and [GenomePaint](./guides/portals/genome-paint.md) doc pages for help.

## Datasets
* [Pediatric Cancer Genome Project (PCGP)](./guides/glossary/data-access-unit.md#pediatric-cancer-genome-project-(pcgp))
* [St. Jude Lifetime (SJLIFE)](./guides/glossary/data-access-unit.md#st.-jude-lifetime-(sjlife))
* [Clinical Genomics (Clinical Pilot and G4K)](./guides/glossary/data-access-unit.md#clinical-genomics(clinical-pilot-and-g4k))
* [Sickle Cell Genome Project (SGP)](https://sickle-cell.stjude.cloud/)
* [Childhood Cancer Survivor Study (CCSS)](./guides/glossary/data-access-unit.md#childhood-cancer-survivor-study(ccss))

## Analysis Workflows
St. Jude shares a number of validated end-to-end analysis workflows on the cloud.

* [PeCan Pie](https://platform.stjude.cloud/tools/pecan_pie)
* [NeoepitopePred](https://platform.stjude.cloud/tools/neoepitopepred)
* [ChIP-Seq Peak Calling](https://platform.stjude.cloud/tools/chip-seq)
* [Rapid RNA-Seq Fusion Detection](https://platform.stjude.cloud/tools/rapid_rna-seq)
* [WARDEN Differential Expression Analysis](https://platform.stjude.cloud/tools/warden)
* [Mutational Signatures](https://platform.stjude.cloud/tools/mutational_spectrum)
* cis-x (coming soon)
* XenoCP (coming soon)

## Creating a DNAnexus Account
The St. Jude Cloud Platform is built on top of a genomics cloud ecosystem provided by [DNAnexus](https://www.dnanexus.com/). For a comprehensive overview of how DNAnexus works, see 
[this page](https://www.dnanexus.com/product-overview). In order to request St. Jude data and work with that data in the cloud, you will need to create a DNAnexus account.

If you are a St. Jude user, log in from [here](cloud.stjude.org) to have a DNAnexus account automatically created for you using your St. Jude email address and LDAP. This [intranet page](https://home.stjude.org/computational-biology/Pages/bioinformatics-self-service-admin-guide.aspx) will guide you through the process of setting up a billing account.

 If you are an external user, create an account by going to the [DNANexus log in page](https://platform.dnanexus.com/login), clicking "Create an Account", and following the steps. On the Create New Account page, make sure to select "Microsoft Azure (westus)" as the Default Cloud Region.

## Citing St. Jude Cloud
We are currently in progress of preparing a paper for St. Jude Cloud.

Until further notice, please cite the relevant paper for each of the datasets and/or resources below that you used in your study.

| St. Jude Cloud Resource             |  Citation     |
| -------------------------------- | ----------------- |
| Pediatric Cancer Genome Project (PCGP) dataset  | [PCGP perspectives paper](https://www.ncbi.nlm.nih.gov/pubmed/22641210) and the [relevant tumor type paper(s)](https://www.stjude.org/research/pediatric-cancer-genome-project.html#62f233040719a932f3e77b398218e84a0ed50730c89dbc0890c7a753bb159201=0)    |
| St. Jude Lifetime (SJLIFE) dataset                   | [SJLIFE paper](https://www.ncbi.nlm.nih.gov/pubmed/?term=29847298)  |
| Clinical Pilot (non-G4K clinical genomics) dataset | [Clinical Pilot paper](https://www.ncbi.nlm.nih.gov/pubmed/30262806) |
| Genomes for Kids (G4K) dataset | paper in progress |
| Sickle Cell Genome Project (SGP) dataset | paper in progress |
| Childhood Cancer Survivor Study (CCSS) dataset | [CCSS study design paper](https://www.ncbi.nlm.nih.gov/pubmed/11920786) |
| ProteinPaint | [ProteinPaint paper](https://www.nature.com/articles/ng.3466) | 
| GenomePaint | paper in progress | 
| PeCan Pie | [PeCan Pie paper](https://www.biorxiv.org/content/10.1101/340901v1) | 
| NeoepitopePred | [NeoepitopePred paper](https://www.ncbi.nlm.nih.gov/pubmed/28854978) | 
| ChIP-Seq Peak Calling | unpublished | 
| Rapid RNA-Seq Fusion Detection | paper in progress | 
| WARDEN  | unpublished | 
| Mutational Signatures | [Mutational Patterns paper](https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-018-0539-0) | 
| cis-x  | paper in progress | 

!!! note
    If you are unsure what datasets the data that you have been vended belongs to, you can find this information in the sj_datasets column of the [SAMPLE_INFO.txt](./guides/data/metadata.md) file.

## Contact Us

Any questions, comments, or concerns can be directed to our ["Contact Us"](https://stjude.cloud/contact) form or you can email us directly at support@stjude.cloud.
