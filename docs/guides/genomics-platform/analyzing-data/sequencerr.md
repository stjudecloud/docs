## Measuring and suppressing sequencer errors in next generation sequencing

|                       |                                                                                                                                                                                                                                                    |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Authors**           | Eric M Davis, Yu Sun, Yanling Liu, Pandurang Kolekar, Ying Shao, Karol Szlachta, Heather L Mulder, Dongren Ren, Stephen V Rice, Zhaoming Wang, Joy Nakitandwe, Alex Gout, Leslie L Robison, Stanley Pounds, Jefferey Klco, John Easton, Xiaotu Ma* |
| **Publication**       | In submission                                                                                                                                                                                                                                      |
| **Technical Support** | [Contact Us](https://stjude.cloud/contact)                                                                                                                                                                                                         |

## Overview

There is currently no method to precisely measure the errors that occur in the sequencing instrument, which is critical for next generation sequencing applications aimed at discovering the genetic makeup of heterogeneous cellular populations. 
We propose a novel computational method, SequencErr, to address this challenge by measuring base concordance in overlapping region between forward and reverse reads. Analysis of 3,777 public datasets from 75 research institutions in 18 countries revealed the sequencer error rate to be ~10 per million (pm) and 1.4% of sequencers and 2.7% of flow cells have error rates >100 pm. At the flow cell level, error rates are elevated in the bottom surfaces and >90% of HiSeq and NovaSeq flow cells have at least one outlier error-prone tiles. 
By sequencing a common DNA library on different sequencers, we demonstrate that sequencers with high error rates have reduced overall sequencing accuracy, and that removal of outlier error-prone tiles improves sequencing accuracy. Our study revealed novel insights into the nature DNA sequencing errors incurred in sequencers. Our method can be used to assess, calibrate, and monitor sequencer accuracy, and to computationally suppress sequencer errors in existing datasets


## Inputs

| Name           | Type       | Description                                     | Example            |
| -------------- | ---------- | ----------------------------------------------- | ------------------ |
| BAM file       | Input file | Binary version of the SAM file format (`*.bam`) | `Sample_1.bam`     |
| BAM index file | Input file | Index file for the BAM file (`*.bai`)           | `Sample_1.bam.bai` |

## Outputs

| Name           | Format | Description                                       |
| -------------- | ------ | ------------------------------------------------- |
| PairError file | `.txt` | Base concordance/discordance counts               |
| Counts file    | `.txt` | Base call frequencies for each genomic coordinate |


## Running the Analysis

Refer to the [analysis workflow guide](../../../files/guides/tools/sequencerr/SequencErr_Cloud_App_Instructions.pdf) to learn how to launch the workflow, hook up input files, adjust parameters, start a run, and monitor run progress.

You can navigate to the **SequencErr** application [here](https://platform.stjude.cloud/workflows/sequencerr).

### Selecting parameters
1. **BAM file name** _[Required]_

    A BAM file to process. 

2. **BAM index file name** _[Required]_

    The BAM index for your BAM file

3. **sample id** _[Required]_

    A unique name or identifier for the sample

4. **trimming length** _[optional]_

    Number of bases to trim off the 5' and 3' of the read.
    Default: 5

5. **hard quality cutoff** _[optional]_

    A hard threshold for discarding reads. If the fraction of bases with quality scores falling below this value exceeds fcut, the read will be filtered.
    Default: 20

6. **don't report base counts** _[optional]_
    
    Set this to prevent large count files from being generated
    Default: true


## Similar Topics

[Running our Workflows](../analyzing-data/running-sj-workflows.md)  
[Working with our Data Overview](../managing-data/working-with-our-data.md)   
[Downloading/Uploading Data](../managing-data/data-transfer-app.md)   
