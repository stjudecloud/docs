## `datasetqueries:[ {dataset, querykey, ... } ]`

"block:true" is required for this parameter to work.

This launches one or multiple official GenomePaint tracks, available for
this genome.

[See this tutorial for launching custom
track](https://docs.google.com/document/d/1ZnPZKSSajWyNISSLELMozKxrZHQbdxQkkkQFnxw6zTs/edit#heading=h.k8aosi1ye7no).

The track is a combination of mutation, CNV, LOH, SV/fusion, FPKM etc.
Works with gene view and genome browser view.

Each JSON object defines a track backed by a GenomePaint dataset, along
with customization options.

**dataset**: STR

**querykey**: STR

-   Points to the official dataset available from this genome.

### Customization parameters

Following parameters will change the default behavior of the track.

**singlesample**: {}

```javascript
singlesample:{
   name: STR,
   waterfall:{
      inuse: true
   }
}
```

-   Optional. If provided, will launch the single sample view instead of the multi-sample view.

-   "name" is the sample name, required.

-   "waterfall" is optional. If provided, will apply the settings to the
    > waterfall plot.

Following attributes also works for defining [[custom
track]{.underline}](https://docs.google.com/document/d/1ZnPZKSSajWyNISSLELMozKxrZHQbdxQkkkQFnxw6zTs/edit#heading=h.k8aosi1ye7no):

**isfull**: BOOL

**isdense**: BOOL

-   Defines if to show in "dense" or "expanded" mode, works for
    > multi-sample.

-   This overrides the default setting on the dataset.

**sampleAttribute**:{}

```javascript
sampleAttribute:{
   "cancer_type": {
       hiddenvalues: [ "NBL", "RB" ]
   }
}
```

-   Optional. If provided, will filter out samples if they match with
    > given sample attribute key and values.

**vcf**:{}

-   hiddenclass: \[ \'M\', \'N\', ... \]

    -   See hlaachange for list of SNV/indel classes

**.hide\_cnvgain:true**

**.hide\_cnvloss:true**

-   Setting to true to hide either gain or loss

**cnv**:{}

-   hidden:1

-   upperlengthlimit: 0

-   **loh**:{}

    -   hidden:1

    -   upperlengthlimit: 0

        -   Set to 0 to show all LOH segments

-   **sv**:{}

    -   hidden:1

-   **fusion**:{}

    -   hidden:1

-   **itd**:{}

    -   hidden:1

**sampleset**:\[\]

```javascript
sampleset:[
   { name:'Group1', samples:['sample1','sample2', … ] },
   { name:'Group2', samples:['sampleA','sampleB', … ] }
}
```

-   Optional. Provides one or more groups of samples to limit the view
    > only to these samples.

## `mdssamplescatterplot:{ dataset:'xxx' }`

Launches the sample scatterplot view from a GenomePaint dataset. Only
available for official datasets. [[See
example]{.underline}](https://proteinpaint.stjude.org/examples/svcnv.scatter.html).

## `mdssurvivalplot:{}`

Launches a set of Kaplan-Meier plots from a GenomePaint dataset, with
customizations for each plot.

Only available for official datasets. [[View
instructions]{.underline}](https://docs.google.com/document/d/19k9_Z-DxN8WRD4yJEw7f9yCEzSGZj98n97-bV3MRlmE/edit?usp=sharing).

## `display_termdb:{}`

Launch termdb. [[Refer to termdb
document]{.underline}](https://docs.google.com/document/d/1uESIx4U6Dg02k8mDcT6PBhcq_3OuabctF-01PEsgjS4/edit#).

## `samplematrix:{}`

Using an official dataset
([[example]{.underline}](https://proteinpaint.stjude.org/F/hg19/pediatric.mds.example/matrix.nbl.KM.html)):

```javascript
samplematrix:{
  genome:'hg19',
  dslabel:'Pediatric2',
  ismutation_allsymbolic:true,
  limitsamplebyeitherannotation:[ { key:'diagnosis_short', value:'NBL' } ],
  features:[
    {
       label:'MYCN',
       ismutation:1,
       querykeylst:['svcnv','snvindel'],
       width:50,
       position:'chr2:16079110-16087476',
       snvindel:{
         excludeclasses:{snv:1,Intron:1,E:1,mnv:1,Utr3:1,Utr5:1}
       }
    },
    { … another feature … }
  ]
}
```

Using a custom dataset (to add example):

```javascript
samplematrix:{
  genome:'hg38',
  iscustom:true,
  querykey2tracks:{
    svcnv:{
      type:'mdssvcnv',
     url:'https://pecan.stjude.cloud/static/hg38/tcga-gdc/DLBC/TCGA_DLBC.CNV.gz',
    },
    vcf:{
      type:'mdsvcf',
     url:'https://pecan.stjude.cloud/static/hg38/tcga-gdc/DLBC/TCGA_DLBC.vcf.gz'
    }
  },
  features:[
    {
      label:'CDKN2A/B',
      ismutation:1,
      querykeylst:['svcnv','vcf'],
      width:50,
      position:'chr9:21843776-22119276',
      snvindel:{excludeclasses:{Intron:1}}
    },
    { … another feature … }
  ]
}
```