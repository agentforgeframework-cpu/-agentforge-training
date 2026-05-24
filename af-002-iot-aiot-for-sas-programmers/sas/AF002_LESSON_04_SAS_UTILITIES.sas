* AF-002 Lesson 04 Utility Snippets ;

data spatial_telemetry;
    infile datalines dlm=',';
    input frame_number object_type $ x1 y1 x2 y2 confidence;
    center_x = (x1 + x2) / 2;
    center_y = (y1 + y2) / 2;
    width    = x2 - x1;
    height   = y2 - y1;

    if center_x between 400 and 700
       and center_y between 150 and 350 then region='RESTRICTED';
    else region='GENERAL';

datalines;
1,person,420,170,520,340,.94
2,forklift,100,210,290,390,.88
;
run;

proc freq data=spatial_telemetry;
    tables object_type*region;
run;