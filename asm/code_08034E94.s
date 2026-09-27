	.include "macro.inc"

	.syntax unified

	thumb_func_start AiUpdateDecision
AiUpdateDecision: @ 0x08034E94
	push {r4, r5, lr}
	ldr r4, [sp, #0xc]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r1, _08034ED8 @ =0x0203A97C
	cmp r0, #0xff
	beq _08034EB4
	strb r0, [r1]
_08034EB4:
	cmp r5, #0xff
	beq _08034EBA
	strb r5, [r1, #6]
_08034EBA:
	cmp r2, #0xff
	beq _08034EC0
	strb r2, [r1, #7]
_08034EC0:
	cmp r3, #0xff
	beq _08034EC6
	strb r3, [r1, #8]
_08034EC6:
	cmp r4, #0xff
	beq _08034ECC
	strb r4, [r1, #9]
_08034ECC:
	movs r0, #1
	strb r0, [r1, #0xa]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08034ED8: .4byte 0x0203A97C
