MODEL SMALL
.DATA
.STACK

MSG1 DB 'ingrese el primer numero$'
MSG2 DB 'ingrese el segundo numero$'
num1 DB ?
num2 DB ?

.CODE
    programa:
    MOV AX, @DATA
    MOV DS,AX
 
    XOR AX, AX  ;limpia AX
    MOV AH,1h   ;lee el primer numero
    INT 21h
    SUB AL,30h  ;obtener el valor real
    MOV num1,AL ;se asigna a num1 el valor ingresado

    XOR AX, AX  ;se limpia de nuevo
    MOV AH, 1h  ;lee el segundo numero
    INT 21h
    SUB AL,30h
    MOV num2, AL
    
    XOR AX,AX   ;asigna la suma
    MOV AL, num2
    MOV AH, num1
    ADD AL,AH
    MOV DL,AL

    XOR AX,AX   ;imprime la suma
    MOV AH,02h
    ADD DL,30h
    int 21h
    
    XOR DX,DX   ;asigna la resta
    MOV DL,num1
    SUB DL,num2
    
    XOR AX,AX   ;despliega la resta
    MOV AH,02h
    ADD DL,30h
    INT 21h
    
    XOR DX,DX
    XOR AX,AX
    mov AL, num1 
    mov BL, num2
    MUL BL      ;toma lo que esta en AL automaticamente y lo multiplica por BL y lo asigna a AL
    MOV DL, AL
    ADD DL, 30h
    MOV AH, 02h
    INT 21h
    
    XOR DX,DX
    XOR AX,AX
    XOR BX,BX
    MOV AL,num1
    MOV BL,num2
    DIV BL      ;se divide por BL (divisor) y el cociente se guarda en AL y residuo en AH
    MOV DL, AL
    ADD DL,30h
    MOV DH,AH
    MOV AH,02h
    INT 21h
    
    MOV DL,DH
    ADD DL, 30h
    MOV AH,02h
    INT 21h
    
    MOV AH,4Ch  ;finaliza el programa
    INT 21h
    
    END programa