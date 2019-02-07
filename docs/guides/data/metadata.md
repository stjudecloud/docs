# Metadata Provided

Each data request includes a text file called `SAMPLE_INFO.txt` that provides a number of file level properties (sample identifiers, clinical attributes, etc). The following is a list of properties provided.

| Properties | Description |
|------------------| --------- |
file_path | path to the file in your DNANexus project |
subject_name  | a unique subject identifier |
sample_name  | a unique sample identifier |
sample_type  | Autopsy, Cell line, Diagnosis, Germline, Metastasis, Relapse, or Xenograft |
sequencing_type  | RNA-seq, WGS, or WES |
file_type  | [BAM](../../guides/data/types-of-data#bam-files), [CNV](../../guides/data/types-of-data#cnv-files), [gVCF](../../guides/data/types-of-data#gvcf-files), [Somatic_VCF](../data/types-of-data#somatic-vcf-files) |
description  | optional field that may contain additional file information |
sj_diseases  | disease identifier |
sj_datasets  | [SJ dataset](../../guides/data/data-access-units#data-access-units) |
sj_pmid_accessions  | [Pubmed][pubmed] accession number |
sj_ega_accessions  | [EGA][ega] accession number |
attr_age_at_diagnosis | age at diagnosis (decimal)|
attr_diagnosis | diagnosis |
attr_ethnicity | ethnicity* ([Census Bureau standard][censusburea]) |
attr_race | race* ([Census Bureau standard][censusburea]) |
attr_sex | sex |
sj_dataset_accession  | SJ dataset accession number |
sj_embargo_date  | [Embargo date](../../guides/data/data-overview#embargo-dates) |

*Note that ethnicity and race are self reported attributes. 

[pubmed]: https://www.ncbi.nlm.nih.gov/pubmed/
[ega]: https://www.ebi.ac.uk/ega/home
[censusburea]: https://www.census.gov/mso/www/training/pdf/race-ethnicity-onepager.pdf
