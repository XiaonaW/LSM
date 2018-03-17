clc;clear;
%% SIM lightsheet！！this part is the same as that in 'fig3b.m'
load('phasemodulated_ill_xz.mat');
psf_pm=intensity;
psf_pm=psf_pm./max(max(psf_pm));
for i=1:91
    for j=1:330
        if (i-46)^2+(j-20)^2<=4^2
             z(j,i)=1;
        else
            if (i-46)^2+(j-62)^2<=4^2
              z(j,i)=1;
            else
             if (i-46)^2+(j-108)^2<=4^2
               z(j,i)=1;
             else
                if (i-46)^2+(j-150)^2<=4^2
                    z(j,i)=1;
                else
                      if (i-46)^2+(j-192)^2<=4^2
                      z(j,i)=1;
                       else
                      if (i-46)^2+(j-236)^2<=4^2
                   z(j,i)=1;
                      else
                      if (i-46)^2+(j-278)^2<=4^2
                        z(j,i)=1;
                      else
                      if (i-46)^2+(j-320)^2<=4^2
                       z(j,i)=1;
                      else                    
                
                   z(j,i)=0;             
             end
                     end
              end
            
            end
        end
    end
            end
        end
    end
end
SIM_LS0=conv2(z,psf_pm,'same');

for i=1:330
    for j=1:91
        SIM_LS(j,i)=SIM_LS0(i,j);
    end
end
SIM_LS=SIM_LS./max(max(SIM_LS));

%% Gaussian lightsheet！！this part is the same as that in 'fig3b.m'
load('Gaussian_ill_xz.mat');
pfs_g=intensity;
pfs_g=pfs_g./max(max(pfs_g));

for i=1:91
    for j=1:330
        if i==46
            z1(i,j)=1;
        else
            z1(i,j)=0;
        end
    end
end
Gauss_LS=conv2(z1,pfs_g,'same');
Gauss_LS=Gauss_LS./max(max(Gauss_LS));

%% detection
load('detection.mat');
h_det0=intensity; %h_det0 is the 3D psf of detection 
h_det0=h_det0./max(max(max(h_det0))); %nomralize
for i=1:91
    for j=1:91
        for k=1:91
            h_det(k,j,i)=h_det0(i,j,k);
        end
    end
end


%h_det(:,:,46)is the psf of detection in the xz plane
psf_g_overall=Gauss_LS(:,63:153).*h_det(:,:,46);
% psf_g_overall is the overall psf of Gauss lightsheet system in xz plane
psf_pm_overall=SIM_LS(:,63:153).*h_det(:,:,46);
% psf_pm_overall is the overall psf of SIM lightsheet system in xz plane

%% draw
figure(33),
subplot(2,1,1,'replace');
subplot('position',[0.11    0.5838    0.65   0.3412]);
imagesc(psf_g_overall);
set(gca,'XTick',[1:45:91]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

subplot(2,1,2,'replace');
subplot('position',[0.11    0.1100    0.65   0.3412]);
imagesc(psf_pm_overall);
set(gca,'XTick',[1:45:91]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

colormap('jet');
colorbar('position',[0.85 0.1 0.04 0.8]);
set(gcf,'unit','centimeters','position',[10,4,9.5,14]);