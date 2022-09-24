%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Energy-balance + snow model %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%version to run through different parameter setups as specified in input
%file
%MK, 20220416
clearvars;

%% Sensitivity loop
load('C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity\Input\parameter_list.mat'); %load parameter file
pl = parameter_list;

for sl = 1:22
    sls = num2str(sl);

%% Model setup for sensitivity runs

[grid,time,io,phys]         = func_init_params();
mkdir(fullfile('Output\sensitivity', sls)); %create output folder for each parameter setup
io.outdir = ['C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity\Output\Sensitivity\' , sls] ;
[C]                         = func_init_constants_update(sl,pl);
[grid]                      = func_init_grid(grid,io);
[A,clim,insol,OUT]          = func_init_arrays(C,grid,io);

%% Time-loop
for t=1:time.tn
    
    %% Print time to screen
    [time] = func_printtime(t,time);
    fprintf('This message is sent at time %s\n', datestr(now));

    %% Read and prepare climate input
    [clim,A] = func_loadclimate(C,grid,clim,io,t,time,A);

    %% Surface energy balance model
    [A,insol] = func_energybalance(C,A,clim,insol,t,time,grid);
    
    %% Snow/firn model
    [A] = func_snowmodel(C,A,clim,time.dt,grid,time,phys);
        
    %% Mass balance
    [A] = func_massbalance(A,clim,C);

    %% Runtime viewer
    func_runtimeviewer(A,io,t,grid,insol);
    
    %% Write output to files
    A.gridzmask = grid.z_mask;  %write to to be able to get output
    A.gridz = grid.z(grid.ind);       %write to to be able to get output
    [OUT,io] = func_writetofile(OUT,io,A,grid,t,time,C);
    
    %% Update DEM  
    [grid,A] = func_update_grid(io,grid,time,A); 
    
    %% check for problems
    %min(clim.snow)
   
end

end
