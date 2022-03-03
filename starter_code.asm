.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R6 , STACK_P
;push_val(4) pushes the value 4 onto the stack [4]
AND R1, R1, #0
ADD R1, R1, #4
LD R5, PUSH_VALUE_P
JSRR R5

;push_val(3) pushes the value 3 onto the stack [4,3]

AND R1, R1, #0
ADD R1, R1, #3
LD R5, PUSH_VALUE_P
JSRR R5

;push_val(2) pushes the value 2 onto the stack [4,3,2]

AND R1, R1, #0
ADD R1, R1, #2
LD R5, PUSH_VALUE_P
JSRR R5

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]

LD R5, ADD_VALUE_P
JSRR R5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]

LD R5, ADD_VALUE_P
JSRR R5


;move the top value of the stack into r4
LDR R4, R6, #0
ADD R6, R6, #1
HALT

PUSH_VALUE_P .FILL x3400
ADD_VALUE_P .FILL x3800
STACK_P .FILL x4200
.end





.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

ST R7, BACKUP_R7_3400

ADD R6, R6, #-1
STR R1, R6, #0

LD R7, BACKUP_R7_3400

RET

BACKUP_R7_3400 .BLKW #1



.end
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack



ST R7, BACKUP_R7_3800
ST R2, BACKUP_R2_3800
ST R3, BACKUP_R3_3800

LDR R2, R6, #0
ADD R6, R6, #1
LDR R3, R6, #0
ADD R6, R6, #1
ADD R2, R2, R3
ADD R6, R6, #-1
STR R2, R6, #0

LD R7, BACKUP_R7_3800
LD R2, BACKUP_R2_3800
LD R3, BACKUP_R3_3800

RET


BACKUP_R7_3800 .BLKW #1
BACKUP_R2_3800 .BLKW #1
BACKUP_R3_3800 .BLKW #1




.end



.orig x4200 ;;data you might need

.end



