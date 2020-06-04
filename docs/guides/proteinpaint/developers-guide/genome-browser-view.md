```html
<!DOCTYPE html>
<html>
<head><meta charset="utf-8"></head>
<body>
<script src="https://proteinpaint.stjude.org/bin/proteinpaint.js" charset="utf-8"></script>
<div id=a style="margin:20px"></div>
<script>
runproteinpaint({
    host:'https://proteinpaint.stjude.org',
    holder:document.getElementById('a'),
    parseurl:true,
    block:true,
    nobox:1,
    noheader:1,
    genome:'hg19',
    position:'chr12:25334648-25426944',
    nativetracks:'RefGene',
    tracks:[{
        "type":"bigwig",
        "file":"hg19/hg19.100way.phastCons.bw",
        "name":"UCSC phastCons 100ways",
        "height":100
    }]
})
</script>
</body>
</html>
```

View this example live at
[https://proteinpaint.stjude.org/examples/bigwig.html](https://proteinpaint.stjude.org/examples/bigwig.html).

## `block:true`

Value is "true". By setting this attribute it will require **genome** to
be set.

## `nativetracks:'RefGene'`

Show one or more native tracks. The tracks must be available from this
genome on this ProteinPaint server. Value can be following:

-   Track names joined by comma, e.g. "refgene", or
    > "refgene,repeatmasker"

-   Array of track names, \["refgene", "repeatmasker"\]

-   Array of track objects, with custom settings, each track must have
    > the "name" attribute

    -   \[ {"name":"refgene", "stackheight":15} \]

-   All track names are case-insensitive, e.g. "refgene" and "RefGene"
    > refers to the same track

## `tracks:[]`

Provide one or more custom tracks.

Tracks must be declared as JSON objects, [[as defined in this
tutorial]{.underline}](https://drive.google.com/open?id=1ZnPZKSSajWyNISSLELMozKxrZHQbdxQkkkQFnxw6zTs).

## Defining view range

### `position:'chr1:22222-33333'`

Specify the genomic region to display by default. If not provided, will
show the default region of this genome (pre-configured in ProteinPaint).

Note that the genome browser will force a minimum 400 bp range centered
on the input position. If this is undesired (e.g. to zoom in to finest
level), use "chr/start" keys as below.

### `positionbygene:'crebbp'`

A gene name or RefSeq accession may be given instead of "position"
(genomic coordinate). Gene name is case insensitive.

### `chr:'chr?',start:12345,`

Provide both "chr" and "start" keys to zoom into a nucleotide, at the
finest possible resolution. Optionally, define "stop".

## URL parameters

Example:

```
http://host/yourpage.html?position=chr1:111-222&hlregion=..
```

In which "yourpage.html" the HTML file calls the embedding API from this
section to launch a genome browser (block).

The URL parameters will customize the ways the block is shown, without
having to update anything inside the HTML file. The URL parameters are
listed below.

### `position=chr:start-stop`

Will change the default position.

### `hlregion=region1,region2,...`

To highlight the given regions. [[Requirements defined
here]{.underline}](https://docs.google.com/document/d/1e0JVdcf1yQDZst3j77Xeoj_hDN72B6XZ1bo_cAd2rss/edit#heading=h.51kfvkz9mjua).

## Genome browser API

By executing `runproteinpaint()` in your embedding code, it will return
a promise and resolve to an object with the attribute "block". The block
attribute is the genome browser object which provides the following
methods so you can manipulate the genome browser through your code.

### Changing view range

```javascript
runproteinpaint({ block:true, …  })
.then(_=>{
  _.block.jump_1basedcoordinate('chr1:222-333')
  // above will enforce a minimum 400bp range
  // alternatively, use {chr,start} to zoom in to finest level
  _.block.jump_1basedcoordinate({chr:'chr1',start:222})
})
```

### Highlight a region

```javascript
runproteinpaint({ block:true, …  })
.then(_=>{
  _.block.highlight_1basedcoordinate('chr1:222-333')
})
```

### Only show specific tracks for a track type

All the other tracks of the same type will be turned hidden.

```javascript
runproteinpaint({ block:true, …  })
.then(_=>{
  _.block.showTrackByFile([
     {type:'bam',file:'path/to/file1.bam'},
     {... another file}
  ]}
})
```

### Show given tracks

```javascript
runproteinpaint({ block:true, …  })
.then(_=>{
  _.block.turnOnTrack([
     {type:'bam',file:'path/to/file1.bam'},
     {... another file}
  ]}
})
```

### Hide given tracks

```javascript
runproteinpaint({ block:true, …  })
.then(_=>{
  _.block.turnOffTrack([
     {type:'bam',file:'path/to/file1.bam'},
     {... another file}
  ]}
})
```