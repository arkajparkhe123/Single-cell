library(Seurat)
library(dplyr)
library(patchwork)

pbmc.data = Read10X("C:/Users/arkaj/OneDrive/Documents/Single cell")
dim(pbmc.data)
pbmc = CreateSeuratObject(counts = pbmc.data, min.cells = 3, min.features = 200)
pbmc
pbmc.data[33400:33538, 1:10]
pbmc[["percent.mt"]] = PercentageFeatureSet(pbmc, pattern = "^MT-")
head(pbmc@meta.data)
VlnPlot(pbmc, features = c("nFeature_RNA", "nCount_RNA", "percent.mt"), ncol = 3)
plot1 = FeatureScatter(pbmc, feature1 = "nCount_RNA", feature2 = "percent.mt")
plot2 = FeatureScatter(pbmc, feature1 = "nCount_RNA", feature2 = "nFeature_RNA")
plot1
plot2
pbmc = subset(pbmc, subset = nFeature_RNA > 200 & nFeature_RNA < 2500 & percent.mt < 5)
pbmc
pbmc = NormalizeData(pbmc)
pbmc = FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top10 = head(VariableFeatures(pbmc), 10)
top10
# plot variable features
plot1 = VariableFeaturePlot(pbmc)
plot2 = LabelPoints(plot = plot1, points = top10, repel = TRUE)
plot2
all.genes = rownames(pbmc)
pbmc = ScaleData(pbmc, features = all.genes)
## scaling matrix
pbmc@assays$RNA@scale.data[1:50, 1:5]
pbmc = RunPCA(pbmc, features = VariableFeatures(object = pbmc))
DimHeatmap(pbmc, dims = 1:15, cells = 500, balanced = TRUE)
pbmc = FindNeighbors(pbmc, dims = 1:10)
## Computing nearest neighbor graph
## Computing SNN
pbmc = FindClusters(pbmc, resolution = 0.5)
head(pbmc@meta.data)
pbmc = RunUMAP(pbmc, dims = 1:10)
ElbowPlot(pbmc)
DimPlot(pbmc, reduction = "umap")
DimPlot(pbmc, reduction = "umap", label = T)
pbmc.markers = FindAllMarkers(pbmc, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
head(pbmc.markers)
a = pbmc.markers %>% group_by(cluster) %>% top_n(n = 2, wt = avg_log2FC)
a
genes = a %>% pull(gene)
genes
#Feature plot
FeaturePlot(pbmc, features = genes[1:2])
FeaturePlot(pbmc, features = genes[1:2], cols = c("orange", "pink"))
