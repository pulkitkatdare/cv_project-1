
t_1 = [vp_candidates(1),vp_candidates(2),vp_candidates(3)];
t_2 = [vp_candidates(1),vp_candidates(2),vp_candidates(10)];

%orthogonality_criteria(t_2(1),t_2(2),t_2(3),intn_pts,size_im,lines)
i = vp_candidates(1);
j = vp_candidates(2);
k = vp_candidates(10);

%{
list = [[i,j,k]',zeros(3,1)];
n = 0;
for t = 1:3
    if(intn_pts(list(t,1),2)==inf)
        n = n+1;
        list(t,2) = 1;
    end
end    
%}

m1 = (intn_pts(i,2)-intn_pts(j,2))/(intn_pts(i,1)-intn_pts(j,1)); %slope between i&j
m2 = -1/m1; %slope of perpendicular from k


x = (intn_pts(k,2)-intn_pts(j,2)+m1*intn_pts(j,1)-m2*intn_pts(k,1))/(m1-m2);
y = m1*(x-intn_pts(j,1))+intn_pts(j,2);
p = [x,y];


%{.
figure(1), hold off, imshow(grayIm)
figure(1), hold on, plot([intn_pts(i,1),intn_pts(j,1),intn_pts(k,1),x],...
    [intn_pts(i,2),intn_pts(j,2),intn_pts(k,2),y],'o')
figure(1), hold on, plot([intn_pts(i,1);intn_pts(j,1)],[intn_pts(i,2);...
    m1*(intn_pts(j,1)-intn_pts(i,1))+intn_pts(i,2)],'r')
x_range = [intn_pts([i,j,k],1),intn_pts([i,j,k],2)];
axis([min(0,min(x_range(:,1))) max(size_im(1),max(x_range(:,1))) ...
    min(0,min(x_range(:,2))) max(size_im(2),max(x_range(:,2)))])
figure(1), hold on, plot([intn_pts(k,1);...
    10*intn_pts(j,1)],[intn_pts(k,2);...
    -1/m1*(10*intn_pts(j,1)-intn_pts(k,1))+intn_pts(k,2)],'b')
%pause
%}

m1 = (intn_pts(i,2)-intn_pts(k,2))/(intn_pts(i,1)-intn_pts(k,1));%slope between i&k
m_2 = -1/m1; % slope of perpendicular from j

x_r = (intn_pts(k,2)-intn_pts(j,2)+m_2*intn_pts(j,1)-m2*intn_pts(k,1))/(m_2-m2);
y_r = m_2*(x-intn_pts(j,1))+intn_pts(j,2);
o = [x_r,y_r]; % o is the orthocenter of triangle ijk

figure(1), hold on, plot([intn_pts(i,1);intn_pts(k,1)],[intn_pts(i,2);...
    m1*(intn_pts(k,1)-intn_pts(i,1))+intn_pts(i,2)],'r')
figure(1), hold on, plot([intn_pts(j,1);55],[intn_pts(j,2);...
    -1/m1*(55-intn_pts(j,1))+intn_pts(j,2)],'b')
figure(1), hold on, plot(x_r,y_r,'bo')
x_range = [x_range;x,y;x_r,y_r];
axis([min(0,min(x_range(:,1))) max(size_im(1),max(x_range(:,1))) ...
    min(0,min(x_range(:,2))) max(size_im(2),max(x_range(:,2)))])

th = 0:pi/50:2*pi;
xunit = 10000 * cos(th) + x_r;
yunit = 10000 * sin(th) + y_r;
figure(1), hold on, plot(xunit, yunit);
