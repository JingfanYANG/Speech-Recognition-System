
function [seg1_start,seg1_end] = get_seg(file_name)

[s,e] = end_point_dect(file_name);       % get start point and end point
[Y,FS]=audioread(file_name);
seg1_start=(s+e)/2;     %expressed in length
seg1_end=seg1_start+0.02*FS;

plot(Y,'Color','blue');
hold on;
line([s s], [-0.25 0.25], 'Color', 'red','LineWidth', 1); 
line([e e], [-0.25 0.25], 'Color', 'red','LineWidth', 1);
line([seg1_start seg1_start], [-0.25 0.25], 'Color', 'black','LineWidth', 1); 
line([seg1_end seg1_end], [-0.25 0.25], 'Color', 'black','LineWidth', 1);
txt1 = 'T1';
text(s,-0.25,txt1,'FontSize',20,'Color','r')
txt2 = 'T2';
text(e,-0.25,txt2,'FontSize',20,'Color','r')

end