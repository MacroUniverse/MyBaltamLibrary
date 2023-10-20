function B = shiftdim(A, n)
if nargin == 0 && nargin > 2
    error('格式：shiftdim(A) 或 shiftdim(A, n)');
end
sz = size(A);
Ndim = numel(sz);
if Ndim == 2 && sz(2) == 1
    Ndim = 1; sz = sz(1);
end
if nargin == 1
    for i = 1:Ndim
        if sz(i) ~= 1
            n = i-1; break;
        end
    end
end
if n < 0, error('not implemented yet!'); end
n = mod(n, Ndim);
if n == 0 || n == Ndim || numel(A) == 0 || Ndim == 1
    B = A; return;
end
sz_new = [sz(n+1:end) sz(1:n)];
B = zeros(sz_new);

% construct command for eval().
% e.g. when Ndim==4, n==2:
% for i2=1:sz(2), for i3=1:sz(3), for i4 = 1:sz(4)
%     B(i3,i4,:,i2) = A(:,i2,i3,i4);
% end,end,end

cmd = "";
for i = 2:Ndim
    cmd = cmd + "for i" + i + "=1:sz(" + i + "), ";
end

cmd = cmd + "B(";
for i = 1+n:Ndim
    cmd = cmd + "i" + i + ",";
end
cmd = cmd + ":";
for i = 2:n
    cmd = cmd + ",i" + i;
end

cmd = cmd + ") = A(:";
for i = 2:Ndim
    cmd = cmd + ",i" + i;
end
cmd = cmd + "); ";

cmd = cmd + "end";
for i = 3:Ndim
    cmd = cmd + ",end";
end

eval(cmd);
end
