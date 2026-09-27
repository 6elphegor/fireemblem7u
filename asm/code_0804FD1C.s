	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FD1C
sub_0804FD1C: @ 0x0804FD1C
	push {r4, r5, lr}
	ldr r0, _0804FD4C @ =0x08B9AF94
	movs r1, #4
	bl Proc_Start
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	strh r0, [r4, #0x2c]
	movs r0, #4
	strh r0, [r4, #0x2e]
	ldr r5, _0804FD50 @ =0x02017778
	ldr r0, [r5]
	cmp r0, #0
	beq _0804FD42
	bl Proc_End
_0804FD42:
	str r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FD4C: .4byte 0x08B9AF94
_0804FD50: .4byte 0x02017778
