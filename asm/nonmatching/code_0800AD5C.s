	.include "macro.inc"

	.syntax unified

	thumb_func_start NewPopupCore
NewPopupCore: @ 0x0800AD5C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r1, [sp, #0x18]
	cmp r1, #0
	beq _0800AD78
	ldr r0, _0800AD74 @ =0x08B90CA0
	bl Proc_StartBlocking
	b _0800AD80
	.align 2, 0
_0800AD74: .4byte 0x08B90CA0
_0800AD78:
	ldr r0, _0800ADA4 @ =0x08B90CA0
	movs r1, #3
	bl Proc_Start
_0800AD80:
	adds r1, r0, #0
	str r4, [r1, #0x30]
	str r5, [r1, #0x2c]
	adds r0, r1, #0
	adds r0, #0x36
	strb r6, [r0]
	adds r0, #0xa
	strh r7, [r0]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	adds r2, r1, #0
	adds r2, #0x42
	strb r0, [r2]
	adds r0, r1, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800ADA4: .4byte 0x08B90CA0
