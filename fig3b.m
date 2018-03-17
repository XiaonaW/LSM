clc;clear;
%% SIM lightsheet
load('phasemodulated_ill_xz.mat');
psf_pm=intensity;%psf_pm is the psf of phase-modulated radially polarized beam
psf_pm=psf_pm./max(max(psf_pm)); %normalize
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
SIM_LS0=conv2(z,psf_pm,'same');% calculate the psf of the SIM light sheet

for i=1:330
    for j=1:91
        SIM_LS(j,i)=SIM_LS0(i,j);%SIM_LS is the psf of SIM lightsheet in xz plane
    end
end
SIM_LS=SIM_LS./max(max(SIM_LS)); %normalize

%% Gaussian lightsheet
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
Gauss_LS=conv2(z1,pfs_g,'same');%Gauss_LS is the psf of Gaussian lightsheet in xz plane
Gauss_LS=Gauss_LS./max(max(Gauss_LS));%normalize

%% draw figure 3(b)

figure(31),
subplot(2,1,1,'replace');
subplot('position',[0.1    0.5838    0.7   0.3412]);
imagesc(Gauss_LS(:,6:305));
set(gca,'XTick',[1:45:300]);
set(gca,'XTickLabel',{'0','6','12','18','24','30','36'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

subplot(2,1,2,'replace');
subplot('position',[0.1    0.1100    0.7   0.3412]);
imagesc(SIM_LS(:,6:305));
set(gca,'XTick',[1:45:300]);
set(gca,'XTickLabel',{'0','6','12','18','24','30','36'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

colormap('jet');
colorbar('position',[0.85 0.1 0.03 0.8]);
set(gcf,'unit','centimeters','position',[10,4,10,14]);