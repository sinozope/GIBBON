function docNode=addOutputLevel_FEB_v1p2(docNode,FEB_struct)

disp('Adding Output level')

febio_spec = docNode.getDocumentElement;

ElementAddNode = docNode.createElement('Output');
febio_spec.appendChild(ElementAddNode);
OUTPUTNode = docNode.getElementsByTagName('Output').item(0);

%% Adding plotfile field
disp('----> Adding plotfile field')

parent_node = docNode.createElement('plotfile');
parent_node = OUTPUTNode.appendChild(parent_node);
parent_node.setAttribute('type','febio');

if ~isfield(FEB_struct,'Output')
    FEB_struct.Output.VarTypes={'displacement','stress','relative volume'}; %DEFAULT
end

% Adding Output requests
if isfield(FEB_struct,'Output');
    for q=1:1:numel(FEB_struct.Output.VarTypes)
        var_node = docNode.createElement('var'); %create entry
        var_node = parent_node.appendChild(var_node); %add entry
        var_node.setAttribute('type',FEB_struct.Output.VarTypes{q}); %add attribute
    end
end
%% Adding logfile field

if isfield(FEB_struct,'run_output_names')
    
    disp('----> Adding logfile field')
    
    %Adding logfile level
    logfile_node = docNode.createElement('logfile');
    logfile_node = OUTPUTNode.appendChild(logfile_node);
    
    % FEB_struct.run_filename,FEB_struct.run_filename,FEB_struct.run_output_names,FEB_struct.output_types,FEB_struct.data_types
    % (filename,savename,logfile_names,output_types,data_types)
    
    %Adding output requests
    output_types=FEB_struct.output_types;
    logfile_names=FEB_struct.run_output_names;
    data_types=FEB_struct.data_types;
    
    if ~iscell(output_types)
        output_types={output_types};
        logfile_names={logfile_names};
        data_types={data_types};
    end
    
    for q=1:1:numel(output_types)
        
        output_type=output_types{q};
        logfile_name=logfile_names{q};
        data_type=data_types{q};
        
        %Adding output_type level
        output_type_node = docNode.createElement(output_type);
        logfile_node.appendChild(output_type_node);
        
        %Adding output_type attribute data_type
        attr = docNode.createAttribute('data');
        attr.setNodeValue(data_type);
        output_type_node.setAttributeNode(attr);
        
        %Adding output_type attribute logfile_name
        attr = docNode.createAttribute('file');
        attr.setNodeValue(logfile_name);
        output_type_node.setAttributeNode(attr);
        
        %Adding output_type attribute delim
        attr = docNode.createAttribute('delim');
        attr.setNodeValue(', ');
        output_type_node.setAttributeNode(attr);
        
    end
end