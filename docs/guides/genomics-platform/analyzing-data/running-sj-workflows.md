
In this guide, we will explain generally how to run, from end-to-end, any of our in house analysis workflows from within the DNAnexus cloud ecosystem. The [DNAnexus](https://www.dnanexus.com/) genomic ecosystem is the backbone for the computation and storage in St. Jude Cloud. If you'd like, you can read an introduction to the DNAnexus ecosystem [here](https://documentation.dnanexus.com/). If you haven't already, follow [this guide](../requesting-data/data-request.md) to request access to St. Jude data in this secure cloud ecosystem. 


## Getting started

To get started with any St. Jude Cloud workflow, first navigate to the appropriate tool page. Below is a complete list of the workflows we offer along with links to their corresponding tool page and documentation page.

* NeoepitopePred [[tool page](https://platform.stjude.cloud/tools/neoepitopepred)] [[documentation](neoepitope.md)]
* ChIP-Seq Peak Calling [[tool page](https://platform.stjude.cloud/tools/chip-seq)] [[documentation](chipseq.md)]
* Rapid RNA-Seq Fusion Detection [[tool page](https://platform.stjude.cloud/tools/rapid_rna-seq)] [[documentation](rapid-rnaseq.md)]
* WARDEN Differential Expression Analysis [[tool page](https://platform.stjude.cloud/tools/warden)] [[documentation](warden.md)]
* Mutational Signatures [[tool page](https://platform.stjude.cloud/tools/mutational_signatures)] [[documentation](mutational-signatures.md)]
* Cis-X [[tool page]()] [[documentation]()]
* M2A [[tool page]()] [[documentation]()]
* XenoCP [[tool page]()] [[documentation]()]
* RNA Indel [[tool page]()] [[documentation]()]
* FKPM [[tool page]()] [[documentation]()]

From the appropriate tool page, click the "Start" button in the left hand pane. This creates a new DNAnexus cloud workspace (with the same name as the tool) and imports the tool. The gif below shows an example of starting the [Rapid RNA-Seq workflow](https://platform.stjude.cloud/tools/rapid_rna-seq).

![](../../../images/guides/tools/rapid-rnaseq/click-start.gif)

With subsequent runs, the sidebar shows "Launch Tool", meaning the workspace with the tool already exists. Click "Launch Tool" to start a new analysis.

!!! note
    If you can't see the "Start" button, one of these two scenarios is likely the case:

    * You see three buttons on the left sidebar instead of one. In this case,
      you've already clicked the "Start" button previously, and a cloud workspace has
      already been created for you. In this case, you're good! You can move
      on to the next section.
    * If you cannot see *any* buttons on the left side, you probably have not
      logged in yet. If you see a sentence that says "Log in to launch this 
      tool", simply login and try again.

    If neither of these are the case and you still can't click "Start",
    [contact us](https://stjude.cloud/contact).


## Uploading Files

Now that a DNAnexus cloud workspace has been created, you will be able to upload input files to that workspace. The specific documentation for each workflow will detail what input files you will need to upload. 

You can upload these files using the [data transfer application](../managing-data/data-transfer-app.md)
or by uploading them through [the command line](../analyzing-data/command-line.md). Both of the guides linked here will contain more details on how to upload data using that method, so we defer to those guides here.

!!! tip
    If you plan to upload data through the St. Jude Cloud Data Transfer application
    (recommended), you can click the "Upload Data" button the appears in the left panel after you click "Start". If you
    have not already downloaded the app, do so by clicking "Download app". Once you
    have the app, you can click "Open app" to open the app with the tool's cloud 
    workspace already opened and ready to drag-and-drop files into it!

    For more information, check out the [data transfer application](../managing-data/data-transfer-app.md) guide.

## Running the Workflow

Once you've uploaded data to your cloud workspace, click "Launch Tool" on the tool's landing page. A dropdown will present any presets required for running the workflow. For example, some workflows ask that you select whether you wish to start with FastQ files or a BAM file.

The gif below shows an example with the [Rapid RNA-Seq workflow](https://platform.stjude.cloud/tools/rapid_rna-seq)

![](../../../images/guides/tools/rapid-rnaseq/launch-tool.gif)


### Selecting Parameters

Some workflows allow you to specify or customize one or more run parameters. Many parameters will be set to a default value. To see all parameter options available, click the gear cog next to the substep titled with the workflow name. For a full list of the parameters and their
descriptions, see **Inputs** table on the documentation page for the workflow that you are running. Below is an example showing how to customize parameters for the Neoepitope Prediction workflow.

![](../../../images/guides/tools/neoepitope/change-parameters.gif)

### Hooking up Inputs

Next, you'll need to hook up the input files you uploaded in 
[the upload files section](#uploading-files). In the example below, we are running the Rapid RNA-Seq workflow using the FastQ version of the pipeline. The example gif shows  that you hook up the inputs by clicking on the `Fastq/R1` and `Fastq/R2` slots and selecting the respective input files. This process is similar for all workflows.

![](../../../images/guides/tools/rapid-rnaseq/hookup-inputs.gif)

### Starting the Workflow

Once your input files are hooked up, you should be able to start the workflow by clicking the **Run as Analysis...** button in the top right hand corner of the workflow dialog. See the example below using the Rapid RNA-Seq workflow.

![](../../../images/guides/tools/rapid-rnaseq/run-analysis.gif)

!!! tip
    If you cannot click this button, please ensure that all of the inputs are correctly hooked up.

    If you're still have trouble, please [contact us](https://stjude.cloud/contact) and include a screenshot of the workflow screen above.

## Monitoring Run Progress

Once you have started one or more workflow runs, you can safely close your browser and come back later to check the status of the jobs. To do this, navigate to the tool landing page of the workflow that you want to check. Next, click "View Results" then select the "View Running Jobs" option. 
You will be redirected to the job monitoring page. Each job you kicked off gets one row in this table. See the two examples below for the Rapid RNA-Seq workflow.

![](../../../images/guides/tools/rapid-rnaseq/monitoring-jobs.gif) 

You can click the "+" on any of the runs to check 
the status of individual steps of the workflow.
Other information, such as time, cost of individual steps in the workflow, and even viewing the job logs can accessed by clicking around the sub-items.

![](../../../images/guides/tools/rapid-rnaseq/job-detailed-view.gif) 

!!! tip 
    Refer to the [DNAnexus Monitoring Executions Documentation](https://documentation.dnanexus.com/user/running-apps-and-workflows/monitoring-executions) for advanced capabilities for monitoring jobs.


## Accessing Results

### Custom Visualizations
Most workflows in St. Jude Cloud produce one or more visualizations that helps you to understand the raw results. 

To access the visualization(s), navigate to your tool's description page (for instance, Rapid RNA-Seq's
description page is
[here](https://platform.stjude.cloud/tools/rapid_rna-seq)). You should see a screen similar to the one in the Rapid RNA-Seq workflow screenshot below. In the left hand pane, select "Visualize Results".

![Click "Visualize Results"](../../../images/guides/tools/common/visualize-results.png)

You should now see a list of visualization files like the ones shown below for the RNA-Seq workflow. Click on a visualization name to explore.

![](../../../images/guides/tools/common/visualize-results-success.png)

### Raw Results Files

If additionally, you would like to view raw output files, you may do so by following the directions below. 

Navigate to your tool's landing page (for instance, Rapid RNA-Seq's tool landing page is
[here](https://platform.stjude.cloud/tools/rapid_rna-seq)). You should see a screen similar to the one in the screenshot below. In the left hand pane, select "View Results Files".

![Click "View Results Files"](../../../images/guides/tools/common/raw-results.png)

You should now be in the filesystem view of your workflow's workspace with access to files that you
uploaded as well as results files that are generated. See the example filesystem view below for the Rapid RNA-Seq workflow.

![](../../../images/guides/tools/rapid-rnaseq/rapid-rna-results.png) 

This is similar to your the filesystem on your computer, and you can do many common operations such as deleting, renaming, and moving files. How/where the result files are generated are specific to each pipeline. Please refer to your individual workflow's documentation on where the output files are kept.

If you have any unanswered questions about how to run one of our in-house workflows, please [contact us](https://stjude.cloud/contact).

## Similar Topics

[Command Line Interaction](../analyzing-data/command-line.md)  
[Working with our Data Overview](../managing-data/working-with-our-data.md)   
[Downloading/Uploading Data](../managing-data/data-transfer-app.md)  
[Technical FAQs](../../../faq.md#how-can-i-explore-and-manipulate-data-files-stored-on-the-cloud-without-downloading-the-files-to-my-local-machine)