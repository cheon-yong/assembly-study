%include "io64.inc"

section .text
global CMAIN
CMAIN:        
    mov rbp, rsp; for correct debugging

    ; 함수 (프로시저 procedure 서브루틴 subroutine)
    
    ; call PRINT_MSG
    
    mov eax, 10
    mov ebx, 15
    call MAX
    PRINT_DEC 4, ecx
    NEWLINE
    
    xor rax, rax
    ret
    
PRINT_MSG:
    PRINT_STRING msg
    NEWLINE
    ret
; ex) 두 값 중 더 큰 값을 반환하는 max
; 근데 두 값을 어떻게 넘겨받지? 반환은?
; eax와 ebx 입력값을 ecx에 반환

MAX:
    cmp eax, ebx;
    jg L1
    mov ecx, ebx;
    jmp L2
L1:
    mov ecx, eax
L2:
    ret
    
    ; 인자가 10개라면?
    ; eax, ebx에 이미 중요한 값을 사용하고 있으면?
    ; [!] .data .bss 사용하면?
    ; 인자를 몇개를 할당해야할까
    
    ; 다른 메모리 구조가 필요
    ; - 꿈이 유효한 동안에는 꿈을 유지시켜야함 (유효 범위의 개념이 필요)
    ; - 꿈이 끝나면 그 꿈을 부셔버려도 됨 (정리의 개념)
    ; - 꿈에서도 또 꿈을 꿀 수 있다는 것을 고려해야 함 (유동적으로 유효 범위가 확장 가능)
    
    
    ; [!] 스택(stack)이라는 메모리 영역을 사용
    ; 함수가 사용하는 일종의 메모장
    ; - 매개 변수 전달
    ; - 돌아갈 주소 관리
    
    
    ; 변수의 선언 및 사용
    ; 변수는 그냥 데이터를 저장하는 바구니 [ ]
    ; - 처음에 바구니 사용하겠다 선언 (이름과 크기를 지정)
    
    ; 초기화 된 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8)
    
section .data
    msg db 'Hello World', 0x00
    a db 0x01, 0x02, 0x03, 0x04, 0x05 ; 5 * 1 = 5바이트
    b times 5 dw 1 ; 5 * 2 = 10 바이트
    
    ; 초기화 되지 않은 데이터
    ; [변수이름] [크기] [초기값]
    ; [크기] resb(1) resw(2) resd(4) resq(8)
section .bss
    num resb 1
    