!!! Warning
    This tutorial is IN PROGRESS

You can follow [this guide](../../guides/data/data-request.md) to request access to
St. Jude data in a secure cloud environment. Before you can begin writing your
own tools to run on our data, you'll need to understand a bit about how
data vending in St. Jude Cloud works. Behind the scenes, the [DNAnexus](https://www.dnanexus.com/) genomic ecosystem is the backbone for the computation
and storage in St. Jude Cloud. Each data request in St. Jude Cloud corresponds to a project in DNAnexus. We'll explain what this means below, but if you're so inclined, you can read an introduction to their ecosystem [here](https://wiki.dnanexus.com/UI/Quickstart).

## Accessing your data

Once your data access request is approved, the data you requested from St. Jude will automatically be distributed to a DNAnexus project with the same name as your data request. You can go to your [Manage Data](https://platform.stjude.cloud/requests/manage) page to see the requests you have submitted and go directly to your data.

## Using Our Data
St. Jude Cloud offers data and tools for you to use. However, many researchers are interested in using our data in combination with their own data or tools. To upload your own data, we recommend using the [Data Transfer App](data-transfer-app.md), or you can use the [command line](command-line.md). Anything you upload to St. Jude Cloud will be uploaded to your private, secure project in DNAnexus.

To upload your own tools and run them on data in you DNAnexus project you must use the [command line](command-line.md).

Reference the [Creating A Cloud App Tutorial](../../guides/data/creating-a-cloud-app.md) for more information on how to package your own tools and run them in the cloud environment.

### Frequently asked questions
**Q. Can I submit my data to St. Jude Cloud?**

**A.** At this time, St. Jude Cloud does not accept data submissions from other institutions. You can upload your data to your private, secure project folder, but that is not shared with St. Jude Cloud.
