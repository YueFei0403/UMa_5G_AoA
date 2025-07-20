clc;
clear all;
close all;

%% === Configure CSI-RS Resources  ===
carrier = nrCarrierConfig;
carrier.NSizeGrid = 1; % Bandwidth in RB
carrier.SubcarrierSpacing = 15;
carrier.CyclicPrefix = 'Normal';
ofdmInfo = nrOFDMInfo(carrier);
K = carrier.NSizeGrid * 12;
simParams.NumTx = 1;
simParams.NumRx = 8;
simParams.NumDU = 4;
totalNumScatMIMOChannels = 20;
MCTrials = 5000;
serveRadius = 500;

beta = 0;
for iTrial=1:MCTrials
    % Configure transmitter/receiver/Scatterers positions
    ichannel = randi([1 totalNumScatMIMOChannels]);

    beta_currNetwork = 0;
    for DUIdx = 1:simParams.NumDU
        chanFileName = fullfile("MultiDUChannelModels",sprintf("R%d-Chan%d-DU%d.mat",serveRadius,ichannel,DUIdx));
        file = java.io.File(chanFileName);
        if file.isAbsolute()
          fullpath = chanFileName;
        else
          fullpath = char(file.getCanonicalPath());
        end
        chanModel = load(fullpath);
        channel = chanModel.channel;
        [~,pathGains,~] = channel(complex(randn(ofdmInfo.SampleRate*1e-3,simParams.NumTx), ...
            randn(ofdmInfo.SampleRate*1e-3,simParams.NumTx)));
    
        pathGains = reshape(pathGains,simParams.NumRx,[]);
        pg = pathGains*pathGains';
        beta_currNetwork = beta_currNetwork + pg(1);
    end
    beta_currNetwork = beta_currNetwork / simParams.NumDU;
    beta = beta + beta_currNetwork;
end

beta = beta / MCTrials;
disp(beta)