!!! Warning
    This tutorial is IN PROGRESS

# Getting started

This guide will take you through the process of creating an application for working with and manipulating the data you've requested. For any questions regarding how to use the command line, refer to the [command line interaction page](../../guides/data/command-line.md)

We will be creating creating an application that will wrap up the [FastQC tool](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) from Babraham Bioinformatics.

## Overview

Writing your own application will allow you to import any custom tools to manipulate any data that you have previously requested.

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

`dxapp.json` is the metadata JSON file that will allow us to build and run the DNAnexus `dx-toolkit` build and run commands. This file also allows us to specify all the various fields that our application will require. To see the full list of fields, refer to the [DNAnexus wiki](https://wiki.dnanexus.com/dxapp.json) guide on the application metadata.

The `src/dx_fastqc_example_app.sh` file is what will actually be executed when the application is run.

Any executable binaries that accompany the application such as other tools or scripts are placed in the `resources/usr/bin/` folder. From there, we can call the executable from within the app when it is run.

## Writing the Application

To create an application, there are two options. The first method is to use the `dx-app-wizard` command that is included in the `dx-toolkit`. `dx-app-wizard` is an interactive prompt that creates a boilerplate project that will allow you to quickly create an application. For more on `dx-app-wizard`, refer to the DNAnexus wiki article on [Intro to Building Apps](https://wiki.dnanexus.com/Developer-Tutorials/Intro-to-Building-Apps).

The second method is to manually create the directory structure and files yourself. This will result in a project very similar to the one created by `dx-app-wizard`. For more information, refer to the [Advanced App Tutorial](https://wiki.dnanexus.com/Developer-Tutorials/Advanced-App-Tutorial).

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
$ Summary []: This is our example FastQC application.
...
$ 1st input name (<ENTER> to finish): bam_file
$ Label (optional human-readable name) []: BAM File
...
$ Choose a class (<TAB> twice for choices): file
$ This is an optional parameter [y/n]: n
...
$ 1st output name (<ENTER> to finish): fastqc_reports
$ Label (optional human-readable name) []: FastQC Reports
$ Choose a class (<TAB> twice for choices): array:file
...
$ Timeout policy [48h]:
...
$ Programming language: bash
...
$ Will this app need access to the Internet? [y/N]: y
...
$ Will this app need access to the parent project? [y/N]: y
...
$ Choose an instance type for your app [mem1_ssd1_x4]: azure:mem1_ssd1_x4
```

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

Anything placed in `dx-fastqc-example-app/resources/` will be packaged into your application and then placed into the root directory of the Linux machine that your application will run on. If we create the directory path `dx-fastqc-example-app/resources/usr/bin/`, it would be the equivalent of `/usr/bin/` on the Linux machine. The `resources/` folder is always unpacked into the root of the virtual machine.

!!! Warning
    While anything in `dx-fastqc-example-app/resources/` is unpacked into the root directory of the file system, your applet's executable will start in `/home/dnanexus/` as its current working directory.

Though `dx-app-wizard` does not create this, we can create it ourselves.  Paste the following lines into your terminal.

```bash
$ mkdir -p dx-fastqc-example-app/resources/usr/bin
```

## Packaging FastQC


To incorporate `FastQC` into this project, we need to download the executable binary and package it within the `dx-fastqc-example-app`. Download the `FastQC v0.11.8 (Win/Linux zip file)` and unzip it. After unzipping, move the `FastQC/` folder into the `resources/` folder.

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

It is also acceptable to move all the contents into the `resources/usr/bin/` folder, but by keeping `FastQC/` in the `resources` folder, it will allow us to keep different tools separate from each other.

## Installing Dependencies

One requirement for `FastQC` is that it must have a suitable [Java Runtime Environment](https://www.java.com/en/). To include this in the app, we have to edit the `dxapp.json` file. Open `dxapp.json` and append the following line to `"runSpec"`:

```JSON
  "execDepends": [
    {"name": "openjdk-7-jre-headless"}
  ]
```

For more information on installing dependencies and software packages such as various `R` packages from `CRAN` or `Python` packages from `pip`, refer to [Execution Environment Reference](https://wiki.dnanexus.com/Execution-Environment-Reference). Now, the `"runSpec"` object should look like the following:

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

## Calling FastQC

The last step is to call the `FastQC` executable from within the app. Open up `src/dx_fastqc_example_app.sh` with a text editor. Inside this bash script is where we will be working with `FastQC` and our data. After the application downloads the input file (`dx download "$bam_file" -o bam_file`), we need to create the appropriate output directories and run `FastQC` on our BAM file. Add the following lines to the bash script:

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

We are using `"$bam_file_prefix"` to help name the output report file. These helper variables are provided by DNAnexus to help make file naming easy. To read more, refer to the [Advanced App Tutorial](https://wiki.dnanexus.com/Developer-Tutorials/Advanced-App-Tutorial#Set-output-name-using-bash-app-helper-variables).

In this step, we are also moving the HTML and Zip file generated by `FastQC` to the directories which will be uploaded. After this step, `dx-fastqc-example-app.sh` should look like:

```bash
#!/bin/bash

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
$ dx run dx-fastqc-example-app -i bam_file=/path/to/bam/file.bam
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
