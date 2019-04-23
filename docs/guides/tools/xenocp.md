|                         |                                            |
|-------------------------|--------------------------------------------|
| **Authors**             | Michael Rusch, Liang Ding, Michael Macias  |
| **Publication**         | bioRxiv                                    |
| **Technical Support**   | [Contact Us](https://stjude.cloud/contact) |

XenoCP finds and cleans mouse reads in xenograft BAMs. This is done by comparing
read alignments to human and mouse genomes and identifying the read identities. 
XenoCP can be easily incorporated into any workflow as it takes a BAM file 
as input and efficiently cleans up the mouse contamination and gives a clean 
human BAM output that could be used for downstream genomic analysis.

XenoCP supports hg19 (GRCh37) and mm9 (MGSCv37).

[mutational signatures from COSMIC]: https://cancer.sanger.ac.uk/cosmic/signatures
[MutationalPatterns]: https://bioconductor.org/packages/release/bioc/html/MutationalPatterns.html
[Blokzijl, et al. (2018)]: #references

## Overview

<h3 id="inputs">Inputs</h3>

| Name                           | Type           | Description                                                                                  | Example               |
|--------------------------------|----------------|----------------------------------------------------------------------------------------------|-----------------------|
| BAM                            | File           | Input bam aligned to human reference genome. [required]                                      | [`*.bam`, `*.bam.bai`]|
| [Reference DB Prefix]          | String         | Basename of the input human reference assembly. [required]                                   | MGSCv37.fa            |
| Suffix Length                  | Integer        | Mate suffix length. [default: 4]                                                             | 4                     |
| Keep Mates Together            | Boolean        | Whether to keep mates together [default: True]                                               | True                  |
| Backet Number                  | Integer        | Number of backets [default: 31]                                                              | 15                    |
| Validation Stringency          | String         | Validation stringency: STRICT, LENIENT, SILENT [default: SILENT]                             | SILENT                |
| Output Prefix                  | String         | Prefix to append to output filenames [default: xenocp-]                                      | xenocp-               |
| Output Extension               | String         | Output file extension [default: bam]                                                         | bam                   |
| Sort Order                     | String         | Read sort order [default: queryname]                                                         | queryname             |

[Reference DB Prefix]: #Reference-DB-Prefix

<h3 id="outputs">Outputs</h3>

| Name                       | Type | Description                                                                        |
|----------------------------|------|------------------------------------------------------------------------------------|
| [Cleansed BAM]             | File | Cleansed BAM                                                                       |
| [Tie BAMs]                 | Files| BAMs with reads being classified as either human or mouse                          |
| [Contamination lists]      | Files| Tab-delimited file (no headers) with sample ID and tag pairs                       |

[Raw signatures]: #raw-signatures
[Signatures visualization]: #signatures-visualization
[sso]: #sample-sheet-out

<h3 id="process">Process</h3>

Mutational Signatures runs four steps using subcommands of [mtsg].

  1. Split VCFs (single or multi-sample) to multiple single-sample VCFs.
  2. If not given, generate a sample sheet from the directory of single-sample
     VCFs.
  3. Build a mutation matrix and reconstruct/fit it using COSMIC mutation
     signatures.
  4. Create a visualization file using the fitted signatures.

## Getting started

After logging in, click the "Start" button on the [Mutational Signatures tool
page]. This creates a new DNAnexus project and imports the tool.

With subsequent runs, the sidebar shows "Launch Tool", meaning the project with
the tool already exists. Click "Launch Tool" to start a new analysis.

[Mutational Signatures tool page]: https://platform.stjude.cloud/tools/mutational_signatures

### Input configuration

Mutational Signatures only requires VCFs as inputs. This can be a single
multi-sample VCF, multiple single-sample VCFs, or a combination of both. All
other inputs are optional.

Input files can be uploaded via the [data transfer application] or [command
line].

[data transfer application]: ../data/data-transfer-app.md
[command line]: ../data/command-line.md

<h4 id="vcfs">VCF(s)</h4>

_VCF(s)_ is a list of VCF inputs. The inputs can be single-sample or
multi-sample and uncompressed or gzipped. Sample names are taken from the VCF
header.

When using multi-sample VCFs, empty cells/absent variant calls must be
denoted with `.:.`.

gVCFs are not supported.

<h4 id="sample-sheet">Sample sheet</h4>

_Sample sheet_ is a tab-delimited file (no headers) with two columns: the
sample ID and a tag. The tag is an arbitrary identifier used to group the
samples, typically a disease abbreviation or tissue of origin.

If not given, a sample sheet will be generated automatically.

<h5>Example</h5>

|             |      |
|-------------|------|
| SJACT001_D  | ACT  |
| SJACT002_D  | ACT  |
| SJBALL063_D | BALL |
| SJHGG017_D  | HGG  |

<h4 id="output-prefix">Output prefix</h4>

_Output prefix_ is the prefix to append to the output filenames. By default,
if a single input VCF is given, its basename is used as the output prefix. If
multiple input VCFs are given, a default "mtsg" prefix is used. This behavior
can be overridden by a user-defined prefix.

<h5>Example</h5>

| VCF(s)                              | Prefix                  | Output filename for raw signatures       |
|-------------------------------------|-------------------------|------------------------------------------|
| [`pcgp.b38.refseq.goodbad.vcf`]     | pcgp.b38.refseq.goodbad | `pcgp.b38.refseq.goodbad.signatures.txt` |
| [`SJOS013_D.vcf`, `SJRHB007_D.vcf`] | mtsg                    | `mtsg.signatures.txt`                    |


<h4 id="disabled-vcf-column">Disabled VCF column</h4>

_Disabled VCF column_ is the column index to ignore when reading VCFs. This
is useful when the inputs are tumor-normal VCFs, and one column should be
ignored. Otherwise, the results would likely be duplicated.

The argument is a zero-based index relative to the sample names in the header
of the VCF. For example, in a VCF with samples `SJEPD003_D` and `SJEPD003_G`,
the germline sample (`SJEPD003_G`) can be discarded by setting the _disabled
VCF column_ to `1`.

<h5>Example</h5>

|        |     |    |     |     |      |        |      |        | 0          | 1          |
|--------|-----|----|-----|-----|------|--------|------|--------|------------|------------|
| #CHROM | POS | ID | REF | ALT | QUAL | FILTER | INFO | FORMAT | SJEPD003_D | SJEPD003_G |

## Uploading data

Mutational Signatures requires at least one VCF and an optional sample sheet
to be uploaded. These files can be uploaded via the [data transfer
application] or [command line].

[data transfer application]: ../data/data-transfer-app.md
[command line]: ../data/command-line.md

## Analysis of results

Upon a successful run of Mutational Signatures, three files are saved to the
results directory: raw signature contributions, a visualization file, and a
sample sheet.

### Interpreting results

<h4 id="raw-signatures">Raw signatures</h4>

_Raw signatures_ is a tab-delimited file of the raw results with sample
contributions for each signature. Column 1 is the sample name, columns
2-(N-1) are the COSMIC signatures contribution counts, and column N is the
group tag, where N is the total number of columns. The number of columns is
variable since if the signature has no contributions for all samples, it is
completely omitted.

Note that the last column `tissue` is a misnomer. It aligns to the arbitrary
tag given in the [sample sheet](#sample-sheet).

<h5>Example</h5>

|              | Signature.1 | Signature.2 | … | Signature.30 | tissue |
|--------------|------------:|------------:|:-:|-------------:|--------|
| SJACT001_D   |  1.71758029 |  131.033723 | … |   18.6910151 | ACT    |
| SJAMLM7005_D |  51.9627312 |  7.10850351 | … |            0 | AMLM7  |

<h4 id="signatures-visualization">Signatures visualization</h4>

_Signatures visualization_ is an HTML file that can be used for interactive
plotting.

When opened in a web browser, a set of controls allows plotting various
stacked bar charts: total contributions by signature, total contributions by
tag, and total contributions by sample per tag. The total contributions can be
stacked as absolute values or as a percentage of the total.

<h4 id="sample-sheet-out">Sample sheet</h4>

When no sample sheet is given as an input, one is generated automatically,
but it is not guaranteed the derived tags will be of any use. This generated
sample sheet is given as an output in the case the tags need to be manually
edited, and the job is resubmitted with it as an input.

When a sample sheet is given as an input, the sample sheet output is a copy
of the input.

See also the description for the input [sample sheet](#sample-sheet).

## Troubleshooting

To troubleshoot a failed run of Mutational Signatures, check the job log for
details.

<h3 id="wrong-genome-build">Wrong genome build</h3>

If the "Building mutation matrix" step during `run` fails, it is likely that
the selected genome build does not match the input VCF(s). Rerun the job with
a matching genome build.

<h4>Example</h4>

```
R: Building mutation matrix from 6 VCFs
R: Error in mut_matrix(vcf_list = filtered_vcfs, ref_genome = ref_genome) :
R:   Error in .Call2("solve_user_SEW", refwidths, start, end, width, translate.negative.coord,  :
R:   solving row 526: 'allow.nonnarrowing' is FALSE and the supplied start (79440206) is > refwidth + 1
```

## References

  * Blokzijl F, Janssen R, van Boxtel R, Cuppen E (2018). "MutationalPatterns:
    comprehensive genome-wide analysis of mutational processes." _Genome
    Medicine_. doi: [10.1186/s13073-018-0539-0]. PMID: [29695279].

[10.1186/s13073-018-0539-0]: https://doi.org/10.1186/s13073-018-0539-0
[29695279]: https://www.ncbi.nlm.nih.gov/pubmed/29695279

[mtsg]: https://github.com/stjude/mtsg
