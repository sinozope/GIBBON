function [AB]=vectorTensorProductArray(a,b)

%% 

%Determine multiplication order
if size(a,2)==3 %type B*A
   B=a;
   A=b;
   multType='post';
else %type A*B
    B=b;
    A=a; 
    multType='pre';
end

%Perform product
switch multType
    case 'pre' %type A*B
        %  A1_1*B1 + A1_2*B2 + A1_3*B3
        %  A2_1*B1 + A2_2*B2 + A2_3*B3
        %  A3_1*B1 + A3_2*B2 + A3_3*B3
        AB=[A(:,1).*B(:,1)+A(:,4).*B(:,2)+A(:,7).*B(:,3) ...
            A(:,2).*B(:,1)+A(:,5).*B(:,2)+A(:,8).*B(:,3) ...
            A(:,3).*B(:,1)+A(:,6).*B(:,2)+A(:,9).*B(:,3)];
    case 'post' %type B*A
        %  A1_1*B1 + A1_2*B2 + A1_3*B3
        %  A2_1*B1 + A2_2*B2 + A2_3*B3
        %  A3_1*B1 + A3_2*B2 + A3_3*B3
        AB=[A(:,1).*B(:,1)+A(:,2).*B(:,2)+A(:,3).*B(:,3) ...
            A(:,4).*B(:,1)+A(:,5).*B(:,2)+A(:,6).*B(:,3) ...
            A(:,7).*B(:,1)+A(:,8).*B(:,2)+A(:,9).*B(:,3)];
end

