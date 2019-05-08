# Metadata

## Metadata Specification

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
| sj_embargo_date      | The [embargo date](../../faq.md#what-is-an-embargo-date), which specifies the first date which the files can be used in a publication.                                                                                                                                               |

### Clinical and Phenotypic Information

Also included is a set of phenotypic information queried from the physician or research team's records at the time of sample submission to St. Jude Cloud. These are all considered to be *optional*, as the level of information gathered for each sample varies. If empty, the physician or research team did not indicate a value for the field. All basic clinical or phenotypic information will have `attr_` prepended to their tag name.

| Property              | Description                                                                                                                                                                                                                                                                |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| attr_age_at_diagnosis | Age at first diagnosis. This field is normalized as a decimal value. If empty, the physician or research team did not indicate a value for this field.                                             |
| attr_diagnosis        | Primary diagnosis.                                                                                               |
| attr_ethnicity        | Self-reported ethnicity. Values are normalized according to the [US Census Bureau classifications][censusburea]. |
| attr_race             | Self-reported race. Values are normalized according to the [US Census Bureau classifications][censusburea].      |
| attr_sex              | Self-reported sex.                                                                                               |

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
