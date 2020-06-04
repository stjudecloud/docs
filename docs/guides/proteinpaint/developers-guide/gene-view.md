## `gene:'ikzf1'`

To launch a gene-view with the given gene. Value can be gene symbol
(TP53) or isoform name (NM\_000546), case-insensitive.

## `dataset:'clinvar'`

Show built-in datasets, join multiple by comma, case-insensitive

## `hlaachange:'V617F'`

Highlight given mutations (mostly AA change names but could be label of
any other type), for the first dataset specified by the "dataset"
parameter.

Groups of mutations with any label matching this input will be shown as
expanded, while the rest folded. Mutation label must be exact match,
case-sensitive.

This will only be effective for the first dataset to be rendered.

Provide the variants as string, join multiple mutation names by comma.
Unmatched ones won't be displayed:

```
hlaachange: "V617F,V392M",
```

Alternatively, provide an array of mutations. Each mutation is described
using a few attributes, of which "name" is used for matching. In case no
match can be found, the unmatched ones will be shown as a new track,
thus the purpose of "codon" and "class".

```
hlaachange: [
    { name:'V617F',codon:617,class:'missense'},
    { name:'new datapoint',codon:500,class:'nonsense'}
]
```

Value of "class" can be either class code or label. See below for
supported classes.

| Class code | Class label    |
| ---------- | -------------- |
| M          | MISSENSE       |
| E          | EXON           |
| F          | FRAMESHIFT     |
| N          | NONSENSE       |
| S          | SILENT         |
| D          | PROTEINDEL     |
| I          | PROTEININS     |
| P          | SPLICE\_REGION |
| L          | SPLICE         |
| Intron     | INTRON         |
| Utr3       | UTR\_3         |
| Utr5       | UTR\_5         |
| X          | NONSTANDARD    |
| noncoding  | NONCODING      |
| snv        | SNV            |
| mnv        | MNV            |
| insertion  | insertion      |
| deletion   | Small deletion |

## `mset:[]`

For adding one or multiple sets of predefined variants.

```javascript
mset: [
    {
       name:'Set 1',
       mlst: [
          { 
             gene:'BRAF',
             isoform:'NM_004333',
             mname:'V617F',
             class:'M',
             chr:'chr7',
             pos:140482900,
             dt:1
           },
           … more variants
       ]
     },
     … more sets
]
```

The value for "class" must be one of the class code from previous table.

"dt":1 is a hardcoded attribute.

## `hidedatasetexpression:true`

Value is "true".

Only apply when "dataset" is provided.

If set, will not display the gene expression panel accompanying the
dataset, and will only show mutation data over the gene/protein.

## `hidegenecontrol:true`

Value is "true".

If set, will hide the control buttons atop the coordinate ruler when
showing a gene.

## `hidegenelegend:true`

Value is "true".

If set, will hide all legends when showing a gene (mutation class,
mutation origin, protein domains)