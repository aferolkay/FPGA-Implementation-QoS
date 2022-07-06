% base_foto=imread('base_frame.png');
% base_foto(481,:,:)= []; %removing the final extra row
% 
% R = base_foto(:,:,1);
% G = base_foto(:,:,2);
% B = base_foto(:,:,3);
% 
% 
% for i= 1:480
%     for j= 1:640
%         temp=dec2bin(R(i,j),8);
%         new(1:3)=temp(1:3);
% 
%         temp=dec2bin(G(i,j),8);
%         new(4:6)=temp(1:3);
% 
%         temp=dec2bin(B(i,j),8);
%         new(7:8)=temp(1:2);
%         
%         ALL(i,j)=bin2dec(new);
%     end
% end
% F1= ALL(1:120,:,:);
% F2= ALL(121:240,:,:);
% F3= ALL(241:360,:,:);
% F4= ALL(361:480,:,:);
% 
% F1=transpose(F1);
% F2=transpose(F2);
% F3=transpose(F3);
% F4=transpose(F4);
% 
% fileID = fopen('foto1.tv','w');
% fprintf(fileID,"%X\n",F1);
% fclose(fileID);
% imshow(F1);
% 
% fileID = fopen('foto2.tv','w');
% fprintf(fileID,"%X\n",F2);
% fclose(fileID);
% 
% fileID = fopen('foto3.tv','w');
% fprintf(fileID,"%X\n",F3);
% fclose(fileID);
% 
% fileID = fopen('foto4.tv','w');
% fprintf(fileID,"%X\n",F4);
% fclose(fileID);
% 
% figure;
% imshow(F1);
% hold on;
% figure;
% imshow(F2);
% hold on;figure;
% imshow(F3);
% hold on;figure;
% imshow(F4);
% hold on;
% 
% 
% 
% 
% base_foto=imread("yellow3.png");
% 
% 
% R = base_foto(:,:,1);
% G = base_foto(:,:,2);
% B = base_foto(:,:,3);
% 
% 
% for i= 1:30
%     for j= 1:30
%         temp=dec2bin(R(i,j),8);
%         new(1:3)=temp(1:3);
% 
%         temp=dec2bin(G(i,j),8);
%         new(4:6)=temp(1:3);
% 
%         temp=dec2bin(B(i,j),8);
%         new(7:8)=temp(1:2);
%         
%         ALL(i,j)=bin2dec(new);
%     end
% end
%     ALL=transpose(ALL);
%     
% 
% fileID = fopen('yellow3.tv','w');
% fprintf(fileID,"%X\n",ALL);
% fclose(fileID);
% imshow(ALL);












file_number=["white_0.png" "white_1.png" "white_2.png" "white_3.png" "white_4.png" "white_5.png" "white_6.png" "white_7.png" "white_8.png" "white_9.png"  ];
write_number=["zero.tv" "one.tv" "two.tv" "three.tv" "four.tv" "five.tv" "six.tv" "seven.tv" "eight.tv" "nine.tv"];

for i = 1:10
    image=file_number(i);
    tvfile=write_number(i);
   
    base_foto=imread(image);
   
    R = base_foto(:,:,1);
    G = base_foto(:,:,2);
    B = base_foto(:,:,3);
    
    
    for i= 1:15
        for j= 1:9
            temp=dec2bin(R(i,j),8);
            new(1:3)=temp(1:3);
    
            temp=dec2bin(G(i,j),8);
            new(4:6)=temp(1:3);
    
            temp=dec2bin(B(i,j),8);
            new(7:8)=temp(1:2);
            
            ALL(i,j)=bin2dec(new);
        end
    end
     ALL_t=transpose(ALL);
        
    
    fileID = fopen(tvfile,'w');
    fprintf(fileID,"%X\n",ALL_t);
    fclose(fileID);
    imshow(ALL);
end
