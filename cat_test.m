function cat_test
dim = 2;
A1 = rand(2,3,2); A2 = rand(2,3,2);

A = cat(1, A1, A2);
if ~isequal(A(1:2,:,:), A1) || ~isequal(A(3:4,:,:), A2)
    error('failed!');
end
    
A = cat(2, A1, A2);
if ~isequal(A(:,1:3,:), A1) || ~isequal(A(:,4:6,:), A2)
    error('failed!');
end

A = cat(3, A1, A2);
if ~isequal(A(:,:,1:2), A1) || ~isequal(A(:,:,3:4), A2)
    error('failed!');
end

A = cat(4, A1, A2);
if ~isequal(A(:,:,:,1), A1) || ~isequal(A(:,:,:,2), A2)
    error('failed!');
end

A = cat(5, A1, A2);
if ~isequal(A(:,:,:,:,1), A1) || ~isequal(A(:,:,:,:,2), A2)
    error('failed!');
end

end
