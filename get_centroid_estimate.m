function p = get_centroid_estimate(t_hori, t_vert,centroids_list)
% t_hori the t value horizontally
% @param t_vert the t value vertically
% @param imgs a matrix representation of images
% @version 5.1.2018
% generates a matrix with the slopes and intercepts relating t values to 
% centroids of the images

% centroids_list = get_centroids(imgs);
bz = glmfit(t_vert,centroids_list(:,2));
by = glmfit(t_hori,centroids_list(:,1));
p.bz = bz;
p.by = by;
end