function results = run_DSST(seq, res_path, bSaveImage)

%parameters according to the paper
params.padding = 1.0;         			% extra area surrounding the target
params.output_sigma_factor = 1/16;		% standard deviation for the desired translation filter output
params.scale_sigma_factor = 1/4;        % standard deviation for the desired scale filter output
params.lambda = 1e-2;					% regularization weight (denoted "lambda" in the paper)
params.learning_rate = 0.025;			% tracking model learning rate (denoted "eta" in the paper)
params.number_of_scales = 33;           % number of scale levels (denoted "S" in the paper)
params.scale_step = 1.02;               % Scale increment factor (denoted "a" in the paper)
params.scale_model_max_area = 512;      % the maximum size of scale examples

params.visualization = 0;

%running in benchmark mode - this is meant to interface easily with the benchmark's code.
seq = evalin('base', 'subS');
target_sz = seq.init_rect(1,[4,3]);
pos = seq.init_rect(1,[2,1])+ floor(target_sz/2);
img_files = seq.s_frames;
video_path = [];

params.init_pos = pos;
params.wsize = floor(target_sz);
params.img_files = img_files;
params.video_path = video_path;

[positions, fps] = dsst(params);

rects = positions;
position(:,1) = rects(:,2)-floor(rects(:,4)/2);
position(:,2) = rects(:,1)-floor(rects(:,3)/2);
position(:,3) = rects(:,4);
position(:,4) = rects(:,3);

results.type = 'rect';
results.res = position;
% fps = numel(img_files) /t;
results.fps = fps;
disp(['fps: ' num2str(fps)])