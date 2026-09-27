	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemList_Init
PrepItemList_Init: @ 0x0809750C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08097550 @ =0x08CC3BDC
	bl Proc_Find
	movs r2, #0
	movs r1, #0
	strh r1, [r4, #0x36]
	movs r1, #0xff
	strh r1, [r4, #0x34]
	adds r0, #0x31
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	subs r1, #2
	movs r0, #4
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	strb r2, [r0]
	movs r2, #0
	adds r0, #8
	movs r1, #8
_0809753C:
	strh r2, [r0]
	strh r2, [r0, #0x12]
	adds r0, #2
	subs r1, #1
	cmp r1, #0
	bge _0809753C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08097550: .4byte 0x08CC3BDC
