You can follow [this guide](./data-request.md) to request access to
St. Jude data in a secure cloud environment. Before you can begin writing your
own tools to run on our data, you'll need to understand a bit about how
data vending in St. Jude Cloud works. Behind the scenes, the [DNAnexus](https://www.dnanexus.com/) genomic ecosystem is the backbone for the computation
and storage in St. Jude Cloud. Each data request in St. Jude Cloud corresponds to a project in DNAnexus. We'll explain what this means below, but if you're so inclined, you can read an introduction to their ecosystem [here](https://wiki.dnanexus.com/UI/Quickstart).

## Accessing your data request

Once your data access request is approved, the data you requested from St. Jude will automatically be distributed to a DNAnexus project with the same name as your data request. You can go to your [Manage Data](https://platform.stjude.cloud/requests/manage) page to see the status of the requests you have submitted and navigate directly to your data in DNAnexus.

!!! note
    If you have a question about the status of your data request which is not answered on the "Manage Data" page, you can email us at [support@stjude.cloud](mailto:support@stjude.cloud).

## Using our data

There are two primary ways you can interact with data vended to you in St. Jude Cloud:

* **Cloud access**. You can choose to work with the data in DNAnexus' genomics cloud ecosystem. This is our suggested method of interaction, as you can avoid downloading the data to your local servers (which both takes time and is error prone). If you choose to leverage this approach, you can either wrap your own analysis pipeline as a cloud app (see [our guide](./creating-a-cloud-app.md)) or leverage any of DNAnexus' publicly available apps (see [DNAnexus' guide](https://wiki.dnanexus.com/UI/Quickstart#Run-the-apps)).
* **Download the data** (*not suggested*). The second way to interact with data vended to you in St. Jude Cloud is by downloading the data to your local servers. If you wish to do this, you can either leverage the St. Jude Cloud Data Transfer Application (see [our guide](./data-transfer-app.md)) or you can download the data on the command line (see [our guide](./command-line.md)). **Note that you must have indicated you wish to download the data in your [data access agreement](../forms/how-to-fill-out-DAA.md#data-download-permission).**

## Frequently asked questions

**Q. Will St. Jude Cloud host my institution's data in the data browser?**

**A.** If you are interested in submitting data to St. Jude Cloud, please [contact us](mailto:support@stjude.cloud).
