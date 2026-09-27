	.include "macro.inc"

	.syntax unified

	thumb_func_start AiSetDecision
AiSetDecision: @ 0x08034E50
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r6, [sp, #0x18]
	ldr r4, [sp, #0x1c]
	mov r8, r4
	ldr r4, [sp, #0x20]
	mov sb, r4
	ldr r4, _08034E8C @ =0x0203A97C
	ldr r5, _08034E90 @ =0x0202BD48
	ldrb r5, [r5]
	strb r5, [r4, #1]
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	strb r2, [r4]
	strb r3, [r4, #6]
	strb r6, [r4, #7]
	mov r0, r8
	strb r0, [r4, #8]
	mov r0, sb
	strb r0, [r4, #9]
	movs r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034E8C: .4byte 0x0203A97C
_08034E90: .4byte 0x0202BD48
