%include "io64.inc"

section .text
global CMAIN
CMAIN:        
    mov rbp, rsp; for correct debugging

    ; 반복문 (while for)
    ; 특정 조건을 만족할 때까지 반복해서 실행
    
    ; ex) Hello World를 10번 출력해야한다면?
    mov ecx, 10
    
LABEL_LOOP:
    PRINT_STRING msg
    NEWLINE
    dec ecx ; sub ecx, 1과 동일
    cmp ecx, 0
    jne LABEL_LOOP
    
    ; 연습 문제) 1에서 100까지의 합을 구하는 프로그램 1+2+3+...
    
    mov eax, 100
    xor ebx, ebx
L1:
    add ebx, eax
    dec eax
    cmp eax, 0
    jne L1
    
    PRINT_DEC 4, ebx
    NEWLINE
    
    ; loop [라벨]
    ; - ecx에 반복 횟수
    ; - loop 할 때마다 ecx 1 감소. 0이면 빠져나감 아니면 라벨로 이동
    
    mov ecx, 100
    xor ebx, ebx;
LABEL_LOOP_SUM:
    add ebx, ecx
    loop LABEL_LOOP_SUM
    
    PRINT_DEC 4, ebx
    NEWLINE
    
    
    xor rax, rax
    ret
    
    ; 변수의 선언 및 사용
    ; 변수는 그냥 데이터를 저장하는 바구니 [ ]
    ; - 처음에 바구니 사용하겠다 선언 (이름과 크기를 지정)
    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8)
    
section .data
    msg db 'Hello World', 0x00
    ; 엔디안
    ; 빅 엔디안 vs 리틀엔디안
    ; - 빅 엔디안 : 숫자 비교에 유리 (큰 숫자만 비교하면 편하기 때문)
    ; - 리틀 엔디안 : 캐스팅에 유리 (작은 값을 불러오기 편함)
    

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 1
    