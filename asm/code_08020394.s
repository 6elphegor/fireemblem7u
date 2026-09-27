	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020394
sub_08020394: @ 0x08020394
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080203B0
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_080203B0:
	ldr r0, _080203CC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xb
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080203C6
	adds r0, r4, #0
	movs r1, #0x63
	bl Proc_Goto
_080203C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080203CC: .4byte 0x08B857F8
