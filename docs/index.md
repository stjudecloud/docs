# Welcome to St. Jude Cloud Documentation!

## Overview

Here, you'll find
authoritative guides for accessing St. Jude Cloud data, running analysis workflows (our workflows or your own) on the cloud,
and exploring curated data from numerous published studies by St. Jude and our collaborating institutions. For a brief overview of
everything St. Jude Cloud provides, we recommend that you watch the video
on [our home page](https://stjude.cloud).

Sign up [here](https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-subscribe/) to receive email notifications when we add new datasets, analysis pipelines, or other exciting features.

## Features

You can apply many different capabilities of St. Jude Cloud to your research, such as:

* Explore the [raw genomics data](https://platform.stjude.cloud/requests/diseases) we currently offer. You can browse by diagnosis, publication, or curated dataset while applying a number of different filters. For more information, see our [data request guide](./guides/data/data-request.md).
* Run your tools on *our* data by [requesting data](./guides/data/data-request.md) and packaging your tools in a secure cloud environment. See this [guide](./guides/data/creating-a-cloud-app.md) for an example.
* Run our in house analysis workflows on *your* data by [moving your data](./guides/data/data-transfer-app.md) to the cloud and selecting a [workflow](#analysis-workflows) to run. See this [guide](./guides/tools/rapid-rnaseq.md) for an example. 
* Explore St. Jude datasets through interactive visualizations that we have packaged for the community. For example, visit [PeCan](https://pecan.stjude.cloud) to visually investigate pediatric cancer mutation data.
* Create manuscript quality figures with *your* data to use in publications or to host on your website with [ProteinPaint](https://pecan.stjude.cloud/proteinpaint/TP53) or [GenomePaint](https://genomepaint.stjude.cloud/). See the [ProteinPaint](./guides/portals/pecan.md#proteinpaint) and [GenomePaint](./guides/portals/genome-paint.md) doc pages for help.

!!! note
    Please note that while it is free to receive and store our data in St. Jude Cloud, there are [compute and storage fees associated with working in the cloud, as well as egress fees for downloading our data](faq.md#will-i-be-charged-for-using-st-jude-cloud). 

## Datasets

The following projects currently distribute their data through St. Jude Cloud. Click [here](./glossary.md#data-access-unit) for more information about the projects listed below.

* Pediatric Cancer Genome Project (PCGP)
* St. Jude Lifetime (SJLIFE)
* Clinical Genomics (Clinical Pilot and G4K)
* Sickle Cell Genome Project (SGP)
* Childhood Cancer Survivor Study (CCSS)

## Analysis Workflows

St. Jude shares a number of end-to-end analysis workflows on the cloud. Click on the links below to learn more about the workflow.

* [PeCan Pie](https://platform.stjude.cloud/tools/pecan_pie)
* [NeoepitopePred](https://platform.stjude.cloud/tools/neoepitopepred)
* [ChIP-Seq Peak Calling](https://platform.stjude.cloud/tools/chip-seq)
* [Rapid RNA-Seq Fusion Detection](https://platform.stjude.cloud/tools/rapid_rna-seq)
* [WARDEN Differential Expression Analysis](https://platform.stjude.cloud/tools/warden)
* [Mutational Signatures](https://platform.stjude.cloud/tools/mutational_signatures)
* cis-x (coming soon)
* XenoCP (coming soon)

## Portals

St. Jude Cloud provides a number of user portals which you can use to interactively explore the results we produce. Click on the links below to
visit each of the corresponding portals.

* [Pediatric Cancer Portal (PeCan)](https://pecan.stjude.cloud). Interactively explore mutational recurrence and pathogenicity assessment of variants in pediatric cancer using a wide variety of St. Jude + publicly available data.
* [Sickle Cell Diseases Portal](https://sickle-cell.stjude.cloud). Explore the latest from the Sickle Cell Genomics Project (a collaboration between St. Jude and Baylor College of Medicine). 


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
| XenoCP  | paper in progress | 

!!! note
    If you are unsure what datasets the data that you have been vended belongs to, you can find this information in the sj_datasets column of the [SAMPLE_INFO.txt](./guides/data/metadata.md) file.

!!! warning
    Publishing using any of the data files _before_ the [embargo date](./glossary.md#embargo-date) has passed is strictly prohibited as outlined in the [Data Access Agreement (DAA)](./glossary.md#data-access-agreement).


## Contact Us

Any questions, comments, or concerns can be directed to our ["Contact Us"](https://stjude.cloud/contact) form or you can email us directly at support@stjude.cloud.
