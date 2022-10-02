org 100h ;Defines where the machine code is to be placed in the memory.
include emu8086.inc ;Defines macros and procedures.
.data   ;Declare variables.
a dw ?
b dw ?
c dw ?
d dw ?
num1 dw ?
num2 dw ?
;13,10,'$' are non-printable characters. 
;Called as carriage return-line feed. 
;These character are used to control the cursor position.
;The 10 shifts cursor on new line with same column number.
;And 13 returns the cursor to its initial position of line that is at start of the line.
cal dw '          Scientific Calculator',13, 10 ,'$' 
select dw 'What operation do you want to perform? ',13,10,'$'
option1 dw 'Press a for Addition.',13,10,'$'
option2 dw 'Press b for Subtraction.',13,10,'$'
option3 dw 'Press c for Multiplication.',13,10,'$'
option4 dw 'Press d for Division.',13,10,'$'
option5 dw 'Press e for Square.',13,10,'$'
option6 dw 'Press f for Cube.',13,10,'$'
option7 dw 'Press g for Power of n.',13,10,'$'
option8 dw 'Press h for Complex Addition (a+bi)+(c+di).',13,10,'$'
option9 dw 'Press i for Complex subtraction (a+bi)-(c+di).',13,10,'$'
option10 dw 'Press j for Complex Multiplication (a+bi*-(c+di).',13,10,'$'
option11 dw 'Press k for Complex Division (a+bi)/(c+di).',13,10,'$'
option12 dw 'Press l for Factorial.',13,10,'$'
option13 dw 'Press m for Sin(0).',13,10,'$'
option14 dw 'Press n for Cos(0).',13,10,'$'
option15 dw 'Press o for Tan(0).',13,10,'$'  
option16 dw 'Press p for Incrementing a value.',13,10,'$'
option17 dw 'Press q for decrementing a value.',13,10,'$'
option18 dw 'Press r for Percentage.',13,10,'$'      
exit    dw 'Press any other key to exit the calculator.',13,10,'$'
.code   ;Write code.
main proc
    ; MENU function
    menu:
    ;Displaying the menu for the user.   
    lea dx, cal    ;lea= load effective address.Used to put a memory address into the destination. It gets the offset address of the variable. 
    call print_line  
    
    lea dx, select
    call print_line;Calls the print_line procedure. 

    lea dx, option1
    call print_line   
       
    lea dx, option2
    call print_line   
       
    lea dx, option3
    call print_line   
       
    lea dx, option4
    call print_line   
       
    lea dx, option5
    call print_line   
       
    lea dx, option6
    call print_line
        
    lea dx, option7
    call print_line   
       
    lea dx, option8
    call print_line   
       
    lea dx, option9
    call print_line   
       
    lea dx, option10
    call print_line   
       
    lea dx, option11
    call print_line   
       
    lea dx, option12
    call print_line
    
    lea dx, option13
    call print_line
    
    lea dx, option14
    call print_line
    
    lea dx, option15
    call print_line
    
    lea dx, option16
    call print_line
    
    lea dx, option17
    call print_line
    
    lea dx, option18
    call print_line
        
    lea dx, exit
    call print_line 
    
    ;Asking the user to make a choice.    
    call get_choice ;calls the get_choice procedure. 
    printn      
    
    cmp al,61h ;Comaparing the value present in the al after the user pressed a key with the already defined immediate value.
    je addition;je= jump if equal.
        
    cmp al,62h
    je subtraction
        
    cmp al,63h        
    je multiplication
        
    cmp al,64h
    je division      
                     
    cmp al,65h
    je square
        
    cmp al,66h
    je cube
        
    cmp al,67h
    je power_n
        
    cmp al,68h
    je complex_add

    cmp al,69h
    je complex_sub
       
    cmp al,6Ah
    je complex_mul
        
    cmp al ,6Bh
    je complex_div

    cmp al,6Ch
    je factorial 
    
    cmp al,6Dh
    je sin
    
    cmp al,6Eh
    je cos 
    
    cmp al,6Fh 
    je tan
    
    cmp al,70h 
    je incr
    
    cmp al,71h 
    je decr
    
    cmp al,72h 
    je per
    
    ;The program will terminate if pressed anyother key.
    end:     
       mov ax, 4C00h ;Halt program and return control to the operating system.
       int 21h       ;Interrupt generated to call the subprogram.
       
    ;ADDITION
    addition:
    print '  Enter the first operand: '
    call scan_num 
    mov num1,cx
    printn
    
    print '  Enter the second operand: '
    call scan_num
    mov num2,cx
    printn
    
    mov ax,num1
    add ax,num2   
    print '  Answer= '
    call print_num  
    printn
    jmp end
    
    ;SUBTRACTION
    subtraction:
    print '  Enter the first operand: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the second operand: '
    call scan_num
    mov num2,cx
    printn
    
    mov ax,num1
    sub ax,num2   
    print '  Answer= '
    call print_num 
    printn
    jmp end
    
    ;MULTIPLICATION
    multiplication:
    print '  Enter the first operand: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the second operand: '
    call scan_num
    mov num2,cx
    printn
    
    mov ax,num1
    mul num2  
    print '  Answer= '
    call print_num  
    printn
    jmp end
    
    ;DIVISION
    division:
    print '  Enter the first operand: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the second operand: '
    call scan_num
    mov num2,cx
    mov bx,num2
    printn
    
    mov ax,num1
    div bl   
    print '  Answer= '
    call print_num  
    printn
    jmp end
    
    ;SQUARE
    square:
    print '  Enter the number: '
    call scan_num
    mov num1,cx
    printn
    mov ax,num1
    mul ax   
    print '  Answer= '
    call print_num
    printn
    jmp end
    
    ;CUBE  
    cube: 
    print '  Enter the number: '
    call scan_num
    mov num1,cx  
    printn
    
    mov ax,num1 
    mov bx,ax  
    mul ax
    mul bx 
       
    print '  Answer= '
    call print_num
    printn
    jmp end
    
    ;POWER OF N 
    power_n: 
    print '  Enter the value of the base: '
    call scan_num
    mov num1,cx
    printn
    print '  Enter the value of the exponent: '
    call scan_num
    mov num2,cx
    printn
    mov ax,num1
    mov bx,num2
    cmp bx,1 ;if the power is equal to 1 it will jump to the answer and simply print the base.
    je answer
    cmp bx,0 ;if the power is equal to 0 it will jump to the n0 function and print 1.
    je n0
    mov cx,bx
    mov bx,ax
    dec cx
    pow:
        mul bx
        dec cx
        jnz pow ;jump if not equal to zero. The loop will continue to run until and unless the cx register is equal to 0. 
    
    answer: 
       print '  Answer= '
       call print_num
       printn 
       jmp end
    n0:
       print '  Answer= 1' 
       printn
    jmp end       
    
    ;COMPLEX ADDITION  
    complex_add:  
    print '  Enter the value of a: '
    call scan_num
    mov a,cx
    printn
    
    print '  Enter the value of bi: ' 
    call scan_num
    mov b,cx
    printn
             
    print '  Enter the value of c: '
    call scan_num
    mov c,cx
    printn   
    
    print '  Enter the value of di: '
    call scan_num
    mov d,cx
    printn
    
    mov ax,a
    add ax,c
    print '  Answer= '
    call print_num
    print '+'
    
    mov ax,b
    add ax,d
    print '('
    call print_num
    print ')i'
    printn
    jmp end
    
    ;COMPLEX SUBTRACTION 
    complex_sub:   
        print '  Enter the value of a: '
    call scan_num
    mov a,cx
    printn
    
    print '  Enter the value of bi: ' 
    call scan_num
    mov b,cx
    printn
    
    print '  Enter the value of c: '
    call scan_num
    mov c,cx
    printn   
    
    print '  Enter the value of di: '
    call scan_num
    mov d,cx
    printn
    
    mov ax,a
    sub ax,c
    print '  Answer= '
    call print_num
    print '+'
    
    mov ax,b
    sub ax,d
    print '('
    call print_num
    print ')i'
    printn
    jmp end
         
    ;COMPLEX MULTIPLICATION 
    complex_mul:    
    print '  Enter the value of a: '
    call scan_num
    mov a,cx
    printn
    
    print '  Enter the value of bi: ' 
    call scan_num
    mov b,cx
    printn
    
    print '  Enter the value of c: '
    call scan_num
    mov c,cx
    printn   
    
    print '  Enter the value of di: '
    call scan_num
    mov d,cx
    printn
    
    mov ax,a
    mul c   
    print '  Answer= '
    call print_num
    print '+'
    
    mov ax,b
    mul d
    print '('
    call print_num
    print ')i'    
    printn
    jmp end
      
    ;COMPLEX DIVISION   
    complex_div:
    print '  Enter the value of a: '
    call scan_num
    mov a,cx
    printn
    
    print '  Enter the value of bi: ' 
    call scan_num
    mov b,cx
    printn
    
    print '  Enter the value of c: '
    call scan_num
    mov c,cx 
    mov bx,c
    printn   
    
    print '  Enter the value of di: '
    call scan_num
    mov d,cx 
    mov dx,d
    printn
    
    mov ax,a
    div bl
    print '  Answer= '
    call print_num
    print '+'
    
    mov ax,b
    div dl
    print '('
    call print_num
    print ')i'
    printn
    jmp end
      
    ;FACTORIAL
    factorial:
    print '  Enter the number: '
    call scan_num
    mov num1,cx  
    printn
    
    mov ax,num1  
    cmp ax,1   ;if the value entered by the user is equal to 1 the assembler will simply jump to answer and print 1. 
    je answer1 
    cmp ax,0   ;if the value entered by the user is equal to 0 the assembler will simply jump to answer and print 0.
    je answer1
    mov cx,ax  
    dec cx
    fact:
      mul cx
      dec cx 
      jz answer1
      jmp fact
    answer1:
    print '  Answer= '
    call print_num
    printn
    jmp end
      
    ;SIN(0)
    sin:
    print '  Enter the value of perpendicular: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the value of hypotenuse: '
    call scan_num
    mov num2,cx 
    mov bx,num2
    printn
    
    mov ax,num1
    div bl  
    
    print '  Answer (in degrees)= '
    call print_num
    printn
    jmp end
      
    ;COS(0)
    cos: 
    print '  Enter the value of base: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the value of hypotenuse: '
    call scan_num
    mov num2,cx
    mov bx,num2
    printn
    
    mov ax,num1
    div bl
    
    print '  Answer (in degrees)= '
    call print_num 
    printn
    jmp end
      
    ;TAN(0) 
    tan: 
    print '  Enter the value of perpendicular: '
    call scan_num
    mov num1,cx
    printn
    
    print '  Enter the value of base: '
    call scan_num
    mov num2,cx 
    mov bx,num2
    printn
    
    mov ax,num1
    div bl
    
    print '  Answer (in degrees)= '
    call print_num 
    printn
    jmp end 
    
    ;INCREMENT 
    incr:
    print '  Enter a number: '
    call scan_num
    mov num1,cx  
    printn
    mov ax,num1
    inc ax
    print '  Answer= '
    call print_num
    printn
    jmp end
    
    ;DECREMENT
    decr:
    print '  Enter a number: '
    call scan_num
    mov num1,cx  
    printn
    mov ax,num1
    dec ax
    print '  Answer= '
    call print_num
    printn
    jmp end
    
    ;PERCENTAGE
    per:
    mov a,100
    print '  Enter obtained value: '
    call scan_num
    mov num1,cx
    printn
    print '  Enter total value: '
    call scan_num
    mov num2,cx 
    mov bx,num2
    printn
    mov ax,num1
    mul a  
    div bx
    print '  Answer= '
    call print_num
    print '%'
    jmp end
    
    ;For printing the menu.
    print_line: 
           mov ah, 9h ;Subprogram to write the string at cursor position. 
           int 21h    ;interrupt generated to call the subprogram.
           ret        ;Instruction used to return from procedure. 
    ;For asking the user to make a choice.
    get_choice:
          mov ah, 0h  ;Gets key, input.
          int 16h     ;Interrupt generated for keyboard control and read.
          mov ah, 0Eh ;This functions displays a character on the screen, advancing the cursor and scrolling the screen as necessary.
          int 10h     ;Interrupt generated for screen manipulation.
          ret   
          
    define_scan_num   ;Used by scan_num procedure.
    define_print_num  ;Used by print_num procedure.
    define_print_num_uns ;Used by print_num procedure.
    end mainp

End
ret ;Instruction is used to return to operating system.
hlt ;Halts the microprocessor.