%include "io64.inc"

section .text
global CMAIN
CMAIN:        
    mov rbp, rsp; for correct debugging

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

    a db 0x11 ; [0x11]
    
    b dd 0x12345678

    ; 엔디안
    ; 빅 엔디안 vs 리틀엔디안
    ; - 빅 엔디안 : 숫자 비교에 유리 (큰 숫자만 비교하면 편하기 때문)
    ; - 리틀 엔디안 : 캐스팅에 유리 (작은 값을 불러오기 편함)
    

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    e resb 10
    