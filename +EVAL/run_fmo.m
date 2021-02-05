if ~exist('params', 'var')
	[params, cfg] = EVAL.get_params();
end
[seq, folder] = EVAL.get_seq(0,'FMO');

datasetname = 'seq_img';

params.th = 10/255;
params.resize = 1;
params.increase_edge = false;
params.num_appear = 1;
params.expos = 0.7;
params.ext_factor = 5; % in radii
params.use_template = 0;
params.alpha_F = 0;

params.tbd_on_fmod = 1;
params.return_prediction = false;

frame = repmat({[]}, 1, numel(seq));
for i = 16:numel(seq)
	warning('off','all');
	params0 = params;
	params0.resize = seq(i).resize;

	video = VID.VideoImg(folder, seq(i).name, datasetname);
	if isempty(seq(i).end_frame)
		seq(i).end_frame = video.sz;
	end
	video.sz = seq(i).end_frame;
	
	frame{i} = EVAL.tbd_main_loop(video, cfg, params0);

	% if cfg.write, writer = VideoWriterWrapper(folder, seq(i).name); else, writer = []; end
	% gt = GT.GroundTruthImg(folder, seq(i).name, seq(i).end_frame);
end