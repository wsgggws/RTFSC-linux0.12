;���������� 
;
;LOADER_BASE_ADDR equ 0xA000 
;LOADER_START_SECTOR equ 0x2
;------------------------------------------------------------
SECTION MBR vstart=0x7c00         
   mov ax,cs      
   mov ds,ax
   mov es,ax
   mov ss,ax
   mov fs,ax
   mov sp,0x7c00
   mov ax,0xb800
   mov gs,ax

; ����
;����0x06�Ź��ܣ��Ͼ�ȫ���У����������
; -----------------------------------------------------------
;INT 0x10   ���ܺ�:0x06	   ��������:�Ͼ�����
;------------------------------------------------------
;���룺
;AH ���ܺ�= 0x06
;AL = �Ͼ�������(���Ϊ0,��ʾȫ��)
;BH = �Ͼ�������
;(CL,CH) = �������Ͻǵ�(X,Y)λ��
;(DL,DH) = �������½ǵ�(X,Y)λ��
;�޷���ֵ��
   mov     ax, 0600h
   mov     bx, 0700h
   mov     cx, 0               ; ���Ͻ�: (0, 0)
   mov     dx, 184fh	       ; ���½�: (80,25),
			       ; ��ΪVGA�ı�ģʽ�У�һ��ֻ������80���ַ�,��25�С�
			       ; �±��0��ʼ������0x18=24,0x4f=79
   int     10h                 ; int 10h

   ; �������ɫ��ɫ��ǰ��ɫ��ɫ�������������ַ���"1 MBR"
   mov byte [gs:0x00],'R'
   mov byte [gs:0x01],0xA4     ; A��ʾ��ɫ������˸��4��ʾǰ��ɫΪ��ɫ
   mov byte [gs:0x02],'T'
   mov byte [gs:0x03],0xA4
   mov byte [gs:0x04],'F'
   mov byte [gs:0x05],0xA4   
   mov byte [gs:0x06],'S'
   mov byte [gs:0x07],0xA4
   mov byte [gs:0x08],'C'
   mov byte [gs:0x09],0xA4
   mov byte [gs:0x0A],'-'
   mov byte [gs:0x0B],0xA4     ; A��ʾ��ɫ������˸��4��ʾǰ��ɫΪ��ɫ
   mov byte [gs:0x0C],'L'
   mov byte [gs:0x0D],0xA4
   mov byte [gs:0x0E],'i'
   mov byte [gs:0x0F],0xA4   
   mov byte [gs:0x10],'n'
   mov byte [gs:0x11],0xA4
   mov byte [gs:0x12],'u'
   mov byte [gs:0x13],0xA4
   mov byte [gs:0x14],'x'
   mov byte [gs:0x15],0xA4     ; A��ʾ��ɫ������˸��4��ʾǰ��ɫΪ��ɫ
   mov byte [gs:0x16],'0'
   mov byte [gs:0x17],0xA4
   mov byte [gs:0x18],'.'
   mov byte [gs:0x19],0xA4   
   mov byte [gs:0x1A],'1'
   mov byte [gs:0x1B],0xA4
   mov byte [gs:0x1C],'2'
   mov byte [gs:0x1D],0xA4

   jmp $		       ; ͨ����ѭ��ʹ������ͣ�ڴ�

   times 510-($-$$) db 0
   db 0x55,0xaa