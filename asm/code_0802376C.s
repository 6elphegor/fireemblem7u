	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802376C
sub_0802376C: @ 0x0802376C
	push {r4, lr}
	ldr r4, _08023798 @ =0x0203A85C
	adds r1, #0x3c
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, _0802379C @ =0x03004690
	ldr r0, [r0]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023798: .4byte 0x0203A85C
_0802379C: .4byte 0x03004690
