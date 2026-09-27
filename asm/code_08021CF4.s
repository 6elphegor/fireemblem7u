	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021CF4
sub_08021CF4: @ 0x08021CF4
	push {lr}
	ldr r2, _08021D20 @ =0x0203A85C
	movs r0, #2
	strb r0, [r2, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r2, #0xd]
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08021D14
	ldrb r0, [r1]
	strb r0, [r2, #0x13]
	ldrb r0, [r1, #1]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #3]
	strb r0, [r2, #0x15]
_08021D14:
	ldr r0, _08021D24 @ =0x08B96D5C
	bl Proc_EndEach
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0
_08021D20: .4byte 0x0203A85C
_08021D24: .4byte 0x08B96D5C
