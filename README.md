# Scientific Calculator

The first module of the code is the menu which displays a number of mathematical operations for the user to perform. Then the user is asked to input their choice of which operation they want to perform. After the input, the assembler jumps to the appropriate procedure to perform the required operation. The code contains the following:

## Directives:

The directives used in our code are:
- ORG 100h: The directive used is Org 100h which defines where the machine code is to 
be placed in the memory.
- INCLUDE: Used to include register definitions or declarations for external routines, 
variables, or macros.
- .DATA: This directive is used to declare data variable.
- .CODE: This directive is used to write the code.
- END: This directive is used to terminate the program.

## Libraries:

The library used is include emu8086.inc which defines the following macros:
- PRINT string
- PRINTN string
And also defines the following procedures:
- PRINT_NUM, used as DEFINE_PRINT_NUM before END directive.
- PRINT_NUM_UNS, used as DEFINE_PRINT_NUM_UNS before END directive.
- SCAN_NUM, used as DEFINE_SCAN_NUM before END directive.

## Instructions:
The instructions used are:
- LEA: Used to put a memory address into the destination. It gets the offset address of the 
variable.
- MOV: Used to put a source value into destination. Source can be a register, memory 
location, immediate value. And the destination can be a register or a memory location.
- CMP: Used to compare two operands. 
- JMP: Allows the compiler to jump a specified procedure.
- JE: Jump if equal instruction.
- JNZ: Jump if not zero instruction.
- JZ: Jump if zero instruction.
- CALL: Used to call a procedure.
- ADD: Adds two operands.
- SUB: Subtracts two operands.
- MUL: Multiplies two operands.
- DIV: Divides two operands.
- INC: Increments an operand.
- DEC: Decrements an operand.
- INT: Instruction used to generate an interrupt.
- RET: Instruction used to return to operating system.
- HLT: Instruction used to halt the microprocessor.

## Registers:
Registers are a series of memory cells inside the CPU itself. We utilized all the four generalpurpose registers in our code. The four general-purpose registers are:
- AX: Accumulator Register
- BX: Base Register
- CX: Counter Register
- DX: Data Register

## Procedures:
Procedure is a part of code that can be called from your program in order to make some specific tasks. Procedures make program more structural and easier to understand. The main procedures and their vrief descriptions in our program are as follows:

### Addition: 

This module asks the user to enter two operands using the scan_num procedure and then adds them using the ADD instruction and then prints the answer using the print_num procedure.

### Subtraction: 

This module asks the user to enter two operands using the scan_num procedure and then subtracts them using the SUB instruction and then prints the answer using the print_num procedure.

### Multiplication: 

This module asks the user to enter two operands using the scan_num procedure and then multiplies them using the MUL instruction and then prints the answer using the print_num procedure.

### Division: 

This module asks the user to enter two operands using the scan_num procedure and then divides them using the DIV instruction and the prints then answer using the print_num procedure.

### Square: 

This module asks the user to enter a single operand using the scan_num procedure. And then moves the value of the operand into ax register using MOV instruction and then multiplies ax register with itself. And then prints the answer using the print_num procedure.

### Cube: 

This module asks the user to enter a single operand using the scan_num procedure. And then moves the value of the operand into ax register. Then moves the value of ax register into bx register and multiply it with ax register and then multiply it with bx register. And then prints the answer using the print_num procedure.

### Power of n: 

This module asks the user to enter the base value and then to enter the exponent value. It then moves the base value into ax register and the exponent value into bx register. It then compares the value of bx register with 1 and 0 and jumps according to the value and displays the answer. If the value in bx register is other than 1 and 0 then the assembler moves to the loop and displays the answer accordingly.

### Complex Addition: 

This module asks the user to input two equations containing real part and imaginary part and adds them and displays the answer.

### Complex Subtraction: 

This module asks the user to input two equations containing real part and imaginary part and subtracts them and displays the answer.

### Complex Multiplication: 

This module asks the user to input two equations containing real part and imaginary part and multiplies them and displays the answer.

### Complex Division: 

This module asks the user to input two equations containing real part and imaginary part and divides them and displays the answer.

### Factorial: 

This module asks the user to input a value. This valued is moved into the ax register and ax register is compared with 0 and 1 and the answer is displayed according to the condition. If the value is other than 0 and 1 then the assembler moves to the loop and prints the answer according to the input.

### Sin (θ): 

This module asks the user to input the value of perpendicular and hypotenuse and divides them. It then displays the answer in degrees.

### Cos (θ): 

This module asks the user to input the value of base and hypotenuse and divides them. It then displays the answer in degrees.

### Tan (θ): 

This module asks the user to input the value of perpendicular and base and divides them. It then displays the answer in degrees.

### Increment: 

This module asks the user to input a number and increments that value by 1 using INC instruction.

### Decrement: 

This module asks the user to input a number and decrements that value by 1 using DEC instruction.


### Percentage: 
This module asks the user to enter the obtained value and the total value which is moved into the bx register. It then moves the obtained value into the ax register and multiplies it with 100 and then divided by the bx register. It then displays the answer.


## Essentials for the code
- EMU 8086 software
- Basic knowledge about Assembly language
