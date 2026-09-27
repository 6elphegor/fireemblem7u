	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08086EA8
sub_08086EA8: @ 0x08086EA8
	push {r4, lr}
	ldr r4, _08086EE4 @ =0x02022FA0
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #7
	movs r3, #0
	bl TmFillRect_thm
	adds r0, r4, #0
	adds r0, #0x18
	ldr r1, _08086EE8 @ =0x0202BBF8
	ldrh r2, [r1, #0x10]
	movs r1, #2
	bl PutNumber
	adds r4, #0x96
	bl GetGold
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	movs r0, #1
	bl EnableBgSync
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08086EE4: .4byte 0x02022FA0
_08086EE8: .4byte 0x0202BBF8
