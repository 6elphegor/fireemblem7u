	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804057C
sub_0804057C: @ 0x0804057C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080405B4 @ =0x08B9A0E8
	bl Proc_Find
	cmp r0, #0
	bne _080405AE
	ldr r5, _080405B8 @ =0x0203D90C
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _0804059A
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_0804059A:
	ldrb r5, [r5, #0xb]
	cmp r5, #2
	bne _080405A8
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_080405A8:
	adds r0, r4, #0
	bl Proc_Break
_080405AE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080405B4: .4byte 0x08B9A0E8
_080405B8: .4byte 0x0203D90C
