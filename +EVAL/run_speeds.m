
for i = 1:numel(seq)
	EVAL.estimate_speeds_tbd(frame{i}, r0_all(i));
	EVAL.estimate_speeds(curves{i}, r0_all(i));
end
