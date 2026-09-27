	.include "macro.inc"

	.syntax unified

	thumb_func_start SetHelpBoxInitPosition
SetHelpBoxInitPosition: @ 0x08081DCC
	push {r4, r5, lr}
	ldr r4, _08081DEC @ =0x0203E694
	movs r5, #0
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r1, r1, r3
	movs r5, #2
	ldrsh r3, [r4, r5]
	lsls r3, r3, #3
	adds r2, r2, r3
	strh r1, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08081DEC: .4byte 0x0203E694
