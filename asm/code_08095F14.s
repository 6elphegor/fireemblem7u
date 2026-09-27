	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08095F14
sub_08095F14: @ 0x08095F14
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x38]
	movs r0, #0xff
	strh r0, [r4, #0x36]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _08095F32
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #1
	b _08095F38
_08095F32:
	adds r1, r4, #0
	adds r1, #0x33
	movs r0, #0
_08095F38:
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	bne _08095F58
	ldr r0, _08095F54 @ =0x08CC3BDC
	bl Proc_Find
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x35
	b _08095F5E
	.align 2, 0
_08095F54: .4byte 0x08CC3BDC
_08095F58:
	adds r1, r4, #0
	adds r1, #0x35
	movs r0, #0
_08095F5E:
	strb r0, [r1]
	adds r2, r4, #0
	adds r2, #0x32
	movs r1, #0
	movs r0, #4
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x31
	strb r1, [r0]
	movs r3, #0
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, #9
	movs r2, #8
_08095F7A:
	strh r3, [r0]
	strh r3, [r1]
	adds r1, #2
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _08095F7A
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
