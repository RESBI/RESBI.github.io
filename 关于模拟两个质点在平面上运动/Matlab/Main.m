%配置建议:RAM大于等于8GB

G = 6.67259e-11;
delta_t = 1;

totalTime = 10e6;
rools = totalTime / delta_t;

Recording_v_XA = 1:rools;
Recording_v_YA = 1:rools;

Recording_v_XB = 1:rools;
Recording_v_YB = 1:rools;

Recording_X_A = 1:rools;
Recording_Y_A = 1:rools;

Recording_X_B = 1:rools;
Recording_Y_B = 1:rools;

Recording_v_A = 1:rools;
Recording_v_B = 1:rools;

X_A = 0;
Y_A = 0;

X_B = 0;
Y_B = 384403.9e3;

v_XA = 0;%-12.6;
v_YA = 0;

v_XB = 1023; %1.023e3 m/s
v_YB = 0;

M_A = 5.965e24; %Earth
M_B = 7.349e22; %Luna

for rool = 1:rools
    R = sqrt((X_A - X_B)^2 + (Y_A - Y_B)^2);
    F = G * (M_A * M_B) / R^2;
    
    F_XA = F * ((X_B - X_A) / R);
    F_YA = F * ((Y_B - Y_A) / R);
    
    F_XB = -F_XA;
    F_YB = -F_YA;
    
    a_XA = F_XA / M_A;
    a_YA = F_YA / M_A;
    
    a_XB = F_XB / M_B;
    a_YB = F_YB / M_B;
    
    %Caculating the changed data.
    delta_X_A = (delta_t * v_XA) + ((delta_t^2) * a_XA)/2;
    delta_Y_A = (delta_t * v_YA) + ((delta_t^2) * a_YA)/2;
    
    delta_X_B = (delta_t * v_XB) + ((delta_t^2) * a_XB)/2;
    delta_Y_B = (delta_t * v_YB) + ((delta_t^2) * a_YB)/2;
    
    X_A = X_A + delta_X_A;
    Y_A = Y_A + delta_Y_A;
    
    X_B = X_B + delta_X_B;
    Y_B = Y_B + delta_Y_B;
    
    v_XA = v_XA + (delta_t * a_XA);
    v_YA = v_YA + (delta_t * a_YA);
    
    v_XB = v_XB + (delta_t * a_XB);
    v_YB = v_YB + (delta_t * a_YB);
    
    %Record the data.
    Recording_v_XA(rool) = v_XA;
    Recording_v_YA(rool) = v_YA;

    Recording_v_XB(rool) = v_XB;
    Recording_v_YB(rool) = v_YB;

    Recording_X_A(rool) = X_A;
    Recording_Y_A(rool) = Y_A;

    Recording_X_B(rool) = X_B;
    Recording_Y_B(rool) = Y_B;
    
    Recording_v_A(rool) = sqrt(v_XA^2 + v_YA^2);
    Recording_v_B(rool) = sqrt(v_XB^2 + v_YB^2);
end
plot(Recording_X_B,Recording_Y_B,Recording_X_A,Recording_Y_A);
%xlabel("x/m")
%ylabel("y/m")
%ylabel("v/(m/s)")
%xlabel("t/s")
max(Recording_v_XA)
min(Recording_v_XA)

max(Recording_v_YA)
min(Recording_v_YA)

max(Recording_v_YB)
min(Recording_v_YB)

max(Recording_v_XB)
min(Recording_v_XB)
%plot(1:totalTime, Recording_v_YA, 1:totalTime, Recording_v_XA)
%plot(1:totalTime, Recording_v_YB, 1:totalTime, Recording_v_XB)