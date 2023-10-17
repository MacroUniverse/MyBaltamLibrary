function A = cat(dim, varargin)
N = numel(varargin);
if N == 0
    error('使用格式： A = cat(维度, A1, A2, ...)');
end
sz = size(varargin{1});
Ndim = max(dim, ndims(varargin{1}));
len_dim = size(varargin{1}, dim);
for i = 2:N
    nd = ndims(varargin{i});
    Ndim = max(Ndim, nd);
    for j = 1:Ndim
        if j == dim
            len_dim = len_dim + size(varargin{i}, dim);
        elseif size(varargin{i}, j) ~= sz(j)
            error(['第 ' num2str(i) ' 个矩阵的第 ' num2str(j) ' 维长度不符!']);
        end
    end
end
sz(dim) = len_dim;
sz(sz == 0) = 1;
A = zeros(sz);
ind = 1;

if Ndim == 2
    if dim == 1
        for i = 1:N
            n = size(varargin{i}, dim);
            A(ind:ind+n-1, :) = varargin{i};
            ind = ind + n;
        end
	elseif dim == 2
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, ind:ind+n-1) = varargin{i};
            ind = ind + n;
        end
    end
elseif Ndim == 3
    if dim == 1
        for i = 1:N
            n = size(varargin{i}, dim);
            A(ind:ind+n-1, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 2
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, ind:ind+n-1, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 3
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, ind:ind+n-1) = varargin{i};
            ind = ind + n;
        end
    end
elseif Ndim == 4
    if dim == 1
        for i = 1:N
            n = size(varargin{i}, dim);
            A(ind:ind+n-1, :, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 2
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, ind:ind+n-1, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 3
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, ind:ind+n-1, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 4
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, :, ind:ind+n-1) = varargin{i};
            ind = ind + n;
        end
    end
elseif Ndim == 5
    if dim == 1
        for i = 1:N
            n = size(varargin{i}, dim);
            A(ind:ind+n-1, :, :, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 2
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, ind:ind+n-1, :, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 3
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, ind:ind+n-1, :, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 4
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, :, ind:ind+n-1, :) = varargin{i};
            ind = ind + n;
        end
    elseif dim == 5
        for i = 1:N
            n = size(varargin{i}, dim);
            A(:, :, :, :, ind:ind+n-1) = varargin{i};
            ind = ind + n;
        end
    end
else
    error('暂时还不支持 6 维及以上的数组（TODO: 可以用 eval 实现）.');
end
end
