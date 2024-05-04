                              INCLUDE EMU8086.INC  

   

org 100h     




.data       ;Data Segment

msg_intro db ' 0 --> Rotate Left', 0dh,0ah, ' 1 --> Addition', 0dh,0ah, ' 2 --> Subtration', 0dh,0ah, ' 3 --> Multiplication', 0dh,0ah, ' 4 --> Division', 0dh,0ah, ' 5 --> Mod', 0dh,0ah,' 6 --> Negation', 0dh,0ah, ' 7 --> Square', 0dh,0ah, ' 8 --> Cube', 0dh,0ah, ' 9 --> OR', 0dh,0ah,  '$'

msg_R db 'Result of Rotate Left = $', 0dh,0ah  
msg_A db 'Result of ADDITION = $', 0dh,0ah       
msg_S db 'Result of SUBTRACTION = $', 0dh,0ah
msg_M db 'Result of MULTIPLICATION = $', 0dh,0ah
msg_D db 'Result of DIVISION = $', 0dh,0ah
msg_MD db 'Result of MODULUS = $', 0dh,0ah  
msg_N db 'Result of NEG value = $', 0dh,0ah      
msg_SQ db 'Result of SQUARE = $', 0dh,0ah
msg_CB db 'Result of CUBE = $', 0dh,0ah  
msg_OR db 'Result of Logical OR = $', 0dh,0ah

cont db 10,13,'Do you want to Use Again ? $'   
bye db '       **** Thank You :) **** $'
      
val1 dw ?      
val2 dw ?       
res dw ?
agn dw ?

.code       ;Code Segment
MAIN PROC
    
MOV AX, @data
MOV DS, AX


Start:          ;Start Loop 

printn
print '      __________/------------< ALU 8086 >-------------\__________    '  
printn      
 
printn
MOV AH,9
MOV DX, OFFSET msg_intro
INT 21h                                          

print 'Select Any Option : '
CALL scan_num
printn
printn



CMP CX, 0
JE Rotate         ;Jumps to Exit Func if input is equal to 0


CMP CX, 1
JE Addition     ;Jumps to Addition if input is equal to 1


CMP CX, 2
JE Subtraction     ;Jumps to Substraction if input is equal to 2
   
   
CMP CX, 3
JE Multiplication     ;Jumps to Multiplication if input is equal to 3


CMP CX, 4
JE Division     ;Jumps to Division if input is equal to 4


CMP CX, 5
JE Modulus     ;Jumps to Modulus if input is equal to 5


CMP CX, 6
JE Negation     ;Jumps to Negation if input is equal to 6


CMP CX, 7
JE Square     ;Jumps to Square if input is equal to 7


CMP CX, 8 
JE Cube     ;Jumps to Cube if input is equal to 8


CMP CX, 9 
JE _OR     ;Jumps to OR Func if input is equal to 8
                
                
Rotate:
print '     ------[Rotate Left]------'
printn  
printn
print 'Enter Number: '
CALL scan_num       
MOV val1, CX           

printn      

MOV AX, val1        
ROL AX, 01h       
MOV res, AX         

printn
MOV AH,9
MOV DX, OFFSET msg_R
INT 21h             

MOV AX, res         
CALL print_num      
                        
JMP Con 



               

Addition:       ;Addition Funtions

print '     ------[Addition]------'
printn  
printn
print 'Enter First Number: '
CALL scan_num       
MOV val1, CX           

printn      

print 'Enter Second Number: '
CALL scan_num       
MOV val2, CX        
printn

MOV AX, val1        
ADD AX, val2        
MOV res, AX         

printn
MOV AH,9
MOV DX, OFFSET msg_A
INT 21h             

MOV AX, res         
CALL print_num      
                        
JMP Con                            


Subtraction:        ;Subtraction Func

print '     ------[Subtraction]------' 
printn   
printn
print 'Enter First Number: '
CALL scan_num      
MOV val1, CX         

printn       

print 'Enter Second Number: '
CALL scan_num      
MOV val2, CX       
printn

MOV AX, val1      
SUB AX, val2     
MOV res, AX     

