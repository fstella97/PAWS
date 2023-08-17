# PAWS

This repository contains all the code used in the development of “PAWS: A Synergy-Based Robotic Quadruped Leveraging Passivity for Robustness and Behavioural Diversity”. 
It includes: 
-	a Motion Capture dataset of real-world dog motion,
-	the algorithm to generate an optimized design of the robotic quadruped, 
-	the inverse kinematic algorithm used to generate motor actions in the reduced synergy space,
-	The analysis of the stiffness of the PAWS robot end effectors. 

The software has been developed and tested in MATLAB R2022a and in python 3.0 

The dataset of the dog motion, together with the scripts to extract and project joint motions is contained in “.\bvh-matlab-master”. Few scripts require the Matlab “.\mocaptoolbox-1.9.0” to be installed. 

Given the synergy matrix, the optimal mechanism can be found by running the script “.\Optimal_design\Synergy2OptStructure_Main”. This script, and its dependencies, execute one of the main methodological contributions of the article, detailed in Section 4.2 of the Methods. The file outputs the optimal structure and its evolution, which is visualized in the .mp4 video “Structure_animation”. In line 17, it is possible to vary the synergy matrix to be optimized for.

The inverse kinematic can be reproduced for a variety of motions, which can be selected in line 123, by running the script “Dog_IK_mult\main”.

The stiffness analysis can be reproduced by running the “Stiffness\Stiffness_analysis” script.  
Please note that the full pipeline could be applied to any dataset of biological movements. 

![IMG_1075](https://github.com/fstella97/PAWS/assets/85675387/79899a22-3d6f-43d2-af97-6a76b959fdd4)
