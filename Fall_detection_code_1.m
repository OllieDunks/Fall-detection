
%%
%Code for collecting points from images and then put into a table so they
%can be used in the classification learner. 
clc;

%%
%Storing the images from the files into the workspace.
filename = fullfile('C:\Users\enqui\OneDrive\Documents\MATLAB\3rd year\Project\Fall_detection');
imds = imageDatastore('Fall_detection', 'LabelSource', 'foldernames', 'IncludeSubfolders',true);

%Counting the number of images under "No Fall" and "Fall".
tbl = countEachLabel(imds)

%%
%Determining the point of the images and setting the size to 500 points per
%image so it isn't time consuming.
bag = bagOfFeatures(imds,'VocabularySize',1000,'PointSelection','Detector');
imagefeatures = encode(bag,imds);

%%
%Putting the data points into a table and adding a column in the table with
%the names of each whether the image is a fall or not.
Falldata = array2table(imagefeatures);
Falldata.Labels = imds.Labels;   

%%
%
%
filename1 = fullfile('C:\Users\enqui\OneDrive\Documents\MATLAB\3rd year\Project\Face ID');
imds1 = imageDatastore('Face ID', 'LabelSource', 'foldernames', 'IncludeSubfolders',true);

%Counting the number of images under "No Fall" and "Fall".
tbl = countEachLabel(imds1)

%%
%Determining the point of the images and setting the size to 500 points per
%image so it isn't time consuming.
bag1 = bagOfFeatures(imds1,'VocabularySize',1000,'PointSelection','Detector');
imagefeatures1 = encode(bag1,imds1);

%%
%Putting the data points into a table and adding a column in the table with
%the names of each whether the image is a fall or not.
Facedata = array2table(imagefeatures1);
Facedata.Labels = imds1.Labels;  

