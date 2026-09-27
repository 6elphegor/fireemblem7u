	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBgCt
GetBgCt: @ 0x08001348
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r1, r7, #0
	strh r0, [r1]
	adds r1, r7, #0
	ldrh r0, [r1]
	cmp r0, #1
	beq _08001378
	cmp r0, #1
	bgt _08001364
	cmp r0, #0
	beq _0800136E
	b _08001390
_08001364:
	cmp r0, #2
	beq _08001380
	cmp r0, #3
	beq _08001388
	b _08001390
_0800136E:
	ldr r0, _08001374 @ =0x0300287C
	b _08001390
	.align 2, 0
_08001374: .4byte 0x0300287C
_08001378:
	ldr r0, _0800137C @ =0x03002880
	b _08001390
	.align 2, 0
_0800137C: .4byte 0x03002880
_08001380:
	ldr r0, _08001384 @ =0x03002884
	b _08001390
	.align 2, 0
_08001384: .4byte 0x03002884
_08001388:
	ldr r0, _0800138C @ =0x03002888
	b _08001390
	.align 2, 0
_0800138C: .4byte 0x03002888
_08001390:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1
