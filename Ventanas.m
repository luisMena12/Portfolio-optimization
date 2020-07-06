%function[datesediaogk]=Ventanas(matrix)
windowsize=800;
dates=1110;
i=1;
assets=5;
while(i<= dates-windowsize)
    muestra=matrix(i:i+(windowsize-1),:);
    covogk = robustcov(datesuestra,'Method','ogk');
    covoh = robustcov(datesuestra,'Method','olivehawkins');
    covrobust = robustcov(datesuestra);
    covnormal = cov(datesuestra);
    Aeq= ones(1,assets);
    beq= 1;
    lb= zeros(assets,1);
    ub=ones(assets,1);
    f=[];
    A=[];
    b=[];
    resultadoogk=quadprog(covogk,f,A,b,Aeq,beq,lb,ub);
    resultadooh=quadprog(covoh,f,A,b,Aeq,beq,lb,ub);
    resultadorobustadefault=quadprog(datesetodo3,f,A,b,Aeq,beq,lb,ub);
    resultadocov=quadprog(covnormal,f,A,b,Aeq,beq,lb,ub);
    
    Wogk(i,:)=resultadoogk'
    Woh(i,:)=resultadooh'
    WFdatesCD(i,:)=resultadorobustadefault'
    Wcov(i,:)=resultadocov'
    
    matrixs=matrix(i+windowsize,:);
    datesatriz1(i)=matrixs*resultadoogk;
    datesatriz2(i)=matrixs*resultadooh;
    datesatriz3(i)=matrixs*resultadorobustadefault;
    datesatriz4(i)=matrixs*resultadocov;
    
    i=i+1;
end
datesediaogk = datesean(datesatriz1);
    datesediaoh = datesean(datesatriz2);
    datesediadefault = datesean(datesatriz3);
    datesediacov=datesean(datesatriz4);
    stdogk = std(datesatriz1);
    stdoh = std(datesatriz2);
    stddefault = std(datesatriz3);
    stdcov = std(datesatriz4);
    sharpogk = datesediaogk/stdogk
    sharpoh = datesediaoh/stdoh
    sharpdefault = datesediadefault/stddefault
    sharpcov = datesediacov/stdcov
    
   
    plot(datesatriz1)
    hold on 
    plot(datesatriz2)
    plot(datesatriz3)
    plot(datesatriz4)