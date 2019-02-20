# Metadata Provided

Each data request includes a text file called `SAMPLE_INFO.txt` that provides a number of file level properties (sample identifiers, clinical attributes, etc). The following is a list of properties provided.

| Property              | Description                                                                                                                                                                                                           |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| file_path             | The path to the file in your St. Jude Cloud project.                                                                                                                                                                  |
| subject_name          | A unique subject identifier assigned internally at St. Jude.                                                                                                                                                          |
| sample_name           | A unique sample identifier assigned internally at St. Jude.                                                                                                                                                           |
| sample_type           | One of Autopsy, Cell line, Diagnosis, Germline, Metastasis, Relapse, or Xenograft                                                                                                                                     |
| sequencing_type       | Whether the file was generated from Whole Genome (WGS), Whole Exome (WES), or RNA-Seq.                                                                                                                                |
| file_type             | One of [BAM](../../guides/data/types-of-data#bam-files), [CNV](../../guides/data/types-of-data#cnv-files), [gVCF](../../guides/data/types-of-data#gvcf-files), [Somatic_VCF](../data/types-of-data#somatic-vcf-files) |
| description           | Optional field that may contain additional file information.                                                                                                                                                          |
| j_diseases            | Short disease identifier used internally at St. Jude. When determining primary diagnosis, use `attr_diagnosis` instead!                                                                                               |
| sj_datasets           | If present, the datasets in the data browser which this file is associated with.                                                                                                                                      |
| sj_pmid_accessions    | If the file was associated with a paper, the related [Pubmed][pubmed] accession number.                                                                                                                               |
| sj_ega_accessions     | If the file was associated with a paper, the related [EGA][ega] accession number.                                                                                                                                     |
| attr_age_at_diagnosis | Age at first diagnosis (normalized as a decimal value).                                                                                                                                                               |
| attr_diagnosis        | Primary diagnosis.                                                                                                                                                                                                    |
| attr_ethnicity        | Self-reported ethnicity according to the [US Census Bureau classifications][censusburea].                                                                                                                             |
| attr_race             | Self-reported race according to the [US Census Bureau classifications][censusburea].                                                                                                                                  |
| attr_sex              | Self-reported sex.                                                                                                                                                                                                    |
| sj_dataset_accession  | If present, the permanent accession number assigned in St. Jude Cloud.                                                                                                                                                |
| sj_embargo_date       | The [embargo date](../../guides/data/data-overview#embargo-dates), which specifies the first date which the files can be used in a publication.                                                                       |

[pubmed]: https://www.ncbi.nlm.nih.gov/pubmed/
[ega]: https://www.ebi.ac.uk/ega/home
[censusburea]: https://www.census.gov/mso/www/training/pdf/race-ethnicity-onepager.pdf
