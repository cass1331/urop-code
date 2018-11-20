function centroids_list = get_centroids(imgs)
%  imgs a matrix representation of images
%  5.1.2018
% takes matrix of images and outputs their centroids

% for i = 1:1000
%     image = imgs(:,:,i);
%     image(image==127)=0;
%     imgs(:,:,i) = image;
% end
nrImages = size(imgs,3);
centroids_list = nan(nrImages,2);
for i = 1:nrImages
    s  = regionprops(imgs(:,:,i), 'centroid');
    centroids = cat(1, s.Centroid);
    cmean = mean(centroids,'omitnan');
    centroids_list(i,1) = cmean(1);
    centroids_list(i,2) = cmean(2);
end