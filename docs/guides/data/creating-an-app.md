!!! note
    This section of the documentation is currently under construction. If your question is not answered here,
    please [contact us](https://stjude.cloud/contact)!

# Creating an Application

This guide will take you through the process of writing an application for working with and manipulating the St. Jude data you've requested. By creating your own application, you will be able to import packages and tools from various sources such as [CRAN](https://cran.r-project.org/), [pip](https://pypi.org/), [CPAN](https://www.cpan.org/), and [RubyGems](https://rubygems.org/), as well as any tool or application you might have written yourself.

We will be creating creating an application that will wrap up the [FastQC tool](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) from Babraham Bioinformatics.

## Overview

Writing your own application will allow you to import any custom tools to manipulate any data that you have previously requested. When submitting a job, the request gets sent to a virtualized Linux container where your script and commands will be run. Any tools or packages that you include (either through one of the included package managers or bundled together in your project) will be available locally on the virtual node.

The biggest thing to know is how the application is structured. All DNAnexus project applications will have the following structure:

```
dx-fastqc-example-app/
├── dxapp.json
├── resources/
│   └── usr/
│       └── bin/
└── src/
    └── dx_fastqc_example_app.sh
```

The `dxapp.json` file is the metadata JSON file that will allow us to build and run the DNAnexus `dx-toolkit` build and run commands. This file also allows us to specify all the various fields that our application will require. To see the full list of fields, refer to the [DNAnexus wiki](https://wiki.dnanexus.com/dxapp.json) guide on the application metadata.

The `dx_fastqc_example_app.sh` file is what will actually be executed when the application is run. Any executable binaries that accompany the application such as other tools or scripts are placed in the `resources` folder. From there, we can call the executable from within the app when it is run.

## Requesting Data

After submitting a [data request](https://stjude.github.io/sjcloud-docs/guides/data/data-request/), it will be sent out for evaluation. Once it has been approved, the data will be vended and it will be accessible in a DNAnexus project. You can view all the available projects and data from the [Manage Data](https://platform.stjude.cloud/requests/manage) page where you can view the request name, creation date, total number of files, what files you have immediate access to, and the status of your request. You will also be able to submit required documentation on the Manage Data page.

If you click on a request, it will take you to the DNAnexus platform, where you can view all the files available to you and your project. When a request is submitted, the project will be created, but the data will not be available until your request has been reviewed and approved. Once approved, you should be able to view all the available data from your request. When the data is vended, it will typically look something like:

```
project_space/
├── restricted/
│   ├── bam/
│   ├── gVCF/
│   ├── Somatic_VCF/
│   └── CNV/
└── SAMPLE_INFO.txt
```

The `SAMPLE_INFO.txt` file provides all the metadata associated with the request, and the restricted folder contains all the data separated by file type. For more info, refer to the [Metadata Provided](../../guides/data/command-line.md) section.

After your data access request has been approved, we can begin writing our app. For this tutorial, we will be importing [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/), a quality control tool for raw sequence data, into our application. This will allow us to run `FastQC` on any of the St. Jude next generation sequencing data in the cloud. For more about `FastQC`, refer to the [FastQC documentation](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/).

## Writing the Application

For this application, we will be using the `dx-app-wizard` command that is included in the `dx-toolkit`. `dx-app-wizard` is an interactive prompt that creates a boilerplate project that will allow you to quickly create an application. For more on `dx-app-wizard`, refer to the DNAnexus wiki article on [Intro to Building Apps](https://wiki.dnanexus.com/Developer-Tutorials/Intro-to-Building-Apps). Before continuing, be sure to refer to the [command line interaction page](../../guides/data/command-line.md) for a walkthrough on how to install [dx-toolkit](https://wiki.dnanexus.com/Downloads) and how to select your project workspace.

!!! tip
    It is not necessary to use `dx-app-wizard`. All the necessary files and project directory structure can be created manually. However, `dx-app-wizard` provides a quick and easy way to get started. For more information, refer to the [Advanced App Tutorial](https://wiki.dnanexus.com/Developer-Tutorials/Advanced-App-Tutorial).

For this tutorial, you will also need the `FastQC` tool which can be downloaded [here](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/).

## Creating the Project

Start by running the `dx-app-wizard` command from your terminal.

```bash
$ dx-app-wizard
```

For our inputs, we will enter the following:

```bash
$ App Name: dx-fastqc-example-app
...
$ Title []: FastQC Example Application
...
$ Summary []: Uses FastQC to generate quality control reports on raw sequence data.
...
$ Version [0.0.1]: 0.0.1
...
$ 1st input name (<ENTER> to finish): bam_file
$ Label (optional human-readable name) []: BAM File
...
$ Choose a class (<TAB> twice for choices): file
$ This is an optional parameter [y/n]: n
...
$ 1st output name (<ENTER> to finish): fastqc_html
$ Label (optional human-readable name) []: FastQC HTML Report
$ Choose a class (<TAB> twice for choices): file$

$ 2nd output name (<ENTER> to finish): fastqc_zip
$ Label (optional human-readable name) []: FastQC Zip File
$ Choose a class (<TAB> twice for choices): file
...
$ Timeout policy [48h]: 48h
...
$ Programming language: bash
...
$ Will this app need access to the Internet? [y/N]: y
...
$ Will this app need access to the parent project? [y/N]: y
...
$ Choose an instance type for your app [mem1_ssd1_x4]: azure:mem1_ssd1_x4
```

The `FastQC` executable supports a variety of file formats (BAM, SAM, FastQ, etc.), and outputs a HTML report and a zip file that contains all the graphs and data. We will use that knowledge to write the input and output parameters for our application. We can also specify other parameters such as the timeout policy, programming language, and instance type. For more information, refer to the [IO and Run Specification](https://wiki.dnanexus.com/API-Specification-v1.0.0/IO-and-Run-Specifications#Run-Specification) guide.

## Integrating FastQC

Once we have finished creating the basic FastQC application using `dx-app-wizard`, the project structure should look like:

```
dx-fastqc-example-app/
├── Readme.developer.md
├── Readme.md
├── dxapp.json
├── resources/
├── src/
│   └── dx-fastqc-example-app.sh
└── test/
```

Anything placed in the `resources` folder will be packaged into your application and then placed into the root directory of the Linux machine that your application will run on. If we create the directory path `dx-fastqc-example-app/resources/usr/bin`, it would be the equivalent of `/usr/bin` on the Linux machine. The `resources` folder is always unpacked into the root of the virtual machine.

!!! Info
    Anything in the resources folder is unpacked into the root directory (`/`) of the virtual Linux machine that your application will run on. If we create the directory path `dx-fastqc-example-app/resources/usr/bin/`, anything in the bin folder would be unpacked into `/usr/bin/` on the Linux machine. This is handy because that path is included in the default `$PATH` environment variable.

    Your application's executable will use `/home/dnanexus/` as its current working directory.

Though `dx-app-wizard` does not create this, we can create it ourselves.  Paste the following lines into your terminal.

```bash
$ mkdir -p dx-fastqc-example-app/resources/usr/bin
```

## Packaging FastQC

To incorporate `FastQC` into this project, we need to download the executable binary and package it within the `dx-fastqc-example-app`. Download the `FastQC v0.11.8 (Win/Linux zip file)` and unzip it. After unzipping, move the `FastQC` folder into the `resources` folder.

```bash
$ unzip fastqc_v0.11.8.zip
$ mv FastQC /path/to/project/dx-fastqc-example-app/resources/
```

Now, our project will look like this:
```
dx-fastqc-example-app/
├── LICENSE
├── README.md
├── Readme.developer.md
├── dxapp.json
├── resources/
│   ├── FastQC/
│   │   ├── fastqc
│   │   └── ...
│   └── usr/
│       └── bin/
└── src/
    └── dx_fastqc_example_app.sh

```

It is also acceptable to move all the contents into the `resources/usr/bin/` folder, but by keeping `FastQC` in the `resources` folder, it will allow us to keep different tools separate from each other.

## Installing Dependencies

!!! tip
    If you are importing custom tools, or are using tools that rely on various packages and requirements, they can be specified in the "runSpec".

    For more information on installing dependencies and available software packages, refer to the [Execution Environment Reference](https://wiki.dnanexus.com/Execution-Environment-Reference).

One requirement for `FastQC` is that it must have a suitable [Java Runtime Environment](https://www.java.com/en/). To include this in the app, we have to edit the `dxapp.json` file. Open `dxapp.json` and append the following line to `"runSpec"`:

```JSON
  "execDepends": [
    {"name": "openjdk-7-jre-headless"}
  ]
```

Now, the `"runSpec"` object should look like the following:

```JSON
  ...
  "runSpec": {
    "timeoutPolicy": {
      "*": {
        "hours": 48
      }
    },
    "interpreter": "bash",
    "release": "14.04",
    "distribution": "Ubuntu",
    "file": "src/dx_fastqc_example_app.sh",
    "execDepends": [
      {"name": "openjdk-7-jre-headless"}
    ]
  },
  ...
```

Some external package managers include, but are not limited to:

| Package Manager | Application |
| --------------- | ----------- |
| APT             | Ubuntu      |
| CPAN            | Perl        |
| CRAN            | R           |
| gem             | Ruby        |
| pip             | Python      |

## Calling FastQC

The last step is to call the `FastQC` executable from within the app. Open up `src/dx_fastqc_example_app.sh` with a text editor. Inside this bash script is where we will be working with `FastQC` and our data. Before we dive in, its a good idea to add a few useful parameters for the script execution.

Right after the Bash shebang (`#!/bin/bash`), add the following line:

```bash
set -e -x
```

Below is a table describing what each flag does:

| Flag | Description                                                 |
| ---- | ----------------------------------------------------------- |
| -e   | Exit immediately if a command exits with a non-zero status. |
| -x   | Print each command to standard error before execution.      |

After the application downloads the input file (`dx download "$bam_file" -o bam_file`), we need to create the appropriate output directories and run `FastQC` on our BAM file. Add the following lines to the bash script within the `main` function:

```bash
mkdir "$HOME"/fastqc-out/                               # FastQC Output Folder
mkdir -p "$HOME"/out/fastqc_html/"$bam_file_name"/      # FastQC HTML File Upload Directory
mkdir -p "$HOME"/out/fastqc_zip/"$bam_file_name"/       # FastQC Zip File Upload Directory

fastqc -t "$(nproc)" "$bam_file_name" -o "$HOME"/fastqc-out     # Invoking FastQC on the BAM file
```

## Uploading Files

After `FastQC` finishes, the last thing to do is to move the reports generated by `FastQC` to the appropriate output folders. Add the following lines to `dx-fastqc-example-app.sh`.

```bash
mv "$HOME"/fastqc-out/*.html "$HOME"/out/fastqc_html/"$bam_file_prefix"_fastqc.html
mv "$HOME"/fastqc-out/*.zip "$HOME"/out/fastqc_zip/"$bam_file_prefix"_fastqc.zip
```

We are using `"$bam_file_prefix"` to help name the output report file. These helper variables are provided by DNAnexus to help make file naming easy.

!!! tip
    For more information on helper variables, refer to the [Advanced App Tutorial](https://wiki.dnanexus.com/Developer-Tutorials/Advanced-App-Tutorial#Set-output-name-using-bash-app-helper-variables).

In this step, we are also moving the HTML and Zip file generated by `FastQC` to the directories which will be uploaded. After this step, `dx-fastqc-example-app.sh` should look like:

```bash
#!/bin/bash

set -e -x

main() {
    echo "Value of bam_file: '$bam_file'"

    dx download "$bam_file" -o bam_file

    mkdir "$HOME"/fastqc-out/
    mkdir -p "$HOME"/out/fastqc_html/"$bam_file_name"/
    mkdir -p "$HOME"/out/fastqc_zip/"$bam_file_name"/

    fastqc -t "$(nproc)" "$bam_file_name" -o "$HOME"/fastqc-out

    mv "$HOME"/fastqc-out/*.html "$HOME"/out/fastqc_html/"$bam_file_prefix"_fastqc.html
    mv "$HOME"/fastqc-out/*.zip "$HOME"/out/fastqc_zip/"$bam_file_prefix"_fastqc.zip

    fastqc_html_file=$(dx upload fastqc_html --brief)
    fastqc_zip_file=$(dx upload fastqc_zip --brief)

    dx-jobutil-add-output fastqc_html_file "$fastqc_html" --class=file
    dx-jobutil-add-output fastqc_zip_file "$fastqc_zip" --class=file
}
```

## Building Your App

To build your application, enter the following into your terminal:

```bash
$ dx build dx-fastqc-example-app
```

This command will package the tools and files as an application which can then be run on the DNAnexus Platform.

## Running Your App

To run the `dx-fastqc-example-app`, enter the following into the terminal:

```bash
$ dx run dx-fastqc-example-app -i bam_file=/project_space/restricted/bam/<bam-file>.bam
```

You will be prompted to confirm that you wish to run the application with the following JSON input and whether you would like to monitor the job in your terminal.

```bash
Using input JSON:
{
    "bam_file": {
        "$dnanexus_link": {
            "project": "project-FV9XFG0991ZbPVgQ2jx1vZv5",
            "id": "file-FV9gzf8991ZXQ1kv7V3BqgjV"
        }
    }
}

Confirm running the executable with this input [Y/n]: Y
Calling applet-FVbY8Qj991ZQ1863BGK6x0bk with output destination project-FV9XFG0991ZbPVgQ2jx1vZv5:/

Job ID: job-FVbY8Z0991ZXx5v1Fk3QgJPV
Watch launched job now? [Y/n] Y

Job Log
-------
Watching job job-FVbY8Z0991ZXx5v1Fk3QgJPV. Press Ctrl+C to stop.
```

## Examples

For more examples, refer to the [St. Jude App Tutorial Repository](https://github.com/stjude/sjcloud-app-tutorial).