printn
MOV AH,9
MOV DX, OFFSET msg_S   
INT 21h                

MOV AX, res           
CALL print_num        

JMP Con                              


Multiplication:        ;Multiplication Func

print '     ------[Multiplication]------'
printn 
printn
print 'Enter First Number: '
CALL scan_num       
MOV val1, CX         

printn       

print 'Enter Second Number: '
CALL scan_num       
MOV val2, CX        
printn

MOV AX, val1        
MUL val2            
MOV res, AX         

printn
MOV AH,9
MOV DX, OFFSET msg_M   
INT 21h                

MOV AX, res             
CALL print_num          

JMP Con                 


Division:        ;Division Func

print '     ------[Division]------' 
printn
printn
print 'Enter First Number: '
CALL scan_num       
MOV val1, CX        
MOV AX, val1        

printn      

print 'Enter Second Number: '
CALL scan_num       
MOV val2, CX          
MOV BX, val2
printn

CMP BX, 0       
JE Error

MOV DX, 0           

DIV BX            
MOV res, AX        

printn
MOV AH,9
MOV DX, OFFSET msg_D    
INT 21h                 

MOV AX, res             
CALL print_num          

JMP Con                 

        
Modulus:    

print '     ------[Modulus]------' 
printn
printn
print 'Enter First Number: '
CALL scan_num      
MOV val1, CX       
MOV AX, val1         

printn      

print 'Enter Second Number: '
CALL scan_num       
MOV val2, CX           
MOV BX, val2
printn

MOV DX, 0           

DIV BX            
MOV res, DX          

printn
MOV AH,9
MOV DX, OFFSET msg_MD    
INT 21h                

MOV AX, res             
CALL print_num          

JMP Con                 


Negation:        

print '     ****--Negation--****'
printn
printn
print 'Enter Number: '
CALL scan_num      
MOV val1, CX         

printn      

MOV AX, val1        
NEG AX              
MOV res, AX         

printn
MOV AH,9
MOV DX, OFFSET msg_N    
INT 21h                 

MOV AX, res             
CALL print_num          

JMP Con                 


Square:       

print '     ****--Square--****'  
printn 
printn
print 'Enter Number: '
CALL scan_num       
MOV val1, CX         

printn     

MOV AX, val1        
MUL AX              
MOV res, AX        

printn
MOV AH,9
MOV DX, OFFSET msg_SQ   
INT 21h

MOV AX, res
CALL print_num         

JMP Con                

  
Cube:                           

print '     ****--Cube--****'
printn
printn
print 'Enter Number: '
CALL scan_num      
MOV val1, CX          

printn     

MOV AX, val1
MUL val1  
MUL val1
MOV res, AX

printn
MOV AH,9
MOV DX, OFFSET msg_CB   
INT 21h                

MOV AX, res
CALL print_num

JMP Con             
        

_OR:           

print '     ****--OR--****'
printn
printn
print 'Enter First Number: '
CALL scan_num       
MOV val1, CX       

printn      

print 'Enter Second Number: '
CALL scan_num      
MOV val2, CX        
printn

MOV AX, val1
OR AX, val2
MOV res, AX

printn
MOV AH,9
MOV DX, OFFSET msg_OR   
INT 21h                

MOV AX, res
CALL print_num         

JMP Con            

Error:      

printn
print 'Cannot be divided by 0. ' 
print 'Undefined'
printn
JMP Con


Con:            ;Continue Func
 
printn
MOV AH,9
MOV DX, OFFSET cont    
INT 21h                 ;Calling Interrupt

printn
print '(Yes = 1 / No = 0) : '
CALL scan_num          
MOV agn, CX
printn      
printn

CMP agn, 1
JE Start            ;Jumps to Start Func if input is equal to 1                    

CMP agn, 0
JE _Bye             ;Jumps to Bye Func if input is equal to 0
printn


_Bye:       ;EXIT Func


printn
MOV AH,9
MOV DX, OFFSET bye    
INT 21h 


MAIN ENDP     


DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS


END main          

HLT                                                   
ret         
