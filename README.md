# ebfm_abramov_sensitivity
This repository contains supplementary code to the energy-balance and firn model code published under MarleneKro/ebfm_abramov/ (https://doi.org/10.5281/zenodo.5773796) and described in  https://doi.org/10.5194/tc-2021-380  and in Kronenberg Marlene. Changing glacier firn in Central Asia and its impact on glacier mass balance. PhD Thesis, University of Fribourg, 2022.

EBM_snow_cloud_sensitivity.m (with func_init_params_cloud_sensitivity.m) was used to assess the EBFM output sensitivity for Abramov glacier for different model forcings with varying cloud cover. The different files in Input_climate_cloud_sensitivity were constructed from abra_clim_original.mat and abra_clim_altern.mat in  MarleneKro/ebfm_abramov/EBFM_Abramov_Code/Climate/ and preliminary cloud cover data as described in Kronenberg et. al 2022 TCD. Datesets abra_clim_original.mat and abra_clim_altern.mat only vary for 1980-1998.

climate_cloud_sensitivity_1.mat is identical to abra_clim_original.mat 
climate_cloud_sensitivity_2.mat consists of the original forcing (abra_clim_original.mat) with cloudcover data from the alternative forcing (abra_clim_altern.mat). 
climate_cloud_sensitivity_3.mat consists of original forcing with daily averaged cloud cover is used. 
climate_cloud_sensitivity_4.mat consists of the alternative forcing with uncorrected simulated cloud cover.
climate_cloud_sensitivity_5.mat consists of the alternative forcing with bias corrected cloud cover not yet homogenized with summer precipitation.
climate_cloud_sensitivity_6.mat consists of original forcing with uncorrected simulated cloud cover.
climate_cloud_sensitivity_7.mat consists of the original forcing with bias corrected cloud cover not yet homogenized with summer precipitation. 

EBM_snow_parameter_sensitivity.m (with func_init_constants_update.m) was used to assess the EBFM output sensitivity for Abramov glacier for disturbed model parameters as specified in parameter_list.mat/parameter_list.txt. Please refer to parameter_list_with_header.xlsx for details. 

For both cases, five gridpoints as specified in grid_abra68_100m_5pts.mat with the subsurface conditions specified in the bootfile_run_HP227.mat were used.

Please note, that additional functions are necessary to run the code. They can be found under https://github.com/MarleneKro/ebfm_abramov.   

Please cite 
Kronenberg, M., van Pelt, W., Machguth, H., Fiddes, J., Hoelzle, M., and Pertziger, F.: Long-term firn and mass balance modelling for Abramov glacier, Pamir Alay, The Cryosphere Discuss. [preprint], https://doi.org/10.5194/tc-2021-380, in review, 2022.  

and

Kronenberg Marlene. Changing glacier firn in Central Asia and its impact on glacier mass balance. PhD Thesis, University of Fribourg, 2022.

when using this data. 
