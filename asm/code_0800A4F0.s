	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkBgSync
TalkBgSync: @ 0x0800A4F0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _0800A504
	adds r0, r4, #0
	bl EnableBgSync
_0800A504:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
