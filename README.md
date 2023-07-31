Exploratory Analysis of Immunological Responses in Wild and Laboratory Mice (Briefly)
==
The use of mice as a model organism in biomedical research is widespread due to their similarities with humans in anatomy and physiology. However, the genetic isolation of inbred strains from natural populations raises concerns about the reliability of these models. 
The aim is to provide a comprehensive analysis of cytokine and chemokine concentrations in wild and laboratory mice, and to contribute to the understanding of the immune system.

The analysis is based on the dataset provided in the supplementary data 4 of the article "The comparative immunology of wild and laboratory mice, Mus musculus domesticus" of Abolins et al. (2017), further known as original.csv.

Methods
--
Primarily, pre-process the dataset using the different methods to create viable source of information.  
Secondly, performing the multivariate statistical analysis on the dataset. 
The final objective is to comparatively evaluate and visualize the produced results.

Results
--
Imputation:
1. The implemented method revealed significant differences in the imputed values compared to the original dataset.
2. Variations in correlations indicated specific instances of positive correlations where negative correlations were initially proposed.
3. Hierarchical clustering trees demonstrated significant distinctions, particularly: Interleukin 18, Interleukin 9, and macrophage colony-stimulating factor (MCSF).
<br>

![alt text](https://github.com/ReplicaParadoxica/Immunological-Responses-Analysis-Mice/blob/main/Figures/imputematrix.png?raw=true)

LDA:
1. The linear discriminant analysis revealed significant differences in cytokine and chemokine responses among the stimulation groups
2. Сyto- and chemo-kines concentrations could serve as reliable markers to differentiate between different biological groups due to their different immunology
3. Wild vs Lab mice demonstrated clear group separation during linear discriminant analysis
<br>

![alt text](https://github.com/ReplicaParadoxica/Immunological-Responses-Analysis-Mice/blob/main/Figures/LDA.png?raw=true)

PCA:
1. Lack of distinct separation or clear clustering between the two groups
2. Variables included in the analysis may not be effective in differentiating between the strains


![alt text](https://github.com/ReplicaParadoxica/Immunological-Responses-Analysis-Mice/blob/main/Figures/ScatterPlot_PCA.png?raw=true)

Conclusion:
--
Relying solely on laboratory mice, assumed to be detached from the real-life immunological exposure, as a model for human immunology may not fully capture the intricacies and complexities of immune responses. Suggesting more accurate models that better reflect real-life immunological exposure and enable a comprehensive understanding of immune responses.



Full study in [Digital Science Archive](https://www.diva-portal.org/smash/record.jsf?aq2=%5B%5B%5D%5D&c=1&af=%5B%22publicationTypeCode%3AstudentThesis%22%2C%22language%3Aeng%22%2C%22categoryId%3A11500%22%2C%22topOrganisationId%3A81%22%2C%22thesisLevel%3AM2%22%2C%22hasFulltext%3Atrue%22%2C%22categoryId%3A11548%22%5D&searchType=SIMPLE&sortOrder2=title_sort_asc&language=en&pid=diva2%3A1779948&aq=%5B%5B%5D%5D&sf=all&aqe=%5B%5D&sortOrder=author_sort_asc&onlyFullText=false&noOfRows=50&dswid=-6367) 

