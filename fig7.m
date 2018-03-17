load('Gauss_ill_3D.mat');
ga_ill_3D0=intensity; % ga_ill_3D0 is the 3D psf of Gaussian illumination beam
ga_ill_3D0=ga_ill_3D0./max(max(max(ga_ill_3D0)));%normalize

for i=1:60
    for j=1:60
        for k=1:60
         ga_ill_3D(k,j,i)= ga_ill_3D0(i,j,k); 
        end
    end
end

load('phasemodulated_ill_3D.mat');
pm_ill_3D0=intensity;% pm_ill_3D0 is the 3D psf of phase-modulated radially polarized illumination beam
pm_ill_3D0=pm_ill_3D0./max(max(max(pm_ill_3D0)));% normalize

for i=1:60
    for j=1:60
        for k=1:60
         pm_ill_3D(k,j,i)= pm_ill_3D0(i,j,k); 
        end
    end
end


for i=1:60
    for j=1:60
           ga_ill_yz(i,j)=ga_ill_3D(i,j,31); % ga_ill_yz is the Gaussian illumination PSF in the yz plane
           pm_ill_yz(i,j)=pm_ill_3D(i,j,31); % pm_ill_yz is the phase-modulated illumination PSF in the yz plane
    end
end

%% draw  the PSF of illumination beam in yz plane
figure(7),
subplot(1,2,1,'replace');
subplot('position',[0.1    0.08    0.3347    0.85]);
imagesc(ga_ill_yz);
set(gca,'XTick',[1:29.5:60]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:29.5:60]);
set(gca,'YTickLabel',{'-30','0','30'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

subplot(1,2,2,'replace');
subplot('position',[0.55    0.08    0.3347    0.85]);
imagesc(pm_ill_yz);
set(gca,'XTick',[1:29.5:60]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:29.5:60]);
set(gca,'YTickLabel',{'-30','0','30'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

colormap('hot');
colorbar('position',[0.92 0.1 0.03 0.8]);
set(gcf,'unit','centimeters','position',[10,4,12,14]);