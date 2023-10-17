function A = cat(dim, varargin)
N = numel(varargin); % # of matrices
if N == 0
    error('使用格式： A = cat(维度, A1, A2, ...)');
end
sz = size(varargin{1}); % size of A
Ndim = numel(sz); % max dim ever needed
if dim > Ndim
    sz = [sz ones(1, dim-Ndim)];
    Ndim = dim;
end
sz_dim = zeros(1, N); % size(varargin{i}, dim)
sz_dim(1) = sz(dim);
for i = 2:N
    nd = ndims(varargin{i});
    if nd > Ndim
        error(['第 ' num2str(i) ' 个矩阵维数过大：' num2str(nd) ' > ' num2str(Ndim)]);
    end
    sz_dim(i) = size(varargin{i}, dim);
    for j = 1:Ndim
        if j ~= dim && size(varargin{i}, j) ~= sz(j)
            error(['第 ' num2str(i) ' 个矩阵的第 ' num2str(j) ' 维长度不符!']);
        end
    end
end
sz(dim) = sum(sz_dim);
A = zeros(sz);

% construct command string to eval()
% e.g. "A(:,:,ind:ind+n-1) = varargin{i};"
cmd = "A(";
for i = 1:Ndim
    if i > 1
        cmd = cmd + ",";
    end
    if i == dim
        cmd = cmd + "ind:ind+n-1";
    else
        cmd = cmd + ":";
    end
end
cmd = cmd + ") = varargin{i};";

% copy values
ind = 1;
for i = 1:N
    n = sz_dim(i);
    eval(cmd);
    ind = ind + n;
end
end
