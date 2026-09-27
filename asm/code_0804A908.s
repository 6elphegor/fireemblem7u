	.include "macro.inc"

	.syntax unified

	thumb_func_start MenuStdHelpBox
MenuStdHelpBox: @ 0x0804A908
	push {lr}
	movs r2, #0x2a
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #0x2c
	ldrsh r3, [r1, r2]
	lsls r3, r3, #3
	ldr r1, [r1, #0x30]
	ldrh r2, [r1, #6]
	adds r1, r3, #0
	bl StartHelpBox
	pop {r1}
	bx r1
