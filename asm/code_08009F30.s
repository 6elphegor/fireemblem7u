	.include "macro.inc"

	.syntax unified

	thumb_func_start SetTalkFaceDisp
SetTalkFaceDisp: @ 0x08009F30
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _08009F80 @ =0x08193DF8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp]
	str r1, [sp, #4]
	cmp r5, #0xff
	beq _08009F76
	ldr r4, _08009F84 @ =0x08B909B8
	ldr r0, [r4]
	lsls r5, r5, #2
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	bl GetFaceDisp
	movs r1, #0x39
	rsbs r1, r1, #0
	ands r1, r0
	ldr r2, [r4]
	adds r0, r2, #0
	adds r0, #0x18
	adds r0, r0, r5
	ldr r0, [r0]
	orrs r1, r6
	ldrb r2, [r2, #0x17]
	lsls r2, r2, #2
	add r2, sp
	ldr r2, [r2]
	orrs r1, r2
	bl SetFaceDisp
_08009F76:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08009F80: .4byte 0x08193DF8
_08009F84: .4byte 0x08B909B8
