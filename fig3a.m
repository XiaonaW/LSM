clc;clear;
%
load('Gaussian_ill_xz.mat');
psf_g=intensity; %psf_g is the psf of Gaussian beam in the xz plane
psf_g=psf_g./max(max(psf_g));%normalize

load('phasemodulated_ill_xz.mat');
psf_pm0=intensity; %psf_pm0 is the psf of phase-modulated radially polarized beam in the xz plane
psf_pm0=psf_pm0./max(max(psf_pm0));%normalize


for i=1:91
    for j=1:91
        psf_pm(j,i)=psf_pm0(i,j);
    end
end
%% draw figure 3a

figure(31),
subplot(2,1,1,'replace');
subplot('position',[0.11    0.5838    0.65   0.3412]);
imagesc(psf_g);
set(gca,'XTick',[1:45:91]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

subplot(2,1,2,'replace');
subplot('position',[0.11    0.1100    0.65   0.3412]);
imagesc(psf_pm);
set(gca,'XTick',[1:45:91]);
set(gca,'XTickLabel',{'-6','0','6'});
set(gca,'YTick',[1:45:91]);
set(gca,'YTickLabel',{'-6','0','6'});
xlabel('x axis/ \lambda');
ylabel('z axis/ \lambda');

colormap('jet');
colorbar('position',[0.85 0.1 0.04 0.8]);
set(gcf,'unit','centimeters','position',[10,4,9.5,14]);



