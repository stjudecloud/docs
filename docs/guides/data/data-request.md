## Request Process Overview

Creating a data request is the premier way to access raw St. Jude next 
generation sequencing data in the cloud. You can get a **free** copy of 
the data in a secure cloud environment powered by [Microsoft Azure](https://azure.microsoft.com/en-us/) and 
[DNAnexus](https://www.dnanexus.com/), or you can elect to download the data to your local computing 
environment.

!!! tip "Things to Remember"

    1. Data in St. Jude Cloud is grouped into [Data Access Units (DAUs)](../../glossary.md#data-access-unit), which usually correspond to large-scale sequencing initiatives at St. Jude. 
    2. Individuals can [apply for access](../../glossary.md#data-access-agreement) to DAUs on a case-by-case basis for a specific amount of time (usually 1 year).
    3. Access to data in a given DAU is assessed by the corresponding [Data Access Committee](../../glossary.md#data-access-committee) who reviews a variety of factors to grant access.
    4. There are a number of terms of use and restrictions outlined in the [Data Access Agreement](https://platform.stjude.cloud/access_form). Everyone who will be working with the data must understand and agree to these terms.



### Selecting Data

There are three main ways to make your data selection through our [Data Browser](https://platform.stjude.cloud/requests/diseases). You can peruse our raw genomic data by diagnosis, publication, or study and use a number of filtering options to narrow down your search. You may also be directed to the Genomics Platform through another App to request specific samples. 

You must have [created an account](../../create-an-account.md) and be logged in to make a data request. If you have not yet created an account or you are not logged in, the red *Request Data* button will say *Log In*.

![](../../images/guides/data/request-data-select-data.gif)

We ask that you review your selection and make sure that these are the [DAUs](../../glossary.md#data-access-unit) you would like to request. 

![](../../images/guides/data/request-data-select-DAUs.png)



### Making the Request

Now that you have selected your data, you will need to fill in some information to complete the request. From here, necessary information will be collected through a setup wizard. All of your progress will be automatically saved, and you can follow along with your progress on the left sidebar. 

This information will be collected whether you are requesting open-access or controlled-access data. It helps us structure your project folder correctly when we vend the data to you. 

![](../../images/guides/data/request-data-setup-wizard1.gif)


### Applying for Data Access
If you already have access to the data or are requesting open-access data, you will not be prompted to go through this section.

#### Signing the Data Access Agreement

Every person who requests access to our controlled-access data must sign the [Data Access Agreement (DAA)](../../glossary.md#data-access-agreement). If you are located in the United States of America, you can opt in to completing the DAA through an electronic setup wizard. If you are not located in the USA, or would like to complete the form manually, you can follow our instructions on [Filling Out The Data Access Agreement](../../guides/forms/how-to-fill-out-DAA).


If you opt to do the process through the setup wizard, the necessary information will be collected and added automatically to your agreement. Once you have completed the setup wizard, the form will be sent to you and necessary signatories through email via [DocuSign](https://www.docusign.com). You can learn more about our electronic data access agreement process [here](../../guides/forms/how-to-fill-out-DAA.md#the-electronic-data-access-agreement-process). 

!!! tip 
    If you receive an email from us that your DAA is incomplete, you may edit your DAA and upload the revised copy using the 'Add a Form' button the on Manage Data page. 

#### Checking your Request Status 
Once you start the Electronic Data Access Agreement process, you will have a draft autosaved for you on your [Manage Data](https://platform.stjude.cloud/requests/manage) page, accessible at any time.
    ![](../../images/guides/forms/docs-manage-data-page-labelled.png)

!!! example "Pending Request Types"
    1. Request 1 is an Open Draft, meaning the requestor has not finished the setup wizard, and that the DocuSign envelope has not been sent to any of the signatories. 

    2. Request 2, listed in the Projects section, has been sent to the signatories, but has not been completed by all of them. This status will look like the Request 3 when all of the signatories sign the document and it is ready to be sent to the Data Access Committee(s). 

    3. Request 3 is pending approval from the Data Access Committee(s), and the status will change from Pending to either Approved or Rejected, based on their decision. All submitted manual-process Data Access Agreements will show up in your Manage Data page like Request 3. 

Request approval typically takes a week or two if your data access agreement is correctly and completely filled out. You will receive automated emails from notifications@stjude.cloud at the time that your request is approved.

### Accessing Your Data

From the Manage Data page, you can click on a request to navigate to the DNAnexus platform where a project will have been created with the project name that you entered through the setup wizard. Once your request is approved, the data will be vended to your DNAnexus project folder and will be accessible to you. You can also follow the link in the approval email from notifications@stjude.cloud to view your DNAnexus project folder. When the data is vended, the directory structure will typically look something like the following:

```
project_space/
├── restricted/
│   ├── bam/
│   ├── gVCF/
│   ├── Somatic_VCF/
│   └── CNV/
└── SAMPLE_INFO.txt
```

The `SAMPLE_INFO.txt` file provides all the [metadata](../../guides/data/about-our-data.md#metadata) associated with the request, and the restricted folder contains all the data for which you were approved separated by file type. 
 
!!! info
    If you would like to download the data to local storage, there are
    extra steps you'll need to follow such as [getting additional signatures](../../guides/forms/how-to-fill-out-DAA#data-download-permission)
    on your data access agreement. We recommend that you work with the data
    in the cloud if it's feasible; the data provided by St. Jude is free, the compute charges are reasonable, and working in the cloud helps to eliminate the long, error-prone downloading process. Porting your tools to be run in the cloud is easy, as well. We recommend you follow [this guide](../../guides/data/creating-a-cloud-app) to get started.
