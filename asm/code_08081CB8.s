	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMovingHelpBoxExt
StartMovingHelpBoxExt: @ 0x08081CB8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _08081CD4 @ =0x08CC204C
	bl Proc_StartBlocking
	ldr r1, _08081CD8 @ =0x0203E694
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08081CD4: .4byte 0x08CC204C
_08081CD8: .4byte 0x0203E694
