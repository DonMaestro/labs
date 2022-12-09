function [y] = convolution(f, g)
	fsize = length(f);
	gsize = length(g);
	ysize = length(f) + length(g) - 1;

	for n = 1:ysize
		y(n) = 0;

		for k = 1:fsize
			if(n - k + 1 >= 1 && n - k + 1 <= gsize)
				y(n) = y(n) + f(k) * g(n - k + 1);
			end
		endfor
	endfor
end

