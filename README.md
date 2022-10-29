File Link: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE193337
File Name: GSM5793824
The above file is obtained as tar format which contains matrix.mtx, barcodes.tsv,features.tsv that are analysed by Read10X() function
The Read10X() function reads in the output of the cellranger pipeline from 10X, returning a unique molecular identified (UMI) count matrix. The values in this matrix represent the number of molecules for each feature (i.e. gene; row) that are detected in each cell (column).

Steps:
Attaching package: 'dplyr' 'Seurat' 'patchwork'

Load the Prostate cancer dataset

Initialize the Seurat object with the raw (non-normalized data).

Read file with Read10X() function

Visualize QC metrics as a violin plot

FeatureScatter:FeatureScatter is typically used to visualize feature-feature relationships, but can be used
 for anything calculated by the object, i.e. columns in object metadata, PC scores etc.


Identify the 10 most highly variable genes

plot variable features with and without labels

Computing nearest neighbor graph

Computing SNN

Calculating cluster 1,2,3,4,5,6,7,8

Calculating FeaturePlot

Interpretation:

I have generated some common plots for visualising single-cell data, 
such as t-SNE plots (using dimensionality reduction technology) and heatmaps using UMAP algorithm.
The goal of these algorithms is to learn the underlying manifold of the data in order to place similar cells together in low-dimensional space.

Using featurePlot function genes that  highly expressed in a cell clusters are identified as PIGR and LCN2



Name: Arkaj Parkhe Msc.bioinformatics(2nd year)
