function video_path = choose_video(base_path)%������Ͽɷ�װ
%����Ϊ�ļ��е�λ��
% video_path = choose_video(base_path)

%process path to make sure it's uniformʹ·����ʽͳһ
if ispc(), base_path = strrep(base_path, '\', '/'); end
if base_path(end) ~= '/', base_path(end+1) = '/'; end

%list all sub-folders
contents = dir(base_path);
names = {};
for k = 1:numel(contents),
    name = contents(k).name;
    if isdir([base_path name]) && ~strcmp(name, '.') && ~strcmp(name, '..'),
        names{end+1} = name;  %#ok
    end
end

%no sub-folders foundû�з������ļ���
if isempty(names), video_path = []; return; end

%choice GUI
choice = listdlg('ListString',names, 'Name','Choose video', 'SelectionMode','single');

if isempty(choice),  %user cancelled
    video_path = [];
else
    video_path = [base_path names{choice} '/'];
end

end

