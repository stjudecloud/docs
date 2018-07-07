| | | 
|-------------|-----------------------|
| **Authors** | Xing Tang, Yong Cheng |
| **Publication** | N/A (not published) |
| **Technical Support** | [Contact Us](https://stjude.cloud/contact) |

!!! todo
    Add GIFs all throughout this page.

## Introduction

This pipeline is designed to call either broad of narrow peaks on Illumina-genearted
ChIP-Seq data. The pipeline accepts one FastQ file from an Immunoprecipitation (IP)
experiment and one FastQ file from a control experiment. First, the reads of the
FastQ file(s) are aligned to the specified reference genome. The aligned
reads are then post-processed based on best-practice QC techniques
(removing multiple mapped reads, removing duplicated reads, etc). Last,
peaks are called by SICER (broad peak analysis) or MACS2 (narrow peak
analysis). Qualified peaks will be output BED (.bed) and big BED (.bb)
files. The coverage information is also included also a bigWig (.bw)
file with an accompanying visualization by ProteinPaint. A cross
correlation plot and general metrics file are generated to help check
the quality of experiment.

## Overview

### Process

!!! todo
    Write ChIP-Seq process section.

### Inputs

!!! todo
    Write ChIP-Seq inputs section.

### Outputs

!!! todo
    Write ChIP-Seq outputs section.

## Getting started

To get started, you need to navigate to the [ChIP-Seq tool page](https://platform.stjude.cloud/tools/chip-seq). Here, you will need to click
the "Start" button in the left hand pane to create your tools cloud workspace.

![](../../images/guides/tools/chipseq/click-start.gif)

## Uploading data

Before uploading
On the [ChIP-Seq tool page](), you
should click the "Start" button before attempting to upload data to the tool
(the tool's workspace is only created once you do this). After you are
redirected, you can safely close the tab that was just opened.

The ChIP-Seq Peak Caller takes Gzipped FastQ files generated from an
IP experiment as input. You can upload your input FastQ files by
using the [data transfer application](../../guides/data/data-transfer-app.md)
or by uploading them through [the command line](../../guides/data/command-line.md).

Parameter Configuration
-----------------------

Click "Start" on the [tool's landing
page](https://platform.stjude.cloud/tools/chip-seq). You will be
redirected to the tool's workspace, which contains four different
pipelines that can be run based on your input data. Initially, you'll
need to decide **(1)** whether you'd like to run broad/narrow peak
calling *and* **(2)** whether you have case vs. control or only case
data. You should choose the correct workflow based on their names. After
you've selected your base pipeline, there are various other parameters
that you can set.

![The four different ChIP-Seq pipelines](../../images/guides/tools/chipseq/four-pipelines.png)

!!! warning
    If your fragment size is less than 50 base pairs, please refer to the
    <span role="ref">chipseq-faq</span>.

### Broad vs. Narrow Peak Calling

Choosing between broad and narrow peak calling depends on the experiment
design. The following are good rules of thumb for choosing between the
two configurations. If you are not sure which configuration to use,
please consult with an expert or contact the support personel for this
pipeline.

**Narrow Peak Calling**

If your target protein is a transcription factor, you should probably
choose narrow peak calling. You can also try the narrow peak calling
workflows for the following histone marks: \* H3K4me3 \* H3K4me2 \*
H3K9-14ac \* H3K27ac \* H2A.Z

**Broad Peak Calling**

You should try the broad peak calling workflows for the following
histone marks:

> -   H3K36me3
> -   H3K79me2
> -   H3K27me3
> -   H3K9me3
> -   H3K9me1

**Special Cases**

In some scenarios, H3K4me1, H3K9me2 and H3K9me3 might behave between
narrow and broad shape, you might need to look into each peak region and
consult experts.

### Other parameters

Once you have decided on a base pipeline, you can click that pipeline to
open up the workflow screen. You should see something similar to the
screenshot below (there might be small differences based on which
pipeline you picked). To edit settings, click the gear cog near the
middle of the screen (surrounded by a red rectangle in the picture
below).

![ChIP-Seq Pipeline with settings highlighted](../../images/guides/tools/chipseq/chipseq-pipeline.png)

You should now see the application configuration screen. In the bottom
right corner of the application, you can set a number of different
parameters.

![ChIP-Seq Settings with parameters highlighted](../../images/guides/tools/chipseq/chipseq-parameters.png)

The following are the parameters that can be set, as well as a short
description and example value. Any questions about parameters should be
directed to pipeline support personel.

<table>
<colgroup>
<col style="width: 24%" />
<col style="width: 65%" />
<col style="width: 9%" />
</colgroup>
<thead>
<tr class="header">
<th>Parameter Name</th>
<th>Description</th>
<th>Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Output prefix</td>
<td>A name used a prefix for all outputs in the run</td>
<td>SAMPLE1</td>
</tr>
<tr class="even">
<td>Reference genome</td>
<td>Supported reference genome (HG19, HG38, mm9, mm10, dm3)</td>
<td>HG38</td>
</tr>
<tr class="odd">
<td>Output bigWig</td>
<td>Whether or not to include a bigwig file in the output</td>
<td>True</td>
</tr>
<tr class="even">
<td>Remove blacklist peaks</td>
<td>Whether or not to remove known problem areas</td>
<td>True</td>
</tr>
<tr class="odd">
<td>Fragment length</td>
<td>Hardcoded fragment length of your reads. 'NA' for auto-detect.</td>
<td>NA</td>
</tr>
</tbody>
</table>

!!! warning
    When setting parameters, please be aware of these common point of
    failures.

    > -   Do not use spaces anywhere in your input file names, your output
    >     prefix, or any of the other parameters. This is generally bad
    >     practice and doesn't play well with the pipeline (consider using
    >     "\_" instead).
    > -   Do not change the output directory when you run the pipeline. At
    >     the top of parameter input page, there is a text box that allows
    >     you to change the output folder. *Please ignore that field*. You
    >     only need to specify an output prefix as described aboce. All of
    >     the results will be put under /Results/&lt;OUTPUT\_PREFIX&gt;.

## Running the Tool

### Selecting inputs

If you have not already, click on the appropriate pipeline for your
purposes (see <span role="ref">chipseq-parameter-config</span>). You
should see something similar to the screenshot below (there might be
small differences based on which pipeline you picked). Each box on the
left side of the screen is an input to the pipeline. As you can see, for
the paired pipeline picture below, the pipeline needs two inputs: FastQ
files for case and FastQ files for control.

![ChIP-Seq pipeline with inputs highlighted](../../images/guides/tools/chipseq/chipseq-pipeline-inputs.png)

Clicking on the input box below will allow you to hook up the data you
previously uploaded to be analyzed. If you have not yet uploaded your
data, see <span role="ref">chipseq-upload</span>. Once you click on the
input boxes, you should be able to select all of the inputs that follow
(see image below).

![Selecting all fastq inputs](../../images/guides/tools/chipseq/select-input.png)

Here, you can select the FastQ file for the case sample and click
"Select". You should see the dialog box dissappear and the files you
selected propogate in the input box. If applicable, repeat this process
for the control sample.

### Starting the workflow

Once your inputs are selected, you should be able to start the workflow
by clicking the "Run as Analysis..." button in the top right hand corner
of the workflow dialog.

!!! note

    If you cannot click this button, please ensure that **(1)** all of the
    inputs are correctly hooked up (see <span
    role="ref">selecting-inputs</span>) and **(2)** all of the required
    parameters are set (see <span
    role="ref">chipseq-parameter-config</span>).

![Running the workflow](../../images/guides/tools/chipseq/run.png)

## Monitoring Run Progress

!!! note
    Monitoring the progress of your runs is the same for all pipelines. This
    guide will feature the <span role="ref">rapid-rnaseq</span> pipeline,
    but you can follow along for any tool.

Monitoring the status of your pipelines in the St. Jude Cloud is simple.
First, navigate to your tool's description page (for instance, Rapid
RNA-Seq's description page is [here](https://platform.stjude.cloud/tools/rapid_rna-seq)). You should
see a screen similar to the one in the screenshot below. In the left
hand pane, select "View Running Jobs".

![Click "View Running Jobs"](../../images/guides/tools/common/running-jobs.png)

Here, you will see a list of all of your previous runs for a tool, as
well as the job status (successful, failed, terminated by user) and
cost. You can click on the "+" icon to the left of each tool run to see
all of the different tools that were run.

![Click the "+" beside a run to view more information.](../../images/guides/tools/common/jobs-basic.png)

Other information, such as time, cost of individual job, and even job
logs are available by clicking on the sub-items.

![Click on individual items in the list to explore detailed information on each analysis that was run.](../../images/guides/tools/common/jobs-advanced.png)

!!! note
    Advanced users can view the [DNAnexus Job Monitoring
    Tutorial](https://wiki.dnanexus.com/UI/Jobs) and the [DNAnexus Command
    Line Tutorial for Job Monitoring](https://wiki.dnanexus.com/Command-Line-Client/Monitoring-and-Listing-Jobs)
    for more information.

## Navigating Results

!!! note
    Navigating to the raw results of your runs is the same for all
    pipelines. This guide will feature the <span
    role="ref">rapid-rnaseq</span> pipeline, but you can follow along for
    any tool.

### Raw result files

Navigate to your tool's description page (for instance, Rapid RNA-Seq's
description page is
[here](https://platform.stjude.cloud/tools/rapid_rna-seq)). You should
see a screen similar to the one in the screenshot below. In the left
hand pane, select "View Results Files".

![Click "View Results Files"](../../images/guides/tools/common/raw-results.png)

You should now be in the tool's workspace with access to files that you
uploaded and results files that are generated. How/where the result
files are generated are specific to each pipeline. Please refer to your
individual pipeline's documentation on where the output files are kept.

![image](../../images/guides/tools/common/raw-results-success.png)

### Custom visualization results

Navigate to your tool's description page (for instance, Rapid RNA-Seq's
description page is
[here](https://platform.stjude.cloud/tools/rapid_rna-seq)). You should
see a screen similar to the one in the screenshot below. In the left
hand pane, select "Visualize Results".

![Click "Visualize Results"](../../images/guides/tools/common/visualize-results.png)

You should now be in the tool's workspace with access to files that you
uploaded and results files that are generated. How/where the result
files are generated are specific to each pipeline. Please refer to your
individual pipeline's documentation on where the output files are kept.

![image](../../images/guides/tools/common/visualize-results-success.png)

## Analysis of Results

!!! note
    Navigating to the results section of the tool is covered in <span
    role="ref">chip-seq-results-navigation</span>.

### Raw Results

For the ChIP-Seq pipeline, all results are distributed in the `Results`
folder. Underneath this folder, you will see all of the runs you've
completed, sorted by the output prefix you specified in <span
role="ref">chipseq-parameter-config</span>.

The exact content of the output folder changes as the version of the
pipeline updates. Please refer to the `README.txt` found in the output
folder for your run for the most up to date information on raw outputs.

### ProteinPaint Visualization

The ProteinPaint visualization is currently being implemented.

## Frequently asked questions

If you have any questions not covered here, feel free to reach out on
[our contact form](https://hospital.stjude.org/apps/forms/fb/st-jude-cloud-contact/).

**Q: Should I choose narrow peak calling pipeline or broad peak calling pipeline?**

> We built two workflows: one for narrow peak calling and another broad
> peak calling. If your target protein is a transcription factor, please
> use narrow peak calling workflow. For histone marks H3K4me3, H3K4me2,
> H3K9-14ac, H3K27ac and H2A.Z, you could try narrow peak calling
> workflow. For histone marks H3K36me3, H3K79me2, H3K27me3, H3K9me3 and
> H3K9me1, you could try broad peak calling workflow. In some scenario,
> H3K4me1, H3K9me2 and H3K9me3 might behave between narrow and broad
> shape, you might need to look into each peak region and consult
> experts.

**Q. What to do if your fragment size is less than 50 base pairs?**

> We estimate fragment size from the data based on the cross correlation
> plot. Usually the fragment size is above 50bp. If the estimated
> fragment size lower than 50bp, the workflow will stop at the peak
> calling stage (MACS2/SICER) after BWA mapping finishes. You can rerun
> the analysis with a specified fragment length.

**Q. Where can I find a version of the data access agreement?**

The latest version of the data access agreement can be found
[here](https://platform.stjude.cloud/access_form).
