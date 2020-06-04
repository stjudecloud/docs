Given a sequence mutation, PP will run fimo to predict motifs using the
reference sequence at the mutation site with a bit of flanking; then
will mutate the sequence, and run fimo again on the mutated sequence.
Predicted motif change will be rendered.

At the embedding API, add the "fimo" attribute to the argument of
`runproteinpaint()` function.

```javascript
fimo: {
   genome:'hg19',
   m: {
       chr: 'chr1',
       pos:47704967, 
       ref:'A', 
       alt:'AAAC'
   },
   fimo_thresh:1e-3,
   factor_profiles:[ { profile1}, {profile2}, … ]
}
```

## `.m:{}`

Defines the variant, with 1-based position.

Ref and alt allele sequences could be on the reverse strand. But is not
allowed for one allele to be on forward, and the other allele on
reverse.

PP will carry out motif prediction on both strands.

## `.factor_profiles:[]`

Transcription factor profiles to be shown alongside predicted motifs.

## Profile: isgenevalue

```javascript
       {
           isgenevalue: 1,
           name: 'TALL FPKM',
           mdslabel:'Pediatric2',
           querykey:'genefpkm',
           samplegroup_attrlst:[
              {k:'diagnosis_group_short',kvalue:'HM'},
              {k:'diagnosis_short',kvalue:'TALL'}
           ]
       },
```

## Profile: isgenevalueonesample

```javascript
 {
           isgenevalueonesample: 1,
           name: 'SJALL015645_D1-PASYAJ FPKM',
           mdslabel:'Pediatric2',
           querykey:'genefpkm',
           samplename:'SJALL015645_D1-PASYAJ',
           width:200,
       },
```