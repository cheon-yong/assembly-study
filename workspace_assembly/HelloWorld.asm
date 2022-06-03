%include "io64.inc"

section .text
global CMAIN
CMAIN:        
    mov rbp, rsp; for correct debugging

    ; 쉬프트(shift) 연산, 논리 (logical)연산
    
    mov eax, 0x12345678
    PRINT_HEX 4, eax
    NEWLINE
    shl eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    shr eax, 8
    PRINT_HEX 4, eax
    NEWLINE
    ; 응용 곱셈/나눗셈
    ; 게임서버에서 objectID를 만들 때
    
    ; 논리연산
    ; not and or xor
    
    ; 조건A : 잘생겼다
    ; 조건B : 키가크다
    
    ; not A : 잘생겼다의 반대 -> (0이면 1, 1이면 0)
    ; A and B : 잘생겼고 and 키도 크고 -> 둘다 1이면 1, 아니면 0
    ; A or B : 잘생겼거나 or 키가 크거나 -> 둘 중 하나라도 1이면 1, 아니면 0
    ; A xor B : 잘생기고 작거나 or 못생기고 크거나 -> 둘다 1이거나 둘다 0이면 0, 아니면 1
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    and al, bl ; al = al and bl
    PRINT_HEX 1, al
    NEWLINE
    
    not al
    PRINT_HEX 1, al
    NEWLINE
    
    ; 응용 사례 : bitflag
    
    mov al, 0b10010101
    mov bl, 0b01111100
    
    NEWLINE
    PRINT_HEX 1, al
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    xor al, bl
    PRINT_HEX 1, al
    NEWLINE
    ; 동일한 값으로 xor 두번하면 자기 자신으로 되돌아오는 특성
    ; 암호학에서 유용하다! (value xor key)
    
    ; 자기 자신을 xor하면 0 mov보다 빠름
    xor al, al
    PRINT_HEX 1, al
    
    xor rax, rax
    ret
    
    ; 변수의 선언 및 사용
    ; 변수는 그냥 데이터를 저장하는 바구니 [ ]
    ; - 처음에 바구니 사용하겠다 선언 (이름과 크기를 지정)
    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8)
    
;section .data

    ; 엔디안
    ; 빅 엔디안 vs 리틀엔디안
    ; - 빅 엔디안 : 숫자 비교에 유리 (큰 숫자만 비교하면 편하기 때문)
    ; - 리틀 엔디안 : 캐스팅에 유리 (작은 값을 불러오기 편함)
    

    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 1
    