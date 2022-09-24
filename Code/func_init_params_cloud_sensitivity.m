%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Model parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [grid, time, io, phys] = func_init_params_cloud_sensitivity()

% Time parameters
time.ts = '01-Jan-1968 0:00';                   % date start run %data from Warren needs 02:55

time.TS = datenum(time.ts);                     % " "
time.te = '31-Dec-2020 21:00';                  % date end run %data from Warren needs 02:55

time.TE = datenum(time.te);                     % " "
time.dt = 1/8;                                  % timestep (days)
time.tn = round((time.TE-time.TS)/time.dt)+1;   % nr of timesteps

time.ti = '01-Jan-1968';                        % start climate record
time.TI = datenum(time.ti);                     % " "

% Grid parameters
grid.dx = 100;                                  % horizontal grid spacing (update this according to grid used)
grid.utmzone = 42;                              % UTM zone 
grid.max_subZ = 0.1;                            % maximum layer thickness (m)
grid.nl = 100;                                  % number of vertical layers
grid.doubledepth = 1;                           % if glacier, double vertical layer depth at layer grid.split (1=yes, 0=no)
grid.split = [15;25;35];                        % if glacier, vertical layer nr at which layer depth doubles

% Model physics parameters
phys.percolation = 2;                           % deep percolation scheme (1 = bucket, 2 = normal dist., 3 = linear dist., 4 = uniform dist.)

% Input/output parameters
io.homedir = 'C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity_cloud';
io.rebootdir = [io.homedir '/Reboot/'];
io.climdir = 'C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity\Climate\';
io.gridfile = 'C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity\Grid\grid_abra68_100m_selpts';
io.gridfile = 'C:\Users\Kronenbe\Documents\MATLAB\EBFM_sensitivity\Grid\grid_abra68_100m_5pts.mat';

io.readclimatefromfile = 1;                     % read climate data from input files (1=yes, 0=no)                         
io.readbootfile = 1;                            % read initial conditions from file (1=yes, 0=no)
io.writebootfile = 0;                           % write file for rebooting (1=yes, 0=no)  
io.out_surface = 1;                             % write surface variables to files (1=yes, 0=no)
io.out_subsurface = 1;                          % write subsurface variables to files (1=yes, 0=no)
io.updateDEM = 1;                               % update DEM for each timestep (1=yes, 0=no)
io.bootfilein = 'bootfile_run_HP227.mat';       % bootfile to be read  
io.bootfileout = 'temp.mat';                    % bootfile to be written
io.infofile = 'runinfo.mat';                    % file to store run information
io.runtimeview = 0;                             % runtime viewer (1=yes, 0=no)
io.runtimeview_freq = 1;                        % frequency of runtime plotting (every n-th time-step)
io.freqout = 8;                                 % frequency of storing output (every n-th time-step)

end

