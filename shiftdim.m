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
n = mod(n, Ndim);
if n == 0 || n == Ndim || numel(A) == 0 || Ndim == 1
    B = A; return;
end
sz_new = [sz(n+1:end) sz(1:n)];
B = zeros(sz_new);

if Ndim == 2 && n == 1
    for i2 = 1:sz(2)
        B(i2,:) = A(:,i2);
    end
elseif Ndim == 3
    if n == 1
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                B(i2,i3,:) = A(:,i2,i3);
            end
        end
    elseif n == 2
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                B(i3,:,i2) = A(:,i2,i3);
            end
        end
    end
elseif Ndim == 4
    if n == 1
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    B(i2,i3,i4,:) = A(:,i2,i3,i4);
                end
            end
        end
    elseif n == 2
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    B(i3,i4,:,i2) = A(:,i2,i3,i4);
                end
            end
        end
    elseif n == 3
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    B(i4,:,i2,i3) = A(:,i2,i3,i4);
                end
            end
        end
    end
elseif Ndim == 5
    if n == 1
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    for i5 = 1:sz(5)
                        B(i2,i3,i4,i5,:) = A(:,i2,i3,i4,i5);
                    end
                end
            end
        end
    elseif n == 2
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    for i5 = 1:sz(5)
                        B(i3,i4,i5,:,i2) = A(:,i2,i3,i4,i5);
                    end
                end
            end
        end
    elseif n == 3
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    for i5 = 1:sz(5)
                        B(i4,i5,:,i2,i3) = A(:,i2,i3,i4,i5);
                    end
                end
            end
        end
    elseif n == 4
        for i2 = 1:sz(2)
            for i3 = 1:sz(3)
                for i4 = 1:sz(4)
                    for i5 = 1:sz(5)
                        B(i5,:,i2,i3,i4) = A(:,i2,i3,i4,i5);
                    end
                end
            end
        end
    end
else
    error('shiftdim 函数暂不支持 6 维或以上数组。');
end
end
