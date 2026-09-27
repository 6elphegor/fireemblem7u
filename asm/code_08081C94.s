	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMovingHelpBox
StartMovingHelpBox: @ 0x08081C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08081CB0 @ =0x08CC204C
	bl Proc_StartBlocking
	ldr r2, _08081CB4 @ =0x0203E694
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081CB0: .4byte 0x08CC204C
_08081CB4: .4byte 0x0203E694
