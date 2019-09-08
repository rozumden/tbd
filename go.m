%% initialise the paths 
EVAL.init();

%% run on TbD dataset
EVAL.run_tbd(); 

%% Visualise results (make videos for supplementary material)
VID.make_video_msc();

%% Speed estimation (TODO: not debugged yet)
EVAL.run_speeds();