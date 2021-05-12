function [seq] = mSeq(R,key)
% mSeq m序列生成
% R: 寄存器个数
% key: 特征多项式，是8进制表示的整数
key = dec2bin(oct2dec(key));
key = key(end:-1:1);    key = key(2:end);
gate = str2num(key.');  gate = gate.';  % 抽头系数
D = ones(1,R);  % 寄存器,初始状态全为1
N = 2^R - 1;
seq = zeros(1,N);
for n = 1:N
    temp = mod(sum(D .* gate),2);   % 模二加
    seq(n) = D(R);
    D = circshift(D,1); % 移位
    D(1) = temp;
end

end
