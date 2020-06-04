## `base_zindex:100`

Set z-index value to floating panels and menus/tooltip.

## `variantPageCall_snv:(arg)=>{...}`

A logo generator: by calling this function with appropriate arguments it
generate a status logo for a given SNV/indel variant (e.g. telling the
pathogenecity of the variant)

Applicable to both SQLite-based dataset tracks and VCF tracks.

Function argument is an object with following keys:

-   chr:""
    -   chromosome name
-   position:INT
    -   1-based position on the chromosome
-   refallele:""
    -   the reference allele
-   altallele:""
    -   the alternative allele
    -   The notation for ref/alt alleles will vary based on source of data in the track, could potentially cause error. Standard notation is required
        [http://varnomen.hgvs.org/](http://varnomen.hgvs.org/)
-   container:<d3 selection>
    -   A D3 element as the container of the logo

## `selectsample_callback:(arg)=>{...}`

Provide a callback to handle selected sample IDs from within a dataset
track. The dataset track must have ".sampleselectable" set to true to be
eligible for sample selection. This is a trick apply this only to
Pediatric but not COSMIC on pecan.stjude.org.

Currently only works for dataset tracks with a preconfigured
SQLite-based track, but not VCF.

Argument is an object, keys:

-   **samplelst**:[]
    -   Array of sample ids
-   **basket**:"basket name"
    -   Allowed values: "gene", "expression"
-   **note**:""
    -   ProteinPaint will try its best to tell the reason of selection
