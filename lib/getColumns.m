function [varargout]=getColumns(V)

% function [varargout]=getColumns(V)
% ------------------------------------------------------------------------
% This function simply outputs each colum in V as a seperate vector. For
% instance if V represents 3 colums of data e.g. X, Y and Z coordinates
% then one could use [X,Y,Z]=getColumns(V);
%
%
% Kevin Mattheus Moerman
% kevinmoerman@hotmail.com
% 2013/13/08
%------------------------------------------------------------------------
varargout = mat2cell(V,size(V,1),ones(size(V,2),1));


