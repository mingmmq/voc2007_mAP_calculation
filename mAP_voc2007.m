function mAP_voc2007

% change this path if you install the VOC code elsewhere
addpath([cd '/VOCcode']);

% initialize VOC options
VOCinit;

mAP = 0.0

% train and test detector for each class
for i=1:VOCopts.nclasses
    cls=VOCopts.classes{i};
    % detector=train(VOCopts,cls);                            % train detector
    % test(VOCopts,cls,detector);                             % test detector
    [recall,prec,ap]=VOCevaldet(VOCopts,'comp4',cls,true);  % compute and display PR
    
    
    
    if i<VOCopts.nclasses
        fprintf('press any key to continue with next class...\n');
        drawnow;
        %% if we want check the image, then we can pause
        
        % pause;
    end
    
    mAP = mAP + ap / 20
end