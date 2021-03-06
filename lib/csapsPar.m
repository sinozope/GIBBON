function p=csapsPar(varargin)

switch nargin
    case 1
        V=varargin{1};
        pw=1/1.1;
    case 2
        V=varargin{1};
        pw=varargin{2};
end

%%

% The interesting range for p is close to 1./(1+((h.^3)/6)). The following
% form is used introducing the factor f: p=1./(1+(((h.^3)/6)*f)). By using
% f=10 we obtain p=1./(1+((h.^3)/60)) which should result in a close
% following of the data. If instead f=0.1 is used, leading to
% p=1./(1+((h.^3)/0.6)), a smoother result is obtained.

%%
if pw<0
    pw=0;
end

if pw>1
    pw=1;
end

%%
f=(1/pw)-1;

%Calculate point spacings
hVec=sqrt(sum(diff(V,1,1).^2,2));
h=mean(hVec(:)); %Average point spacing

%Estimate smoothening parameter based on f and point spacing
p=1./(1+(((h.^3)/6)*f));

